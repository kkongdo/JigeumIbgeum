package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.AccountDto;
import kb04.ditto.jgig.entity.TransferDto;

@Mapper
public interface TransferMapper {
	@Select("select act_password from account where account = #{account}")
	public int findByActPassword(long account);
	
	@Select("select count(*) from point where TO_CHAR(point_date, 'YYYY-MM-DD')= #{str_regdate} and mem_id = #{mem_id} and division = #{division}")
	public int check_practice(String str_regdate, String mem_id, String division);
	
	@Select("select balance from account where account = #{account}")
	public int findByBalance(long account);
	
	@Insert("insert into transfer(trans_seq, depo_bank, depo_num, receive_nm, send_nm, depo_mon, withdr_mon, trans_date, mem_id, account)"
			+ "values(trans_seq.nextval, #{depo_bank}, #{depo_num}, #{receive_nm}, #{send_nm}, #{depo_mon}, 0, sysdate, #{mem_id}, #{account})")
	public int insert(TransferDto dto);
	
	@Insert("insert into transfer(trans_seq, depo_bank, depo_num, receive_nm, send_nm, depo_mon, withdr_mon, trans_date, mem_id, account)"
			+ "values(trans_seq.nextval, #{depo_bank}, #{depo_num}, #{receive_nm}, #{send_nm}, 0, #{depo_mon}, sysdate, #{mem_id}, #{depo_num})")
	public void receive(TransferDto transferDto);
	
	@Update("update account set balance = balance - #{depo_mon} where account = #{account}")
	public void update(TransferDto transferDto);
	
	@Update("update account set balance = balance + #{depo_mon} where account = #{depo_num} and mem_nm = #{receive_nm}")
	public int update_receive_mon(TransferDto transferDto);
	
	@Select("select act_name, mem_nm, account, regdate, balance, act_password, mem_id from account where account = #{account}")
	public AccountDto findByAccount(long account);
	
	@Select("select * from account where mem_id = #{mem_id}")
	public List<TransferDto> accountList(String mem_id);
	
	@Select("SELECT count(*) FROM transfer WHERE TO_CHAR(trans_date, 'YY/MM') = #{yearMon} AND account = #{account} order by trans_date desc")
    public int list(long account, String yearMon);
    
    @Select("select * from (select rownum num, t.* from (select * from transfer where account = #{account} order by trans_date desc) t)where TO_CHAR(trans_date, 'YY/MM') = #{yearMon} and num between #{startPage} and #{endPage}")
    public List<TransferDto> listWithPaging(long account, String yearMon, int startPage, int endPage);
    
    @Select("select * from (select rownum num, t.* from (select * from transfer where account = #{account} order by trans_date desc) t)where TO_CHAR(trans_date, 'MM/DD/YYYY') BETWEEN #{startDate} AND #{endDate} and num between #{startPage} and #{endPage}")
    public List<TransferDto> listCalendarWithPaging(String startDate, String endDate, long account, int startPage, int endPage);
 
	@Select("SELECT count(*) FROM transfer WHERE TO_CHAR(trans_date, 'MM/DD/YYYY') BETWEEN #{startDate} AND #{endDate} AND account = #{account} order by trans_date desc")
	public int listCalendar(String startDate, String endDate, long account);

	@Insert("insert into Point(point_seq, point, point_date, division, mem_id) values(point_seq.nextval, #{point}, sysdate, #{division}, #{mem_id})")
	public void setPoint(int point, String division, String mem_id);

	
}
