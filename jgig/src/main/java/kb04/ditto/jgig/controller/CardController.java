package kb04.ditto.jgig.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kb04.ditto.jgig.entity.CardDto;
import kb04.ditto.jgig.mapper.CardMapper;

@Controller
public class CardController {

	@Autowired
	private CardMapper cardMapper;

	/** 카드 관리 로직 **/
	@PostMapping("/jgig/card_pw_action")
	public String card_pw_action(HttpSession session, Model model, CardDto cardDto,
			@RequestParam("new_pw") String new_pw) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = (CardDto) session.getAttribute("select_card");

		int cd_no = select_card.getCd_no();

		cardMapper.update_pw(cd_no, new_pw);
		CardDto update_card = cardMapper.select_card(cd_no);
		model.addAttribute("cardDto", update_card);

		return "card/pw_ok";
	}

	@GetMapping("/jgig/card_pw_form")
	public String card_pw_form(HttpSession session, Model model, @RequestParam("no") int cd_no) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = cardMapper.select_card(cd_no);
		model.addAttribute("cardDto", select_card);
		session.setAttribute("select_card", select_card); // 선택카드 정보 세션에 저장

		return "card/pw_form";
	}

	@PostMapping("/jgig/card_status_action")
	public String card_status_action(HttpSession session, Model model, CardDto cardDto) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = (CardDto) session.getAttribute("select_card");
		int cd_no = select_card.getCd_no();


		cardMapper.update_status(cd_no);
		CardDto update_card = cardMapper.select_card(cd_no);
		model.addAttribute("cardDto", update_card);

		return "card/status_ok";
	}

	@GetMapping("/jgig/card_status_form")
	public String card_status_form(HttpSession session, Model model, @RequestParam("no") int cd_no) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = cardMapper.select_card(cd_no);
		model.addAttribute("cardDto", select_card);
		session.setAttribute("select_card", select_card); // 선택카드 정보 세션에 저장

		return "card/status_form";
	}

	@PostMapping("/jgig/card_cancellation_action")
	public String card_cancellation_action(HttpSession session, Model model, CardDto cardDto) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = (CardDto) session.getAttribute("select_card");
		int cd_no = select_card.getCd_no();


		cardMapper.delete(cd_no);
		model.addAttribute("cardDto", select_card);

		return "card/cancellation_ok";
	}

	@GetMapping("/jgig/card_cancellation_form")
	public String card_cancellation_form(HttpSession session, Model model, @RequestParam("no") int cd_no) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;

		CardDto select_card = cardMapper.select_card(cd_no);
		model.addAttribute("cardDto", select_card);
		session.setAttribute("select_card", select_card); // 선택카드 정보 세션에 저장

		return "card/cancellation_form";
	}

	/** 카드조회 로직 **/
	@GetMapping("/jgig/card_list")
	public String card_list(HttpSession session, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;

		List<CardDto> card_list = cardMapper.list(mem_id);

		int cnt = card_list.size(); // 카드 리스트 개수

		// 페이징
		int pageSize = 5;// 한 페이지에 출력될 글 수
		int maxPage = (int) (Math.ceil((double) cnt / pageSize));
		int blockLimit = 5; // 하단에 보여줄 페이지의 수

		// 첫행번호를 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		pageSize += startRow;

		int startPage = (int) (Math.ceil((double) currentPage / blockLimit) - 1) * blockLimit + 1;
		int endPage = startPage + blockLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		
		List<CardDto> list_paging = cardMapper.list_paging(mem_id, startRow, pageSize);
		model.addAttribute("card_list", list_paging);
		
		model.addAttribute("page", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("endPage", endPage);

		return "card/list";
	}

	/** 카드발급 로직 **/

	@GetMapping("/jgig/card_issuance")
	public String card_issuance(HttpSession session) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;

		return "card/issuance_form1";
	}

	@PostMapping("/jgig/card_issuance_form2")
	public String card_issuance_form2(HttpSession session, @ModelAttribute CardDto cardDto,
			@RequestParam("agreement1") String agree) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;



		return "card/issuance_form2";
	}

	@PostMapping("/jgig/card_issuance_action")
	public String card_issuance_action(HttpSession session, Model model, @ModelAttribute CardDto cardDto) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;

		// form1에서 입력받은 정보
		CardDto cardDto_form1 = (CardDto) session.getAttribute("cardDto_form1");
		cardDto.setCd_item(cardDto_form1.getCd_item());
		cardDto.setCd_name(cardDto_form1.getCd_name());
		cardDto.setCd_ssn(cardDto_form1.getCd_ssn());
		cardDto.setCd_phone(cardDto_form1.getCd_phone());
		cardDto.setMem_id(mem_id);
		System.out.println("들어갈 dto : " + cardDto);

		cardMapper.insert(cardDto); // DB insert
		CardDto card_success = cardMapper.find_last(mem_id);
		model.addAttribute("card_success", card_success);

		return "card/issuance_ok";
	}

	/** 테스트 로직 **/

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

	// 테스트용 로그인 처리 로직
	@GetMapping("/jgig/login_test")
	public String loginTest(HttpSession session) {
		// 로그인 정보를 세션에 저장합니다.
		session.setAttribute("loggedIn", true);
		session.setAttribute("mem_id", "kb0002"); // 테스트용 아이디
		session.setAttribute("mem_nm", "김철수"); // 테스트용 이름
		session.setAttribute("phone_num", "01054237895"); // 테스트용 폰번호
		session.setAttribute("ssn", "990101-0000000"); // 테스트용 주민번호

		// 로그인 정보를 저장한 후, 다음 페이지로 리다이렉트합니다.
		return "redirect:/jgig/card_issuance"; // 로그인 후의 페이지로 리다이렉트
	}

	// 테스트용 로그아웃 처리 로직
	@GetMapping("/jgig/logout_test")
	public String logoutTest(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}

		return "redirect:/jgig/card_issuance"; // 로그인 후의 페이지로 리다이렉트
	}

}