package kb04.ditto.jgig.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kb04.ditto.jgig.entity.NoticeDto;
import kb04.ditto.jgig.entity.Criteria;
import kb04.ditto.jgig.mapper.NoticeMapper;

@Controller
public class NoticeController {

	@Autowired
	private NoticeMapper noticeMapper;

	// 공지사항 리스트
	@GetMapping("jgig/notice_list")
	public String notice_list_withPaging(@RequestParam(value = "pageNum", required = false) Integer pageNum,
			Model model) {
		int total = noticeMapper.getTotal();

		if (pageNum == null)
			pageNum = 1;

		Criteria criteria = new Criteria(pageNum, total);
		List<NoticeDto> list = noticeMapper.listWithPaging(criteria);

		model.addAttribute("total", total);
		model.addAttribute("notice_list", list);
		model.addAttribute("criteria", criteria);

		return "notice/list";
	}

	// 공지사항 보기
	@GetMapping("jgig/notice_detail")
	public String notice_detail(@RequestParam("no") int no, Model model) {

		NoticeDto dto = noticeMapper.findByNo(no);
		noticeMapper.updateView(dto);
		model.addAttribute("dto", dto);

		return "notice/detail";
	}

	// 공지사항 검색
	@GetMapping("jgig/notice_search_action")
	public String notice_search_list_withPaging(@RequestParam(value = "searchTag", required = false) String searchTag,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNum", required = false) Integer pageNum, Model model) {
		if (pageNum == null)
			pageNum = 1;

		Criteria criteria;
		List<NoticeDto> list;

		if (searchTag.equals("제목")) {
			int total = noticeMapper.getSearchTotalByTitle(keyword);
			criteria = new Criteria(pageNum, searchTag, keyword, total);
			list = noticeMapper.searchListWithPagingByTitle(criteria);
			model.addAttribute("total", total);
		} else {
			int total = noticeMapper.getSearchTotalByMem(keyword);
			criteria = new Criteria(pageNum, searchTag, keyword, total);
			list = noticeMapper.searchListWithPagingByMem(criteria);
			model.addAttribute("total", total);
		}

		model.addAttribute("search_list", list);
		model.addAttribute("criteria", criteria);

		return "notice/search_list";
	}

}
