package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	
@Select("select count(*) from board4s where board_code=#{board_code}")
int count(String board_code);

@Select("select * from ( select rownum rnum ,a.* \r\n"
		+ "	from (select * from board4s where board_code=#{board_code} order by ref desc , refstep) a )\r\n"
		+ "	where rnum between #{start} and #{end}")
List<Board> list(int pageNum, int limit, int boardcount, String board_code);

@Select("select board_seq.nextval from dual")
int max(String board_code);

@Select("select * from board4s where board_seq =#{value}")
Board selectOne(int board_seq);

@Update("update  board4s set readcnt = readcnt + 1 where board_seq =#{value}")
void readcntadd(int board_seq);

@Update("update board4s set reply_chk = reply_chk + 1 where board_seq = #{ref}")
void replychange(int ref);

@Update("update  board4s \r\n"
		+ "set user_id=#{user_id},subject=#{subject},content=#{content},file1=#{file1} \r\n"
		+ "where board_seq=#{board_seq}")
boolean update(Board board);

@Update("update board4s set refstep = refstep + 1  where ref = #{ref} and refstep > #{refstep}")
void refstepadd(Map<Integer,Integer> map);

@Insert("insert into board4s (board_seq,board_code,hotel_grade,"
		+ "hotel_code,user_id, board_pass, subject, content, file1, regdate, "
		+ "readcnt, ref,reflevel,refstep,reply_chk)"
		+ "	values(#{board_seq},#{board_code},#{hotel_grade, jdbcType=VARCHAR},"
		+ "#{hotel_code, jdbcType=VARCHAR},#{user_id},#{board_pass}, #{subject}, #{content}, #{file1, jdbcType=VARCHAR}, sysdate, "
		+ "	#{readcnt}, #{ref},#{reflevel},#{refstep},#{reply_chk, jdbcType=VARCHAR})")
boolean insert(Board board);

@Delete("delete from board4s where ref=#{value}")
boolean delete(int board_seq);

}
