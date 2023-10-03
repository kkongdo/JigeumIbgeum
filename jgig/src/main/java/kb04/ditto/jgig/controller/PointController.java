package kb04.ditto.jgig.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kb04.ditto.jgig.entity.MemberDto;
import kb04.ditto.jgig.entity.PointDto;
import kb04.ditto.jgig.mapper.MemberMapper;
import kb04.ditto.jgig.mapper.PointMapper;

@Controller
public class PointController {
	@Autowired
	private PointMapper pointMapper;

	@Autowired
	private MemberMapper memberMapper;

	// 초기 총 포인트 계산 및 모델에 추가
	@ModelAttribute("totalPoint")
	public int totalPoint(HttpSession session) {
		String memId = (String) session.getAttribute("mem_id");

		if (memId != null) {
			List<PointDto> pointList = pointMapper.getPointByMemberId(memId);
			return calculateTotalPoint(pointList);
		}

		return 0; // 로그인되지 않은 경우 총 포인트는 0으로 설정
	}

	// 회원 이름 가져오기
	@ModelAttribute("memberName")
	public String memberName(HttpSession session) {
		String memId = (String) session.getAttribute("mem_id");

		if (memId != null) {
			MemberDto member = memberMapper.detail(memId);
			return member.getMem_nm();
		}

		return ""; // 로그인되지 않은 경우 회원 이름은 빈 문자열로 설정
	}

	@GetMapping("/jgig/point_list") // 포인트 내역 조회 페이지
	public String pointListPage(HttpSession session) {
		String memId = (String) session.getAttribute("mem_id");
		if (memId == null) {
			return "redirect:/jgig/login";
		}

		return "point/list";
	}

	@PostMapping("/jgig/point_list") // 필터링된 포인트 내역 조회
	public String filterPointList(@RequestParam("filter") String filter, HttpSession session, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage, Model model) {
		String memId = (String) session.getAttribute("mem_id");
		int size = 5;
		
		int total = pointMapper.getFilteredPointByMemberId(memId, filter);
		
		// 전체 페이지 개수
		int totalPages = total / size;
		if(total % size > 0) {
			totalPages++;
		}
		
		int startPage = currentPage / size * size + 1;
		if(currentPage % size == 0) {
			startPage -= size;
		}
		
		int endPage = startPage + (size - 1);
		if(endPage > totalPages) {
			endPage = totalPages;
		}
		
		boolean hasPrevious = currentPage > 1;
        boolean hasNext = currentPage < totalPages;
	    
		if (memId != null) {
			List<PointDto> pointList = pointMapper.listWithPaging(memId, filter, currentPage*size-size+1, currentPage*size);
			
			for(PointDto dto : pointList) {
				System.out.println(dto);
			}
			
			System.out.println(startPage);
			System.out.println(endPage);
			
			model.addAttribute("total", total);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("size", size);

			model.addAttribute("hasPrevious", hasPrevious);
			model.addAttribute("hasNext", hasNext);
		        
			model.addAttribute("pointList", pointList);
			model.addAttribute("filter", filter); // 필터링 옵션 유지
			return "point/list_filter";
		}

		return "redirect:/jgig/login";
	}

	// 포인트 내역의 총 포인트 계산
	private int calculateTotalPoint(List<PointDto> pointList) {
		int totalPoint = 0;
		for (PointDto point : pointList) {
			totalPoint += point.getPoint();
		}
		return totalPoint;
	}

	@GetMapping("/jgig/point_conversion") // 포인트 전환 페이지
	public String pointConversionPage(Model model, HttpSession session) {
		String memId = (String) session.getAttribute("mem_id");
		if (memId != null) {
			int totalPoint = calculateTotalPoint(pointMapper.getPointByMemberId(memId));
			model.addAttribute("totalPoint", totalPoint); // 현재 보유 포인트를 모델에 추가
			return "point/transform";
		}
		return "redirect:/jgig/login";
	}

	@PostMapping("/jgig/point_conversion") // 포인트 전환 처리
	public String convertPoints(@RequestParam("conversionPoint") int conversionPoint, HttpSession session,
			Model model) {
		String memId = (String) session.getAttribute("mem_id");
		if (memId != null) {
			int totalPoint = calculateTotalPoint(pointMapper.getPointByMemberId(memId)); // 현재 보유 포인트
			int remainingPoint = totalPoint - conversionPoint; // 잔여 포인트 계산

			// 잔여 포인트가 음수가 될 경우 처리 (예: 전환 포인트가 현재 포인트보다 많을 경우)
			if (remainingPoint < 0) {
				return "point/conversion_error"; // 에러 페이지로 리다이렉트 또는 다른 처리 방식을 선택하세요.
			}
			pointMapper.conversionPoint(memId, -conversionPoint); // 포인트 차감

			model.addAttribute("totalPoint", totalPoint); // 현재 보유 포인트
			model.addAttribute("remainingPoint", remainingPoint); // 잔여 포인트를 모델에 추가
			model.addAttribute("conversionSuccess", true); // 전환 성공 메시지를 전달하기 위한 플래그

			return "point/transform";
		}
		return "redirect:/jgig/login";
	}

	@PostMapping("jgig/checkin")
	public String checkIn(HttpSession session, Model model,HttpServletResponse response) throws IOException{
		// 출석체크 로직을 수행하고 포인트 적립
		String memId = (String) session.getAttribute("mem_id");
		MemberDto dto = memberMapper.detail(memId); // 사용자 아이디를 실제로 가져오는 코드로 대체
		model.addAttribute("memberDto", dto);
		// 출석체크 기록 확인 로직 (예: 오늘 이미 출석체크를 했는지 여부를 체크)

		boolean alreadyCheckedIn = false; // 출석체크 여부를 확인하는 로직이 필요
		int count = pointMapper.countDailyCheckIn(memId);
		response.setContentType("text/html;charset=UTF-8");

		if (count >= 1) {
			// 출석체크 로직 구현
			// 이미 출석체크한 경우 처리 (예: 에러 메시지 전달)
			session.setAttribute("checkinSuccess", false);
			

			
		} else {
			PointDto point = new PointDto();
			point.setPoint(10); // 출석체크 시 10 포인트 적립

			point.setMem_id(memId);

			pointMapper.checkPoint(memId, point.getPoint());
			pointMapper.updatePoint(memId, 10);

			// 출석체크 완료 메시지를 JSP로 전달
			session.setAttribute("checkinSuccess", true);
		
		}

		return "redirect:/jgig/attendance"; //다윤 변경
	}

}
