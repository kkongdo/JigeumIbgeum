package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.BoardDto;
import kb04.ditto.jgig.entity.Criteria;
import kb04.ditto.jgig.entity.SuggestionDto;

@Mapper
public interface BoardMapper {
	// 게시판 리스트
	@Select("select * from board order by brd_id desc")
	List<BoardDto> list();

	// 게시글 작성
	@Insert("insert into board(brd_id,brd_category,title,brd_view,brd_content,BRD_DECLARATION,BRD_SUGGESTION,BRD_DATE_CREATED,MEM_ID)"
			+ " values(brd_seq.nextval,#{brd_category},#{title},0,#{brd_content},0,0,sysdate,#{mem_id})")
	void insert(BoardDto dto);

	// 게시글id로 게시글 찾기
	@Select("select * from board where brd_id = #{brd_id}")
	public BoardDto findByNo(int no);

	// 게시글 수정
	@Update("update board SET brd_category=#{brd_category},title=#{title},brd_content=#{brd_content} where brd_id = #{brd_id}")
	void update(BoardDto dto);

	// 게시글 조회수 증가
	@Update("update board SET brd_view=brd_view + 1 where brd_id = #{brd_id}")
	void updateView(BoardDto dto);

	// 게시글 삭제
	@Delete("delete from board where brd_id = #{brd_id}")
	public int delete(BoardDto dto);

	// 게시글 총 개수
	@Select("select count(*) from board")
	public int getTotal();

	// 게시글 페이징
	@Select("SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT rownum rnum, brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM board ORDER BY brd_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} ORDER BY rnum ASC")
	List<BoardDto> listWithPaging(Criteria criteria);

	// 게시글 제목으로 게시글 찾기
	@Select("select * from board where title = #{title}")
	public List<BoardDto> findByTitle(String title);

	// 제목 검색 결과 페이징
	@Select("SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT rownum rnum, brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM board WHERE title=#{keyword} ORDER BY brd_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} order by rnum asc")
	List<BoardDto> searchListWithPagingByTitle(Criteria criteria);

	// 제목 검색 결과 총 개수
	@Select("select count(*) from board where title=#{keyword}")
	public int getSearchTotalByTitle(String keyword);

	// 작성자 검색 결과 페이징
	@Select("SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT rownum rnum, brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM (SELECT brd_id, brd_category, title, mem_id, brd_date_created, brd_view FROM board WHERE mem_id=#{keyword} ORDER BY brd_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} order by rnum asc")
	List<BoardDto> searchListWithPagingByMem(Criteria criteria);

	// 작성자 검색 결과 총 개수
	@Select("select count(*) from board where mem_id=#{keyword}")
	public int getSearchTotalByMem(String keyword);

	// 게시판 추천 했는지 카운트
	@Select("select count(*) from suggestion where brd_id = #{brd_id} AND mem_id = #{mem_id}")
	public int isSuggestion(@Param("brd_id") int brdId, @Param("mem_id") String mem_id);

	// 추천 id 저장
	@Insert("insert into suggestion(brd_id, mem_id) values( #{brd_id},#{mem_id})")
	void suggestion(SuggestionDto dto);

	// 추천 수 증가
	@Update("update board SET brd_suggestion=brd_suggestion + 1 where brd_id = #{brd_id}")
	void updateSuggestion(BoardDto dto);

	// 게시판 신고 했는지 카운트
	@Select("select count(*) from declaration where brd_id = #{brd_id} AND mem_id = #{mem_id}")
	public int isDeclaration(@Param("brd_id") int brdId, @Param("mem_id") String mem_id);

	// 추천 id 저장
	@Insert("insert into declaration(brd_id, mem_id) values( #{brd_id},#{mem_id})")
	void declaration(SuggestionDto dto);

	// 추천 수 증가
	@Update("update board SET brd_declaration = brd_declaration + 1 where brd_id = #{brd_id}")
	void updatesDeclaration(BoardDto dto);
}
