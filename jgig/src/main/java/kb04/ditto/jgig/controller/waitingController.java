package kb04.ditto.jgig.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kb04.ditto.jgig.entity.WaitingDto;
import kb04.ditto.jgig.mapper.WaitingMapper;

@Controller
public class waitingController {
	@Autowired
	private WaitingMapper waitingMapper;

	@GetMapping("/jgig/findStore")
	public String loadfindStore(Model model, HttpSession session) {
		// 발급 유무 확인후 발급 버튼 display 결정 
		String mem_id = (String) session.getAttribute("mem_id");
		if(mem_id != null) {
			WaitingDto dto = waitingMapper.detailWaiting(mem_id);
			if(dto != null) {
				model.addAttribute("wt_stat", "Y");
			} else {
				model.addAttribute("wt_stat", "N");
			}
		}
		return "waiting/findStore";
	}

	@PostMapping("/jgig/addWaiting")
	public String addWaiting(@RequestBody WaitingDto dto, Model model, HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		dto.setMem_id(mem_id);
		waitingMapper.insertWaiting(dto);

		return "waiting/findStore";
	}

	@GetMapping("/jgig/detailWaiting")
	public String showDetailWaiting(Model model, HttpSession session) {

		String mem_id = (String) session.getAttribute("mem_id");
		if(mem_id == null) {
			return "redirect:/jgig/login"; 	
		}
		
		WaitingDto dto = waitingMapper.detailWaiting(mem_id);
		if (dto != null) {
			model.addAttribute("dto", dto);
			model.addAttribute("detailYn", "Y");
		} else {
			model.addAttribute("detailYn", "N");
		}
		return "waiting/detailWaiting";
	}

	@PostMapping("/jgig/deleteWaiting")
	public String deleteWaiting(@RequestBody WaitingDto dto, Model model) {
		waitingMapper.deleteWaiting(dto.getWt_seq());
		return "redirect:/jgig/detailWaiting";
	}
	
	// 지점별 대기인원수 받아오기 
	@PostMapping("/jgig/waitingClient")
	@ResponseBody
	public WaitingDto waitingClient(@RequestParam("code") String code, HttpSession session, Model model) throws IOException {
		String URL = "https://omoney.kbstar.com/quics?page=C019288&cc=b028364:b050822";
		Document doc = Jsoup.connect(URL)
				.data("부점코드", code)
				.data("select","4")
				.data("search_check1","0")
				.data("search_check2_1","0")
				.data("search_check2_2","0")
				.data("search_check3","on")
				.post();
		//System.out.println(doc.toString());
		
		Elements el = doc.select("div[id=\"pop_contents1\"]");
		int wt_list = Integer.parseInt(el.select("span[class=\"point_blue\"]").text());
		int wt_no = 1000 + wt_list + 1;
		String wt_store = el.select("dt").text();
		
		List<Map<String, String>> waitingtTable = new LinkedList<Map<String, String>>();
		
		for(Element e: el.select("tr")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("tit", e.select("th").text());
			map.put("cont", e.select("td").text());
			waitingtTable.add(map);
		}
		String mem_id = (String) session.getAttribute("mem_id");
		WaitingDto dto = new WaitingDto(0, wt_no, wt_list, new Date(), wt_store, mem_id, waitingtTable);
		return dto;
	}
}
