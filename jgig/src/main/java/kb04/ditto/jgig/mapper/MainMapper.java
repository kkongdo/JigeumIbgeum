package kb04.ditto.jgig.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kb04.ditto.jgig.entity.BoardDto;
import kb04.ditto.jgig.entity.MemberDto;
import kb04.ditto.jgig.entity.NoticeDto;
import kb04.ditto.jgig.entity.PointDto;

@Mapper
public interface MainMapper {
    
    @Select("select * from(select * from board where BRD_CATEGORY='자유' order by brd_id desc) where rownum<=7")
    public List<BoardDto> free_list();
    
    @Select("select * from(select * from board where BRD_CATEGORY='질문' order by brd_id desc) where rownum<=7")
    public List<BoardDto> question_list();
    
    @Select("select * from(select * from notice order  by ntc_id desc) where rownum<=7")
    public List<NoticeDto> notice_list();
    
    @Select("select rank() over (order by score desc) as ranking, nickname, score\n"
            + "from (\n"
            + "select sum(p.point) score, m.mem_id, m.nickname\n"
            + "from point p, member m\n"
            + "where p.mem_id = m.mem_id\n"
            + "group by m.mem_id, m.nickname\n"
            + ")\n"
            + "WHERE rownum <= 10")
    public List<MemberDto> point_rank();
    //수정
    //@Select("SELECT nickname,score FROM (SELECT RANK() OVER (ORDER BY score DESC) AS ranking, nickname, score FROM member)WHERE ranking <= 10")
    //public List<MemberDto> point_rank();
    
    @Select("select * from point where mem_id=#{mem_id}  AND DIVISION='출석' AND  extract(month from to_date(point_date))=extract(month from sysdate) order by point_date")
    public List<PointDto> att_list(@Param("mem_id") final String mem_id);
    

}