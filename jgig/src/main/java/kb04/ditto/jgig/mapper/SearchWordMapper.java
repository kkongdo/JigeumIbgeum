package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kb04.ditto.jgig.entity.PopularWordDto;

@Mapper
public interface SearchWordMapper {
	@Insert("insert into popular_word(pw_word, pw_date, pw_age, mem_id) \r\n"
			+ "values (#{pw_word}, sysdate, #{pw_age}, #{mem_id})")
	public int insert(PopularWordDto dto);
	
	@Select("select *\r\n"
			+ "from (\r\n"
			+ "    select pw_word, pw_age, count(pw_word)\r\n"
			+ "    from popular_word\r\n"
			+ "    where pw_age = #{mem_age}\r\n"
			+ "    group by pw_word, pw_age\r\n"
			+ "    order by count(pw_word) desc\r\n"
			+ ")\r\n"
			+ "where rownum <= 10")
	public List<PopularWordDto> list(int mem_age);
	
	@Select("select *\r\n"
			+ "from (\r\n"
			+ "    select pw_word, count(pw_word)\r\n"
			+ "    from popular_word\r\n"
			+ "    group by pw_word\r\n"
			+ "    order by count(pw_word) desc\r\n"
			+ ")\r\n"
			+ "where rownum <= 10")
	public List<PopularWordDto> allAgeList();
	
	@Select("SELECT\r\n"
			+ "  CASE\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 10 AND 19 THEN 10\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 20 AND 29 THEN 20\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 30 AND 39 THEN 30\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 40 AND 49 THEN 40\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 50 AND 59 THEN 50\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 60 AND 69 THEN 60\r\n"
			+ "    WHEN EXTRACT(YEAR FROM sysdate) - TO_NUMBER('19' || SUBSTR(ssn, 1, 2)) BETWEEN 70 AND 79 THEN 70\r\n"
			+ "    ELSE 0\r\n"
			+ "  END AS age\r\n"
			+ "FROM MEMBER\r\n"
			+ "WHERE mem_id = #{mem_id}")
	public int selectAge(String mem_id);
}
