package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kb04.ditto.jgig.entity.MemberDto;
import kb04.ditto.jgig.entity.PointDto;

@Mapper
public interface PointMapper {
    
    //Point
    @Select("SELECT * FROM POINT")
    void all_point(PointDto dto);
    
    
    //포인트 조회
    @Select("SELECT POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID " +
            "FROM POINT " +
            "WHERE MEM_ID = #{memId} " +
            "ORDER BY POINT_DATE DESC")
    List<PointDto> getPointByMemberId(String memId);
    
     //필터링된 포인트 조회
    @Select("SELECT count(*) " +
            "FROM POINT " +
            "WHERE MEM_ID = #{memId} " +
            "AND (#{filter} = 'all' OR (#{filter} = 'earn' AND POINT > 0) OR (#{filter} = 'spend' AND POINT < 0)) " +
            "ORDER BY POINT_DATE DESC")
    int getFilteredPointByMemberId(@Param("memId") String memId, @Param("filter") String filter);
    
//    @Select("select rownum num, POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID from \r\n"
//            + "(select rownum num, p.* from (select * from point ORDER BY POINT_DATE DESC) p) \r\n"
//            + "where MEM_ID = #{mem_id} AND (#{filter} = 'all' OR (#{filter} = 'earn' AND POINT > 0) OR (#{filter} = 'spend' AND POINT < 0) and num between #{startPage} and #{endPage})")
//    public List<PointDto> listWithPaging(String mem_id, @Param("filter") String filter, int startPage, int endPage);

    // 고친거
    @Select("select * from(\r\n"
            + "select rownum num, POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID from   (\r\n"
            + "select rownum num, p.* from (\r\n"
            + "select * from point ORDER BY POINT_DATE DESC) p)   \r\n"
            + "where MEM_ID = #{mem_id} and (#{filter} = 'all' OR (#{filter} = 'earn' AND POINT > 0) OR (#{filter} = 'spend' AND POINT < 0)) \r\n"
            + ")where num between #{startPage} and #{endPage}")
    public List<PointDto> listWithPaging(String mem_id, @Param("filter") String filter, int startPage, int endPage);
    
    
    //포인트 전환
    @Insert("INSERT INTO POINT (POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID) " +
            "VALUES (POINT_SEQ.NEXTVAL, #{point, jdbcType=NUMERIC}, SYSDATE, '전환', #{memId, jdbcType=VARCHAR})")
    int conversionPoint(@Param("memId") String memId, @Param("point") int point);
    //전환시 멤버 포인트 업데이트
    @Update("update member set score=score-#{point} where mem_id=#{memId}")
    int conversionUpdatePoint(@Param("memId") String memId, @Param("point") int point);
    
    //출석체크 포인트 적립
    @Insert("INSERT INTO POINT (POINT_SEQ, POINT, POINT_DATE, DIVISION, MEM_ID) " +
            "VALUES (POINT_SEQ.NEXTVAL, #{point, jdbcType=NUMERIC}, SYSDATE, '출석', #{memId, jdbcType=VARCHAR})")
    int checkPoint(@Param("memId") String memId, @Param("point") int point);
    
    //멤버 포인트 업데이트
    @Update("update member set score=score+#{point} where mem_id=#{memId}")
    int updatePoint(@Param("memId") String memId, @Param("point") int point);
    
    //출석체크 중복확인!
    @Select("SELECT COUNT(*) FROM POINT WHERE MEM_ID = #{memId} AND TRUNC(POINT_DATE) = TRUNC(SYSDATE) AND DIVISION='출석' ")
    int countDailyCheckIn(@Param("memId") String memId);
    
    
} 