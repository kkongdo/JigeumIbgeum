package kb04.ditto.jgig.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kb04.ditto.jgig.entity.BoardDto;
import kb04.ditto.jgig.entity.CommentDto;
import kb04.ditto.jgig.entity.Criteria;
import kb04.ditto.jgig.entity.SuggestionDto;
import kb04.ditto.jgig.mapper.BoardMapper;
import kb04.ditto.jgig.mapper.CommentMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private CommentMapper commentMapper;

	// 게시판 리스트
	@GetMapping("jgig/board_list")
	public String board_list_withPaging(@RequestParam(value = "pageNum", required = false) Integer pageNum,
			Model model) {
		int total = boardMapper.getTotal();

		if (pageNum == null)
			pageNum = 1;

		Criteria criteria = new Criteria(pageNum, total);
		List<BoardDto> list = boardMapper.listWithPaging(criteria);

		model.addAttribute("total", total);

		model.addAttribute("board_list", list);
		model.addAttribute("criteria", criteria);

		return "board/list";
	}

	// 게시글 보기
	@GetMapping("jgig/board_detail")
	public String board_detail(HttpSession session, @RequestParam("no") int no, Model model) {
		String mem_id = (String) session.getAttribute("mem_id");
		model.addAttribute("mem_id", mem_id);

		int cmt_total = commentMapper.getTotal(no);
		model.addAttribute("cmt_total", cmt_total);

		BoardDto dto = boardMapper.findByNo(no);
		boardMapper.updateView(dto);
		model.addAttribute("dto", dto);

		List<CommentDto> cmt_list = commentMapper.list(no);
		model.addAttribute("cmt_list", cmt_list);

		return "board/detail";
	}

	// 게시글 작성
	@PostMapping("jgig/board_insert_action")
	public String board_insert_action(HttpSession session, BoardDto dto, Model model) {
		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}

		boardMapper.insert(dto);
		model.addAttribute("msg", "게시물 추가 성공");
		return "board/insert_ok";
	}

	@GetMapping("jgig/board_insert_form")
	public String board_insert_form(HttpSession session) {
		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}
		return "board/insert_form";
	}

	// 게시글 수정
	@PostMapping("jgig/board_update_action")
	public String board_update_action(BoardDto dto, Model model) {
		boardMapper.update(dto);
		model.addAttribute("msg", "게시물 수정 성공");
		return "board/insert_ok";
	}

	@GetMapping("jgig/board_update_form")
	public String board_update_form(@RequestParam("no") int no, Model model) {
		BoardDto dto = boardMapper.findByNo(no);
		model.addAttribute("dto", dto);
		return "board/update_form";
	}

	// 게시글 삭제
	@PostMapping("jgig/board_delete_action")
	public String board_delete_action(BoardDto dto, Model model) {
		boardMapper.delete(dto);
		model.addAttribute("msg", "게시물 삭제 성공");
		return "board/insert_ok";
	}

	@GetMapping("jgig/board_delete_form")
	public String board_delete_form(@RequestParam("no") int no, Model model) {
		BoardDto dto = boardMapper.findByNo(no);
		commentMapper.deleteAll(no);
		model.addAttribute("dto", dto);
		return "board/delete_form";
	}

	// 게시글 검색
	@GetMapping("jgig/board_search_action")
	public String board_search_list_withPaging(@RequestParam(value = "searchTag", required = false) String searchTag,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNum", required = false) Integer pageNum, Model model) {

		if (pageNum == null)
			pageNum = 1;

		Criteria criteria;
		List<BoardDto> list;

		if (searchTag.equals("제목")) {
			int total = boardMapper.getSearchTotalByTitle(keyword);
			criteria = new Criteria(pageNum, searchTag, keyword, total);
			list = boardMapper.searchListWithPagingByTitle(criteria);
			model.addAttribute("total", total);
		} else {
			int total = boardMapper.getSearchTotalByMem(keyword);
			criteria = new Criteria(pageNum, searchTag, keyword, total);
			list = boardMapper.searchListWithPagingByMem(criteria);
			model.addAttribute("total", total);
		}
		model.addAttribute("search_list", list);
		model.addAttribute("criteria", criteria);

		return "board/search_list";
	}

	// 댓글 작성
	@PostMapping("jgig/comment_insert_action")
	public String comment_insert_action(HttpSession session,
			@RequestParam(value = "brd_id", required = false) Integer brd_id, CommentDto dto, Model model) {
		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}

		commentMapper.insert(dto);
		model.addAttribute("brd_id", brd_id);
		model.addAttribute("msg", "댓글 작성 성공");
		return "board/comment_ok";
	}

	@GetMapping("jgig/comment_insert_form")
	public String comment_insert_form(HttpSession session, @RequestParam("no") int no, Model model) {
		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}
		// 로그인된 경우, 세션에서 로그인 아이디를 받아옵니다.
		String mem_id = (String) session.getAttribute("mem_id");
		model.addAttribute("mem_id", mem_id);

		BoardDto dto = boardMapper.findByNo(no);
		model.addAttribute("dto", dto);
		return "board/comment_insert_form";
	}

	// 댓글 수정
	@PostMapping("jgig/comment_update_action")
	public String comment_update_action(@RequestParam(value = "brd_id", required = false) Integer brd_id,
			CommentDto dto, Model model) {
		commentMapper.update(dto);
		model.addAttribute("brd_id", brd_id);
		model.addAttribute("msg", "댓글 수정 성공");
		return "board/comment_ok";
	}

	@GetMapping("jgig/comment_update_form")
	public String comment_update_form(@RequestParam("cmt_no") int cmt_no, Model model) {
		CommentDto dto = commentMapper.findByNo(cmt_no);
		model.addAttribute("dto", dto);
		return "board/comment_update_form";
	}

	// 댓글 삭제
	@PostMapping("jgig/comment_delete_action")
	public String board_comment_action(@RequestParam(value = "brd_id", required = false) Integer brd_id, CommentDto dto,
			Model model) {
		commentMapper.deleteOne(dto);
		model.addAttribute("brd_id", brd_id);
		model.addAttribute("msg", "댓글 삭제 성공");
		return "board/comment_ok";
	}

	@GetMapping("jgig/comment_delete_form")
	public String board_comment_form(@RequestParam("cmt_no") int cmt_no, Model model) {
		CommentDto dto = commentMapper.findByNo(cmt_no);
		model.addAttribute("dto", dto);
		return "board/comment_delete_form";
	}

	// 내가 쓴 글
	@GetMapping("jgig/board_my_list_action")
	public String board_my_list_withPaging(HttpSession session,
			@RequestParam(value = "searchTag", required = false) String searchTag,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNum", required = false) Integer pageNum, Model model) {

		if (pageNum == null)
			pageNum = 1;

		Criteria criteria;
		List<BoardDto> list;

		keyword = "";

		// 세션에서 로그인 정보를 확인
		Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

		// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
		if (loggedIn == null || !loggedIn) {
			return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
		}

		// 로그인된 경우, 세션에서 로그인 아이디를 받아옵니다.
		String mem_id = (String) session.getAttribute("mem_id");

		int total = boardMapper.getSearchTotalByMem(mem_id);
		criteria = new Criteria(pageNum, searchTag, mem_id, total);
		list = boardMapper.searchListWithPagingByMem(criteria);
		model.addAttribute("total", total);
		model.addAttribute("search_list", list);
		model.addAttribute("criteria", criteria);

		return "board/my_list";
	}


	// 게시글 추천
		@GetMapping("jgig/board_suggestion_action")
		public String board_suggestion_action(HttpSession session, @RequestParam(value = "brd_id", required = false) Integer brd_id, BoardDto dto, Model model) {
			// 세션에서 로그인 정보를 확인
			Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
			
			// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
			if (loggedIn == null || !loggedIn) {
				return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
			}

			// 로그인된 경우, 세션에서 로그인 아이디를 받아옵니다.
			String mem_id = (String) session.getAttribute("mem_id");
			
			model.addAttribute("brd_id", brd_id);
			
			//중복 검사
			if(boardMapper.isSuggestion(brd_id, mem_id)==0) {
				SuggestionDto sdto = new SuggestionDto(brd_id,mem_id);
				boardMapper.suggestion(sdto);
				boardMapper.updateSuggestion(dto);
				model.addAttribute("msg", "공감 완료");
			}
			
			else
				model.addAttribute("msg", "이미 공감한 글입니다.");
			
			return "board/comment_ok";
		}
		
		// 게시글 신고
				@GetMapping("jgig/board_declaration_action")
				public String board_declaration_action(HttpSession session, @RequestParam(value = "brd_id", required = false) Integer brd_id, BoardDto dto, Model model) {
					// 세션에서 로그인 정보를 확인
					Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
					
					// 로그인 여부를 확인하고, 로그인되지 않은 경우 로그인 페이지로 리다이렉트
					if (loggedIn == null || !loggedIn) {
						return "redirect:/jgig/login"; // 로그인 페이지로 리다이렉트합니다.
					}

					// 로그인된 경우, 세션에서 로그인 아이디를 받아옵니다.
					String mem_id = (String) session.getAttribute("mem_id");
					
					model.addAttribute("brd_id", brd_id);
					
					//중복 검사
					if(boardMapper.isDeclaration(brd_id, mem_id)==0) {
						SuggestionDto sdto = new SuggestionDto(brd_id,mem_id);
						boardMapper.declaration(sdto);
						boardMapper.updatesDeclaration(dto);
						model.addAttribute("msg", "반대 완료");
					}
					
					else
						model.addAttribute("msg", "이미 반대한 글입니다.");
					
					return "board/comment_ok";
				}

}
