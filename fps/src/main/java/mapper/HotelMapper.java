package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Res;
import model.Hotel_Sub4s;
import model.Payment;
import model.Reservation;

public interface HotelMapper {

	@Select({ "<script>",
			"select h.hotel_img,h.HOTEL_CODE,h.HOTEL_NAME,h.HOTEL_ADDR,min(s.PRICE) as price,"
			+ "min(s.GUEST) as guest,trunc(nvl(avg(b.HOTEL_GRADE),0),2) as hotel_grade,h.hotel_intro "
			+ "from hotel4s h join HOTEL_SUB4S s on(h.HOTEL_CODE=s.HOTEL_CODE) left join board4s b on(h.hotel_code=b.HOTEL_CODE) "
			+ "where s.GUEST>=#{guest} and area_code=#{area_code}",
			"<if test='hotel_option1!=null'>", 
			"<foreach collection='hotel_option1' item='arr'>",
			"and hotel_option1 like '%${arr}%' "
			+ "</foreach>"
			+ "</if>", 
			"<if test='hotel_option2!=null'>",
			"<foreach collection='hotel_option2' item='arr'>", 
			"and hotel_option2 like '%${arr}%' "
			+ "</foreach>"
			+ "</if>",
			"group by h.HOTEL_CODE,h.hotel_img, h.HOTEL_ADDR, h.HOTEL_NAME,h.HOTEL_INTRO ORDER BY ${option} ${desc}",
			"</script>" })
	List<Hotel4s_Join_Hotel_Sub4s> hotelsearch(Map<String, Object> map);

	@Select("select h.hotel_img,h.HOTEL_CODE,h.HOTEL_NAME,h.HOTEL_ADDR,"
			+ "TRUNC(nvl(avg(b.HOTEL_GRADE),0),2) as hotel_grade,"
			+ "hotel_option1 as option1,hotel_option2 as option2,hotel_tel\r\n"
			+ "from HOTEL4S h left join board4s b on(h.hotel_code=b.HOTEL_CODE)\r\n"
			+ "where h.HOTEL_CODE=#{hotel_code}\r\n" + 
			"group by h.hotel_img, h.HOTEL_CODE, h.HOTEL_NAME, h.HOTEL_ADDR,hotel_option1,hotel_option2,hotel_tel")
	Hotel4s_Join_Hotel_Sub4s hotelgrade(String hotel_code);

	@Select("select s.*,r.SDATE,r.EDATE "
			+ "from hotel_sub4s s join RESERVATION4S r on(s.ROOM_CODE=r.ROOM_CODE) "
			+ "where s.HOTEL_CODE=#{hotel_code} and "
			+ "r.RES_STATUS !='취소' and s.guest>=${guest} and ((#{sdate}<=r.sdate and #{edate}>r.sdate) or "
			+ "(#{sdate}<r.edate and #{edate}>=r.edate) or (#{sdate}>=r.sdate and #{edate}<=r.edate))")
	List<Hotel_Res> hotelrescheck(Map<String, Object> map);
	
	@Select("select * from hotel_sub4s where HOTEL_CODE=#{hotel_code} and guest>=#{guest}")
	List<Hotel_Sub4s> hotelsublist(Map<String, Object> map);

	@Select("select * from board4s where BOARD_CODE=4 and hotel_code=#{hotel_code}")
	List<Board> boardview(String hotel_code);

	@Select("select h.HOTEL_name,s.* from hotel4s h join HOTEL_SUB4S s on(h.hotel_code=s.hotel_code) where ROOM_CODE=#{room_code}")
	Hotel4s_Join_Hotel_Sub4s roomone(String room_code);

	@Insert("INSERT INTO RESERVATION4S VALUES (res_seq.NEXTVAL,'예약',#{sdate},#{edate},#{guest},#{user_id,jdbcType=VARCHAR},#{name},#{tel},#{room_code},to_char(sysdate,'YYYY-MM-DD HH24:MI'))")
	boolean resinsert(Reservation res);

	@Select("select * from RESERVATION4S where (user_id=#{user_id,jdbcType=VARCHAR} or (name=#{name,jdbcType=VARCHAR} and tel=#{tel,jdbcType=VARCHAR})) and ROWNUM=1 order by 1 desc")
	Reservation selectres(Reservation res);

	@Select("select * from RESERVATION4S where res_seq=#{res_seq}")
	Payment selectresone(Reservation res);

	@Insert("insert into payment4s values(pay_seq.nextval,#{user_id,jdbcType=VARCHAR},#{card_num},#{room_code},${pay_price},to_char(sysdate,'YYYY-MM-DD HH24:MI'),${res_seq})")
	boolean payinsert(Payment pay);

	@Update("update RESERVATION4S set RES_STATUS='결제' where RES_SEQ=#{res_seq}")
	boolean resupdate(int res_seq);

	@Update("update member_coupon4s set cpn_check='no' where cpn_SEQ=#{cpn_seq}")
	boolean cpnupdate(String search_coupon);

	@Select("select * from reservation4s where SDATE>sysdate and RES_STATUS != '취소'")
	List<Reservation> reslist();

}
