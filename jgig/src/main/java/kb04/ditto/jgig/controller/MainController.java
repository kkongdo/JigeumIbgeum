package kb04.ditto.jgig.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kb04.ditto.jgig.entity.BoardDto;
import kb04.ditto.jgig.entity.MemberDto;
import kb04.ditto.jgig.entity.NoticeDto;
import kb04.ditto.jgig.entity.PointDto;
import kb04.ditto.jgig.mapper.MainMapper;

@Controller
public class MainController {
	
	@Autowired
	private MainMapper mainMapper;

	@GetMapping("/jgig/")
	public String mainpage(HttpSession session, Model model) {
		
		List<BoardDto> free_list = mainMapper.free_list();
		model.addAttribute("free_list", free_list);
		
		List<BoardDto> question_list = mainMapper.question_list();
		model.addAttribute("question_list", question_list);
		
		List<NoticeDto> notice_list = mainMapper.notice_list();
		model.addAttribute("notice_list", notice_list);
		
		List<MemberDto> point_rank=mainMapper.point_rank();
		model.addAttribute("point_rank", point_rank);
		
		return "index";
	}
	
	@GetMapping("/jgig/attendance")
		public String attendance(HttpSession session, Model model) {
		
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		
		String mem_id = returnVal;
		
		List<PointDto> att_list = mainMapper.att_list(mem_id);
		List<Integer> att_yes=new ArrayList<Integer>();
		for(int i=0;i<=31;i++) {
			att_yes.add(null);
		}
		SimpleDateFormat sdf1 = new SimpleDateFormat("d");
		
		
		for (PointDto pointDto : att_list) {
			int mon=Integer.parseInt(sdf1.format(pointDto.getPoint_date()));
			att_yes.set(mon, mon);
		}
		model.addAttribute("att_yes", att_yes);
		
		//이번달 마지막 날짜
		LocalDate now = LocalDate.now();
		LocalDate firstDate=now.withDayOfMonth(1);
		LocalDate lastDate = now.withDayOfMonth(firstDate.lengthOfMonth());
		int dayOfMonth = lastDate.getDayOfMonth();
		
		model.addAttribute("dayOfMonth", dayOfMonth);

		return "point/attendance";
	}
	
	public String login_check(HttpSession session) { // 로그인 체크 함수
		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}

		// 로그인된 경우, 세션에서 로그인 아이디를 받아옵니다.
		String mem_id = (String) session.getAttribute("mem_id");
		return mem_id;
	}
	
	
}
