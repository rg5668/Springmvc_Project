package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import model.Hotel4s;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Member;

public interface FpsMapper {
	@Select("select * from hotel4s where area_code=#{area_code}")
	List<Hotel4s> select(String area_code);
	
	@Select("select * from hotel4s where area_code=#{area_code}")
	Hotel4s selectArea(String area_code);
	
	@Select("select * from hotel4s where hotel_name like '%'||#{hotel_name}||'%'")
	List<Hotel4s> search(String hotel_name);
	
	@Select("select * from hotel_sub4s a, hotel4s b where a.HOTEL_CODE = b.HOTEL_CODE and a.HOTEL_CODE=#{HOTEL_CODE}")
	List<Hotel4s_Join_Hotel_Sub4s> saleList(String hotel_code);

	@Select("select * from hotel_sub4s a, hotel4s b where a.HOTEL_CODE = b.HOTEL_CODE and a.HOTEL_CODE=#{HOTEL_CODE}")
	List<Hotel4s_Join_Hotel_Sub4s> bestList(String hotel_code);
	
	@Select("select * from hotel4s a, hotel_sub4s b where a.hotel_code = b.hotel_code and a.theme_code=#{theme_code}")
	List<Hotel4s_Join_Hotel_Sub4s> temaList2(String theme_code);
	
	@Select("select * from hotel4s where theme_code=#{theme_code}")
	List<Hotel4s> temaList(String theme_code);
	
	@Select("select * from hotel4s")
	List<Hotel4s> alllist();
}
