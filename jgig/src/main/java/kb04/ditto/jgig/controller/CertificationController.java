package kb04.ditto.jgig.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kb04.ditto.jgig.mapper.CardMapper;

@Controller
public class CertificationController {
	
	@Autowired
	private CardMapper cardMapper;
	
	@GetMapping("/jgig/certification")
	public String certification(HttpSession session) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;
		session.setAttribute("isARS", false); //ARS 미확인


		return "certification/certifi_form1";
	}
	@PostMapping("/jgig/certification_issuance2")
	public String certification_issuance2(HttpSession session) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;


		return "certification/certifi_form2";
	}
	@PostMapping("/jgig/certification_issuance3")
	public String certification_issuance3(HttpSession session) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;


		return "certification/certifi_form3";
	}
	
	@PostMapping("/jgig/certification_action")
	public String certification_action(HttpSession session,Model model) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;

		int countDailyCheckIn = cardMapper.countDailyCheckIn(mem_id, "인증서");
		if(countDailyCheckIn==0) {
			cardMapper.checkPoint(mem_id, 10, "인증서");
			cardMapper.updatePoint(mem_id, 10); //멤버 포인트 업데이트
			model.addAttribute("certifi_issu_point", "10 포인트가 적립되었습니다.");
		}else {
			model.addAttribute("certifi_issu_point", "이미 포인트가 지급되었습니다.");
		}

		return "certification/certifi_ok";
	}
	
	@GetMapping("/jgig/ars")
	public String ars(HttpSession session) {

		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return returnVal;
		String mem_id = returnVal;
		

		return "certification/ars";
	}
	
	 @PostMapping("/jgig/ars_action")
	    public void ars_action(@RequestParam("isARS") boolean isARS, HttpSession session, HttpServletResponse response) throws IOException {
		 session.setAttribute("isARS", true);
		 
		 	response.setContentType("text/html;charset=UTF-8");
	        response.getWriter().write("<script>window.opener.location.reload();</script>");
	       
	        response.getWriter().write("<script>window.close();</script>");

	       
	    }
	
	
	/**로그인 확인함수**/
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
