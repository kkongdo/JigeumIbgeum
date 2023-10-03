package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.AccountDto;

@Mapper
public interface AccountMapper {
	@Select("select count(*) from account where mem_id = #{mem_id} order by regdate desc, account")
	public int list(String mem_id);
	
	@Select("select rownum num, account, act_name, act_password, balance, regdate, mem_nm, ssn, phone_num, job, pur_trans, sor_fund, mem_id from (select rownum num, a.*from ( select * from account  where mem_id = #{mem_id} order by regdate desc, balance desc) a )where  num between #{startPage} and #{endPage}")
	public List<AccountDto> listWithPaging(String mem_id, int startPage, int endPage);
	
	@Select("select count(*) from point where TO_CHAR(point_date, 'YYYY-MM-DD')= #{str_regdate} and mem_id = #{mem_id} and division = #{division}")
	public int check_practice(String str_regdate, String mem_id, String division);

	@Insert("insert into Account(account, act_name, act_password, balance, regdate, mem_nm, ssn, phone_num, job, pur_trans, sor_fund, mem_id) values(account_seq.nextval, #{act_name}, "
			+ "#{act_password}, 500000, sysdate, #{mem_nm}, #{ssn}, #{phone_num}, #{job}, #{pur_trans}, #{sor_fund}, #{mem_id})")
	public int insert(AccountDto dto);
	
	@Select("select account from(select * from account order by account desc) where mem_nm = #{mem_nm} and rownum = 1 ")
	public long account_num(AccountDto dto);
	
	@Select("select act_name, account, regdate, balance, act_password from account where account = #{account}")
	public AccountDto findByAccount(long account);
	
	@Select("select mem_nm from member where mem_id = #{mem_id}")
	public String findById(String mem_id);
	
	@Update("update account set act_password = #{act_password} where account = #{account}")
	public void update(AccountDto dto);
	
	@Delete("delete from account where account = #{account}")
	public void terminate(AccountDto dto);

	@Select("select sum(balance) from account where mem_id = #{mem_id}")
	public int totalBalance(String mem_id);
	
	@Select("select act_password from account where account = #{account}")
	public int checkPw(long account);

	@Insert("insert into Point(point_seq, point, point_date, division, mem_id) values(point_seq.nextval, #{point}, sysdate, #{division}, #{mem_id})")
	public void setPoint(int point, String division, String mem_id);
}
