package kb04.ditto.jgig.controller;

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
			redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 맞지 않습니다.");
			return "redirect:/jgig/transfer_form?account=" + transferDto.getAccount();
		}
		model.addAttribute("dto", transferDto);
		return "transfer/transfer_form2";
	}
	
	//계좌이체액션
	@PostMapping("jgig/transfer_action")
	public String transfer_action(TransferDto transferDto, Model model) {
		int balance = transferMapper.findByBalance(transferDto.getAccount());
		if(balance != 0 ) {
			transferMapper.insert(transferDto);
			transferMapper.update(transferDto);
			model.addAttribute("dto", transferDto);
			model.addAttribute("msg", "이체가 완료되었습니다.");
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
		model.addAttribute("list", accountList);
		return "transfer/trans_history";
	}
	
	//거래내역조회 액션1
	@PostMapping("jgig/trans_history_action")
	public String trans_history_action(@RequestParam("selectedAccount") long selectedAccount, @RequestParam("year") int year, @RequestParam("month") int month, 
			RedirectAttributes redirectAttributes, Model model) {
		String input_month = "0";
		
		if(month >= 0 && month <=9) {
			input_month += month;
		}
		String yearMon = year + "/" + input_month;
		List<TransferDto> transferList = transferMapper.list(selectedAccount, yearMon);
		
		redirectAttributes.addFlashAttribute("selectedAccount", selectedAccount);
		redirectAttributes.addFlashAttribute("transferList", transferList);
		if(transferList.size() != 0) {
			redirectAttributes.addAttribute("showTable", "true");
		}
		return "redirect:/jgig/trans_history";
	}
	
	//거래내역조회 액션2
	@PostMapping("jgig/trans_history_action2")
	public String trans_history_action2(@RequestParam("selectedAccount") long selectedAccount, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, 
			RedirectAttributes redirectAttributes, Model model) {
		
		List<TransferDto> transferList = transferMapper.listCalender(startDate, endDate, selectedAccount);
		
		redirectAttributes.addFlashAttribute("selectedAccount", selectedAccount);
		redirectAttributes.addFlashAttribute("transferList", transferList);
		
		if(transferList.size() != 0) {
			redirectAttributes.addAttribute("showTable", "true");
		}
		
		return "redirect:/jgig/trans_history";
	}
	
	
	//거래내역조회 폼(계좌관리에서 해당 계좌로 들어온 경우)
	@GetMapping("jgig/trans_history_selected")
	public String trans_history_selected(@RequestParam("account") long account, Model model) {
		model.addAttribute("account", account);
		return "transfer/trans_history_selected";
	}
	
	//거래내역조회 액션1(계좌관리에서 해당 계좌로 들어온 경우)
	@PostMapping("jgig/trans_history_selected_action")
	public String trans_history_selected_action(@RequestParam("account") long account, @RequestParam("year") int year, @RequestParam("month") int month, 
			RedirectAttributes redirectAttributes, HttpSession session, Model model) {
		String input_month = "0";
		if(month >= 0 && month <=9) {
			input_month += month;
		}
		String yearMon = year + "/" + input_month;
		List<TransferDto> transferList = transferMapper.list(account, yearMon);
		
		redirectAttributes.addFlashAttribute("account", account);
		redirectAttributes.addFlashAttribute("transferList", transferList);
		if(transferList.size() != 0 ) {
			redirectAttributes.addAttribute("showTable", "true");
		}
		
		return "redirect:/jgig/trans_history_selected?account="+account;
	}
	
	//거래내역조회 액션2(계좌관리에서 해당 계좌로 들어온 경우)
	@PostMapping("jgig/trans_history_selected_action2")
	public String trans_history_selected_action2(@RequestParam("account") long account, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, 
			RedirectAttributes redirectAttributes, Model model) {
		List<TransferDto> transferList = transferMapper.listCalender(startDate, endDate, account);
		
		redirectAttributes.addFlashAttribute("account", account);
		redirectAttributes.addFlashAttribute("transferList", transferList);
		if(transferList.size() != 0 ) {
			redirectAttributes.addAttribute("showTable", "true");
		}
		
		return "redirect:/jgig/trans_history_selected?account="+account;
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
