package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Hotel4s;
import model.Hotel4s2;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Sub4s;
import model.Member;


public interface AdminMapper {
	@Select("select * from hotel4s where hotel_code=#{hotel_code}")
	Hotel4s select(String hotel_code);
	
	@Insert("insert into hotel4s (hotel_code,theme_code,hotel_option1,hotel_option2,hotel_name,hotel_addr,area_code,hotel_img,hotel_tel,hotel_intro) values(#{hotel_code},#{theme_code},#{hotel_option1},#{hotel_option2},#{hotel_name},#{hotel_addr},#{area_code},#{hotel_img},#{hotel_tel},#{hotel_intro})")
	boolean hinsert(Hotel4s hotel4s);
	
	@Select("select * from hotel4s")
	List<Hotel4s> hlist();
	
	@Select("select * from hotel4s where hotel_name like '%'||#{hotel_name}||'%'")
	List<Hotel4s> search(String hotel_name);
	
	@Update("update hotel4s set theme_code=#{theme_code}, hotel_option1=#{hotel_option1}, hotel_option2=#{hotel_option2}, hotel_name=#{hotel_name}, area_code=#{area_code}, hotel_tel=#{hotel_tel}, hotel_addr=#{hotel_addr}, hotel_intro=#{hotel_intro} where hotel_code=#{hotel_code}")
	int hupdate(Hotel4s hotel4s);
	
	@Delete("delete from hotel4s a, hotel_sub4s where a.hotel_code=#{hotel_code}")
	boolean hdelete(String hotel_code);
	
	@Insert("insert into hotel_sub4s(hotel_code,room_code,room_name,room_img,price,guest,room_check) values(#{hotel_code},#{room_code},#{room_name},#{room_img},#{price},#{guest},#{room_check})")
	boolean hsinsert(Hotel_Sub4s hotel_sub4s);
	
	@Select("select * from hotel_sub4s where hotel_code=#{hotel_code}")
	List<Hotel_Sub4s> hslist(String hotel_code);
	
	//호텔서브
	@Select("select * from hotel_sub4s a, hotel4s b where a.hotel_code=b.hotel_code and room_code=#{room_code}")
	Hotel4s_Join_Hotel_Sub4s selectsub(String room_code);
	
	@Delete("delete from hotel_sub4s where room_code=#{room_code}")
	boolean hsdelete(String room_code);
	
	@Update("update hotel_sub4s set hotel_code=#{hotel_code}, room_name=#{room_name}, room_img=#{room_img}, price=#{price}, guest=#{guest}, room_check=#{room_check} where room_code=#{room_code}")
	int hsupdate(Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s);

	@Select("select * from member4s")
	List<Member> memselect();
	
	@Delete("delete from member4s where user_id=#{user_id}")
	int delete(String user_id);
	
	@Select("select * from member4s where user_id=#{user_id}")
	Member selectMember(String id);
	
	@Update("update member4s set birth=#{birth}, name=#{name},email=#{email},tel =#{tel}, addr = #{addr} where user_id = #{user_id}")
	int update(Member member);
	
	@Select("select * from hotel4s where hotel_code=#{hotel_code}")
	Hotel4s selecthc(String hotel_code);
	
}
