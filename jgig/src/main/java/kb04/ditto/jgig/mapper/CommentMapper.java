package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.CommentDto;

@Mapper
public interface CommentMapper {
	//댓글 보기
	@Select("select * from brd_comment where brd_id=#{brd_id} order by cmt_id asc")
	List<CommentDto> list(@Param("brd_id") int brd_id);

	//댓글 작성
	@Insert("insert into brd_comment(cmt_id,cmt_content,cmt_declaration,cmt_suggestion,CMT_REGDATE,brd_id,MEM_ID) values(cmt_seq.nextval,#{cmt_content},0,0,sysdate,#{brd_id},#{mem_id})")
	void insert(CommentDto dto);

	//댓글 id로 찾기
	@Select("select * from brd_comment where cmt_id = #{cmt_id}")
	public CommentDto findByNo(int no);

	//댓글 수정
	@Update("update brd_comment SET cmt_content=#{cmt_content} where cmt_id = #{cmt_id}")
	void update(CommentDto dto);
	
	//댓글 삭제
	@Delete("delete from brd_comment where cmt_id = #{cmt_id}")
	public int deleteOne(CommentDto dto);

	//댓글의 해당 게시글 번호 찾기 -댓글있는 게시물 삭제위함
	@Select("select * from brd_comment where brd_id = #{brd_id}")
	public List<CommentDto> findByBrdNo(int no);

	//댓글 전체 삭제 -댓글있는 게시물 삭제위함
	@Delete("delete from brd_comment where brd_id = #{brd_id}")
	public int deleteAll(int brd_id);

	//댓글 총 개수
	@Select("select count(*) from brd_comment where brd_id=#{brd_id}")
	public int getTotal(int brd_id);
}
