package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
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
}
