package kb04.ditto.jgig.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kb04.ditto.jgig.entity.WaitingDto;

@Mapper
public interface WaitingMapper {
	@Insert("insert into waiting (wt_seq, wt_no, wt_list, wt_date, wt_store, mem_id) \r\n"
			+ "values (wt_seq.NEXTVAL, #{wt_no}, #{wt_list}, sysdate, #{wt_store}, #{mem_id})")
	public void insertWaiting(WaitingDto dto);
	
	@Select("select * \r\n"
			+ "from waiting\r\n"
			+ "where mem_id = #{mem_id}")
	public WaitingDto detailWaiting(String mem_id);
	
	@Delete("delete from waiting where wt_seq = #{wt_seq}")
	public void deleteWaiting(int wt_seq);
}
