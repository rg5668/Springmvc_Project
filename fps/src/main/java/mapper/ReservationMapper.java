package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Member;
import model.Member_Card;
import model.Member_Coupon;
import model.hotel4s_hotel_sub4s_reservation4s_join;

public interface ReservationMapper {

	@Select("select * from member4s where user_id = #{user_id}")
	Member selectmember(String user_id);

	@Update("update member4s set birth=#{birth}, name=#{name},email=#{email},tel =#{tel}, addr = #{addr} where user_id = #{user_id}")
	boolean updatemember(Map<String, Object> map);

	@Select("select * from RESERVATION4S a, HOTEL4S b , HOTEL_SUB4S c where b.HOTEL_CODE = c.HOTEL_CODE  and c.ROOM_CODE = a.ROOM_CODE and a.user_id like #{user_id}")
	List<hotel4s_hotel_sub4s_reservation4s_join> selectreservation4s(String user_id);

	@Select("select * from RESERVATION4S a, HOTEL4S b , HOTEL_SUB4S c where b.HOTEL_CODE = c.HOTEL_CODE  and c.ROOM_CODE = a.ROOM_CODE and a.user_id = #{user_id} and a.RES_SEQ = #{res_seq}")
	hotel4s_hotel_sub4s_reservation4s_join selectreservation4s2(@Param("user_id") String user_id,
			@Param("res_seq") int res_seq);

	@Delete("delete from member4s where user_id=#{user_id}")
	boolean memberdelete(String user_id);
	
	@Update("update RESERVATION4S set RES_STATUS = '취소' where RES_SEQ = #{res_seq}")
	boolean updatereservation(int res_seq);
	
	@Select("select * from board4s where res_seq=#{res_seq}")
	Board reviewsearch(int res_seq);
	
	@Select("select s.hotel_code,r.* from hotel_sub4s s join reservation4s r on(s.room_code=r.room_code) where res_seq=#{res_seq}")
	Board reviewres(int res_seq);
	
	@Insert("insert into board4s(BOARD_SEQ,BOARD_CODE,hotel_grade,hotel_code,user_id,subject,content,res_seq) \r\n"
			+ "values(BOARD_SEQ.NEXTVAL,'4',#{hotel_grade},#{hotel_code},#{user_id},#{subject},#{content},#{res_seq})")
	boolean reviewinsert(Board b);
	
	@Select("select * from member_coupon4s m join coupon4s c on(m.cpn_number=c.cpn_number) where user_id=#{user_id} and cpn_check='yes'")
	List<Member_Coupon> searchcpn(String user_id);
	
	@Select("select * from member_card4s where user_id=#{user_id}")
	List<Member_Card> searchcard(String user_id);
	
	@Select("select * from coupon4s where cpn_number=#{cpn_number}")
	Member_Coupon checkcpn(String cpn_number);
	
	@Select("select * from member_coupon4s where cpn_number=#{cpn_number} and user_id=#{user_id}")
	Member_Coupon duplicationcpn(Member_Coupon cpn);
	
	@Insert("insert into member_coupon4s values(cpn_seq.nextval,#{user_id},#{cpn_number},sysdate,trunc(sysdate+7),'yes')")
	boolean insertcpn(Member_Coupon mc);
}
