package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.MemberDto;

@Mapper
public interface MemberMapper {

	// Member
	@Select("SELECT * FROM MEMBER")
	void member(MemberDto dto);

	// 회원가입
	@Insert(" INSERT INTO MEMBER\r\n"
			+ "            (mem_id, mem_pw, mem_nm, nickname, phone_num, ssn, mem_stat, score, authority)\r\n"
			+ "        VALUES\r\n"
			+ "            (#{mem_id}, #{mem_pw}, #{mem_nm}, #{nickname}, #{phone_num}, #{ssn}, 'y', #{score}, 0)")
	void signup(MemberDto dto);

	// 로그인
	@Select("select * from MEMBER where mem_id = #{mem_id} and mem_pw = #{mem_pw}")
	MemberDto login(MemberDto dto);

	// 회원정보조회
	@Select("SELECT * FROM MEMBER where mem_id= #{mem_id}")
	MemberDto detail(String mem_id);

	// 회원정보 수정
	@Update("UPDATE MEMBER " 
	+ "SET mem_nm= #{mem_nm},"
	+ "phone_num= #{phone_num},"
	+ "nickname= #{nickname},"
	+ "mem_pw = #{mem_pw}"
	+ " WHERE mem_id = #{mem_id}")
	void update(MemberDto Dto);

	
	// 회원 탈퇴
    // 비밀번호 조회
    @Select("SELECT mem_pw FROM MEMBER WHERE mem_id = #{mem_id}")
    String getPassword(@Param("mem_id") String mem_id);

  
    //회원 삭제
	@Delete("DELETE FROM MEMBER WHERE mem_id = #{mem_id}")
	void delete(String mem_id);

}