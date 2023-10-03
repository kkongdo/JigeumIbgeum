package kb04.ditto.jgig.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kb04.ditto.jgig.entity.QuizDto;

@Mapper
public interface QuizMapper {
	// 포인트 적립
	@Insert("insert into point(point_seq, point, point_date, division, mem_id) values (point_seq.NEXTVAL, 10, sysdate, '퀴즈', #{mem_id})")
	public int insertPoint(String mem_id);
	
	// 퀴즈테이블에 결과 insert
	@Insert("insert into quiz(mem_id, quiz_stat, quiz_date, answer, my_answer)\r\n"
			+ "values (#{mem_id}, #{quiz_stat}, to_char(sysdate, 'yyyy-mm-dd'), #{answer}, #{my_answer})")
	public int insertQuiz(String mem_id, String quiz_stat, int answer, int my_answer);
	
	// 오늘 퀴즈 맞췄는지 조회 
	@Select("select * from quiz where mem_id = #{mem_id} and quiz_date = to_char(sysdate, 'yyyy-mm-dd')")
	public QuizDto selectQuiz(String mem_id);
}
