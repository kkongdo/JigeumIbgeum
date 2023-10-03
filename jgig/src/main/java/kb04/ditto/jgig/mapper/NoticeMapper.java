package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.Criteria;
import kb04.ditto.jgig.entity.NoticeDto;

@Mapper
public interface NoticeMapper {
	//공지사항 리스트
	@Select("select * from notice order by ntc_id desc")
	List<NoticeDto> list();

	//공지사항id로 찾기
	@Select("select * from notice where ntc_id = #{ntc_id}")
	public NoticeDto findByNo(int no);

	//공지사항 조회수 증가
	@Update("update notice SET ntc_view=ntc_view + 1 where ntc_id = #{ntc_id}")
	void updateView(NoticeDto dto);

	//공지사항 총 개수
	@Select("select count(*) from notice")
	public int getTotal();

	//공지사항 페이징
	@Select("SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT rownum rnum, ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM notice ORDER BY ntc_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} order by rnum asc")
	List<NoticeDto> listWithPaging(Criteria criteria);

	//제목으로 공지사항 검색결과 페이징
	@Select("SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT rownum rnum, ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM notice WHERE title=#{keyword} ORDER BY ntc_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} order by rnum asc")
	List<NoticeDto> searchListWithPagingByTitle(Criteria criteria);

	//제목으로 공지사항 검색 결과 총 개수
	@Select("select count(*) from notice where title=#{keyword}")
	public int getSearchTotalByTitle(String keyword);

	//작성자로 공지사항 검색결과 페이징
	@Select("SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT rownum rnum, ntc_id, title, mem_id, ntc_date_created, ntc_view FROM (SELECT ntc_id, title, mem_id, ntc_date_created, ntc_view FROM notice WHERE mem_id=#{keyword} ORDER BY ntc_id DESC) WHERE rownum <= #{pageNum} * #{amount}) WHERE rnum > (#{pageNum}-1)*#{amount} order by rnum asc")
	List<NoticeDto> searchListWithPagingByMem(Criteria criteria);

	//작성자로 공지사항 검색 결과 총 개수
	@Select("select count(*) from notice where mem_id=#{keyword}")
	public int getSearchTotalByMem(String keyword);

}
