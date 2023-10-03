package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.CardDto;

@Mapper
public interface CardMapper {
	
	@Update("update card set cd_pw=#{new_pw} where cd_no=#{cd_no}")
	public int update_pw(@Param("cd_no") final int cd_no,@Param("new_pw") final String new_pw); //카드 비밀번호 변경
	
	@Update("update card set cd_status=case when cd_status='정상' then '정지' when cd_status='정지' then '정상' end where cd_no=#{cd_no}")
	public int update_status(@Param("cd_no") final int cd_no); //카드 상태 변경
	
	@Delete("delete from card where cd_no=#{cd_no}")
	public int delete(@Param("cd_no") final int cd_no); //선택 카드 삭제(해지)
	
	@Select("select * from card where cd_no=#{cd_no}")
	public CardDto select_card(@Param("cd_no") final int cd_no); //선택카드 조회
	
	@Select("select * from card where mem_id=#{mem_id}")
	public List<CardDto> list(@Param("mem_id") final String mem_id); //소유 카드 리스트.
	
	@Select("SELECT *FROM (SELECT card.*,ROWNUM AS rnum FROM (SELECT * FROM card WHERE mem_id=#{mem_id} "
			+ "ORDER BY start_date DESC) card WHERE ROWNUM < #{pageSize}) WHERE rnum >= #{startRow}")
	public List<CardDto> list_paging(@Param("mem_id") final String mem_id,@Param("startRow") int startRow,@Param("pageSize")int pageSize); //페이징 처리 카드 리스트
	
	@Insert("insert into card (CD_NO,CD_NUM,CD_ITEM,CD_PW,CD_NAME,CD_SSN,CD_PHONE,CD_STATUS,PAY_BANK,PAY_ACCOUNT,PAY_DATE,START_DATE,END_DATE,MEM_ID)"
			+ "VALUES(CARD_NO_SEQ.NEXTVAL,CARD_NUM_SEQ.NEXTVAL,#{cardDto.cd_item},#{cardDto.cd_pw},#{cardDto.cd_name},#{cardDto.cd_ssn},#{cardDto.cd_phone},'정상',#{cardDto.pay_bank},#{cardDto.pay_account},#{cardDto.pay_date},SYSDATE,add_months(sysdate,+12),#{cardDto.mem_id})")
	public int insert(@Param("cardDto") final CardDto cardDto); //카드 발급 insert
	
	@Select("select * from card where mem_id=#{mem_id} AND CD_NO=(select MAX(CD_NO) from card)")
	public CardDto find_last(@Param("mem_id") final String mem_id); //최근 발급한 카드 정보 조회
	
	 // 포인트 적립
    @Insert("INSERT INTO POINT (POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID) " +
            "VALUES (POINT_SEQ.NEXTVAL, #{point, jdbcType=NUMERIC}, SYSDATE, #{division}, #{memId, jdbcType=VARCHAR})")
    int checkPoint(@Param("memId") String memId, @Param("point") int point, @Param("division") String division);
    
    //멤버 포인트 업데이트
    @Update("update member set score=score+#{point} where mem_id=#{memId}")
    int updatePoint(@Param("memId") String memId, @Param("point") int point);
    
    // 포인트 중복확인!
    @Select("SELECT COUNT(*) FROM POINT WHERE MEM_ID = #{memId} AND TRUNC(POINT_DATE) = TRUNC(SYSDATE) AND DIVISION=#{division}")
    int countDailyCheckIn(@Param("memId") String memId, @Param("division") String division);
}
