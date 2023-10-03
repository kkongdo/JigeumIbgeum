package kb04.ditto.jgig.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kb04.ditto.jgig.entity.AccountDto;
import kb04.ditto.jgig.entity.TransferDto;
import kb04.ditto.jgig.mapper.TransferMapper;

@Controller
public class TransferController {
	@Autowired
	TransferMapper transferMapper;
	
	public final int point = 5;
	
	//계좌이체 입력(입금은행, 입금계좌번호, 이체금액, 계좌번호)
	@GetMapping("jgig/transfer_form")
	public String transfer_form(@RequestParam("account") long account, Model model) {
		AccountDto accountDto = transferMapper.findByAccount(account);
		model.addAttribute("dto", accountDto);
		return "transfer/transfer_form";
	}
	
	//계좌이체 일력(입력내용확인)
	@PostMapping("jgig/transfer_form2")
	public String transfer_form_action(TransferDto transferDto, Model model,
			@RequestParam("act_password") int act_password, HttpSession session, RedirectAttributes redirectAttributes) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		
		int ActPassword = transferMapper.findByActPassword(transferDto.getAccount());
		if (ActPassword != act_password) {
			redirectAttributes.addFlashAttribute("transDto", transferDto);
			redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 맞지 않습니다.");
			return "redirect:/jgig/transfer_form?account=" + transferDto.getAccount();
		}
		model.addAttribute("dto", transferDto);
		return "transfer/transfer_form2";
	}
	
	//계좌이체액션
	@PostMapping("jgig/transfer_action")
	public String transfer_action(TransferDto transferDto, HttpSession session, Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		int balance = transferMapper.findByBalance(transferDto.getAccount());
		
		LocalDate nowDate = LocalDate.now();
		String nowDateString = nowDate.toString();
		int check_practice = transferMapper.check_practice(nowDateString,(String)session.getAttribute("mem_id"), "계좌이체");
		
		if(balance != 0 && transferDto.getDepo_mon() <= balance) {
			transferMapper.insert(transferDto);
			transferMapper.update(transferDto);
			int update_receive_mon = transferMapper.update_receive_mon(transferDto);
			if(update_receive_mon != 0) {
				transferMapper.receive(transferDto);
			}
			if(check_practice > 0 ) {
				model.addAttribute("dto", transferDto);
				model.addAttribute("msg", "이체가 완료되었습니다.");
				model.addAttribute("point", "이미 계좌 이체 연습을 하였습니다.");
				return "transfer/transfer_ok";
			}
			transferMapper.setPoint(point, "계좌이체", (String)session.getAttribute("mem_id")); //매개변수 점수, 연습종류, mem_id
			model.addAttribute("dto", transferDto);
			model.addAttribute("msg", "이체가 완료되었습니다.");
			model.addAttribute("point", "포인트가 "+point+" 적립되었습니다.");
			return "transfer/transfer_ok";
		}
		model.addAttribute("msg", "잔액이 부족합니다.");
		return "transfer/transfer_fail";
	}
	
	
	//거래내역조회폼
	@GetMapping("jgig/trans_history")
	public String trans_history(Model model, HttpSession session) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		
		String mem_id = returnVal;
		List<TransferDto> accountList = transferMapper.accountList(mem_id);
		model.addAttribute("accountList", accountList);
		return "transfer/trans_history";
	}
	
	//거래내역조회 액션1(월별조회)
	@PostMapping("jgig/trans_history_action")
	public String trans_history_action(@RequestParam("selectedAccount") long selectedAccount, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage, @RequestParam("year") int year, @RequestParam("month") int month, HttpSession session, Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		
		String input_month = "0";
		if(month >= 0 && month <=9) {
			input_month += month;
		}
		String yearMon = year + "/" + input_month;
		
		int total = transferMapper.list(selectedAccount, yearMon);
		
		int size = 5;
        int pagingCount = 2;
        int totalPages = total/size;
        
        if(total % size > 0){
            totalPages++;
        }
        
        int startPage = currentPage / pagingCount * pagingCount + 1;
        
        if(currentPage % pagingCount == 0){ 
            startPage -= pagingCount; 
        }
        
        int endPage = startPage + (pagingCount - 1);
        if(endPage > totalPages){
            endPage = totalPages; 
        }
		
        List<TransferDto> transferList = transferMapper.listWithPaging(selectedAccount, yearMon, currentPage * size - size + 1, currentPage * size);
        
        boolean hasPrevious = startPage > 1;
        boolean hasNext = endPage < totalPages;
        
        model.addAttribute("total", total);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);
        model.addAttribute("hasPrevious", hasPrevious);
        model.addAttribute("hasNext", hasNext);
        
        model.addAttribute("transferList", transferList);
		
		
		LocalDate nowDate = LocalDate.now();
		String nowDateString = nowDate.toString();
		int check_practice = transferMapper.check_practice(nowDateString,(String)session.getAttribute("mem_id"), "월별조회");
		
		if(check_practice != 0 ) {
			return "transfer/transfer_history_table";
			
		}
		transferMapper.setPoint(point, "월별조회", (String)session.getAttribute("mem_id")); //매개변수 점수, 연습종류, mem_id
		
		return "transfer/transfer_history_table";
	}
	
	//거래내역조회 액션2(달력조회)
	@PostMapping("jgig/trans_history_action2")
	public String trans_history_action2(@RequestParam("selectedAccount") long selectedAccount,@RequestParam(name = "currentPage", defaultValue = "1") int currentPage , @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, HttpSession session, Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		int total = transferMapper.listCalendar(startDate, endDate, selectedAccount);
		
		int size = 5;
        int pagingCount = 2;
        int totalPages = total/size;
        
        if(total % size > 0){
            totalPages++;
        }
        
        int startPage = currentPage / pagingCount * pagingCount + 1;
        if(currentPage % pagingCount == 0){ 
            startPage -= pagingCount; 
        }
        
        int endPage = startPage + (pagingCount - 1);
        if(endPage > totalPages){
            endPage = totalPages; 
        }
		
		List<TransferDto> transferList = transferMapper.listCalendarWithPaging(startDate, endDate, selectedAccount, currentPage * size - size + 1, currentPage * size);
		
		boolean hasPrevious = startPage > 1;
		boolean hasNext = endPage < totalPages;

		model.addAttribute("total", total);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("size", size);
		model.addAttribute("hasPrevious", hasPrevious);
		model.addAttribute("hasNext", hasNext);
		
		model.addAttribute("transferList", transferList);
		
		
		LocalDate nowDate = LocalDate.now();
		String nowDateString = nowDate.toString();
		int check_practice = transferMapper.check_practice(nowDateString,(String)session.getAttribute("mem_id"), "달력조회");
		
		if(check_practice != 0 ) {
			return "transfer/transfer_history_table2";
			
		}
		transferMapper.setPoint(point, "달력조회", (String)session.getAttribute("mem_id")); //매개변수 점수, 연습종류, mem_id
		
		return "transfer/transfer_history_table2";
	}
	
	
	//거래내역조회 폼(계좌관리에서 해당 계좌로 들어온 경우)
	@GetMapping("jgig/trans_history_selected")
	public String trans_history_selected(@RequestParam("account") long account, HttpSession session, Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		model.addAttribute("account", account);
		return "transfer/trans_history_selected";
	}
	
	//거래내역조회 액션1(계좌관리에서 해당 계좌로 들어온 경우)(월별조회)
	@PostMapping("jgig/trans_history_selected_action")
	public String trans_history_selected_action(@RequestParam("selectedAccount") long selectedAccount, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage, @RequestParam("year") int year, @RequestParam("month") int month, HttpSession session ,Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		
		String input_month = "0";
		if(month >= 0 && month <=9) {
			input_month += month;
		}
		String yearMon = year + "/" + input_month;
		
		int total = transferMapper.list(selectedAccount, yearMon);
		
		int size = 5;
        int pagingCount = 2;
        int totalPages = total/size;
        
        if(total % size > 0){
            totalPages++;
        }
        
        int startPage = currentPage / pagingCount * pagingCount + 1;
        if(currentPage % pagingCount == 0){ 
            startPage -= pagingCount; 
        }
        
        int endPage = startPage + (pagingCount - 1);
        if(endPage > totalPages){
            endPage = totalPages; 
        }
		
        List<TransferDto> transferList = transferMapper.listWithPaging(selectedAccount, yearMon, currentPage * size - size + 1, currentPage * size);
        
        boolean hasPrevious = startPage > 1;
        boolean hasNext = endPage < totalPages;
        
		
		model.addAttribute("total", total);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);
        model.addAttribute("hasPrevious", hasPrevious);
        model.addAttribute("hasNext", hasNext);
        
        model.addAttribute("transferList", transferList);
        
        LocalDate nowDate = LocalDate.now();
		String nowDateString = nowDate.toString();
		int check_practice = transferMapper.check_practice(nowDateString,(String)session.getAttribute("mem_id"), "월별조회");
		
		if(check_practice != 0 ) {
			return "transfer/transfer_history_table";
			
		}
	    
		transferMapper.setPoint(point, "월별조회", (String)session.getAttribute("mem_id")); //매개변수 점수, 연습종류, mem_id
		
		return "transfer/transfer_history_table";
	}
	
	//거래내역조회 액션2(계좌관리에서 해당 계좌로 들어온 경우)(달력조회)
	@PostMapping("jgig/trans_history_selected_action2")
	public String trans_history_selected_action2(@RequestParam("selectedAccount") long selectedAccount,@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,@RequestParam("startDate") String startDate, HttpSession session, @RequestParam("endDate") String endDate, Model model) {
		String returnVal = login_check(session);
		if (returnVal.equals("redirect:/jgig/login"))
			return "redirect:/jgig/login";
		
		int total = transferMapper.listCalendar(startDate, endDate, selectedAccount);
		
		int size = 5;
        int pagingCount = 2;
        int totalPages = total/size;
        
        if(total % size > 0){
            totalPages++;
        }
        
        int startPage = currentPage / pagingCount * pagingCount + 1;
       
        if(currentPage % pagingCount == 0){ 
            startPage -= pagingCount; 
        }
        
        int endPage = startPage + (pagingCount - 1);
        if(endPage > totalPages){
            endPage = totalPages; 
        }
		
		List<TransferDto> transferList = transferMapper.listCalendarWithPaging(startDate, endDate, selectedAccount, currentPage * size - size + 1, currentPage * size);
		
		boolean hasPrevious = startPage > 1;
		boolean hasNext = endPage < totalPages;
		
		
		model.addAttribute("total", total);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("size", size);
		model.addAttribute("hasPrevious", hasPrevious);
		model.addAttribute("hasNext", hasNext);
		
		model.addAttribute("transferList", transferList);
		
		LocalDate nowDate = LocalDate.now();
		String nowDateString = nowDate.toString();
		int check_practice = transferMapper.check_practice(nowDateString,(String)session.getAttribute("mem_id"), "달력조회");
		
		if(check_practice != 0 ) {
			return "transfer/transfer_history_table2";
			
		}
		transferMapper.setPoint(point, "달력조회", (String)session.getAttribute("mem_id")); //매개변수 점수, 연습종류, mem_id
		
		return "transfer/transfer_history_table2";
	}
	
	private String login_check(HttpSession session) {
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