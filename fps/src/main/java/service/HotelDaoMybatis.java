package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.HotelMapper;
import model.Board;
import model.Guest_Date;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Res;
import model.Hotel_Sub4s;
import model.Payment;
import model.Reservation;

@Component
public class HotelDaoMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Hotel4s_Join_Hotel_Sub4s> hotelsearch(int guest, String area_code, int option, String[] hotel_option1,
			String[] hotel_option2, String desc) {
		Map<String, Object> map = new HashMap<>();
		map.put("guest", guest);
		map.put("area_code", area_code);
		map.put("option", option);
		map.put("hotel_option1", hotel_option1);
		map.put("hotel_option2", hotel_option2);
		map.put("desc", desc);
		return sqlSession.getMapper(HotelMapper.class).hotelsearch(map);
	}

	public Hotel4s_Join_Hotel_Sub4s hotelgrade(String hotel_code)
	{
		return sqlSession.getMapper(HotelMapper.class).hotelgrade(hotel_code);
	}
	
	public 	void resStatus1() {}
	public 	void resStatus2() {}
	
	  public List<Hotel_Res> hotelrescheck(Guest_Date gd,String hotel_code) {
	  Map<String, Object> map=new HashMap<>(); 
	  map.put("sdate", gd.getSdate());
	  map.put("edate", gd.getEdate());
	  map.put("guest", gd.getGuest());
	  map.put("hotel_code", hotel_code);
	  return sqlSession.getMapper(HotelMapper.class).hotelrescheck(map); 
	  }
	  
	public List<Hotel_Sub4s> hotelsublist(Guest_Date gd,String hotel_code)
	{
		 Map<String, Object> map=new HashMap<>(); 
		 map.put("guest", gd.getGuest());
		 map.put("hotel_code", hotel_code);
		 return sqlSession.getMapper(HotelMapper.class).hotelsublist(map);
	}
 	 

	public List<Board> boardview(String hotel_code) {
		return sqlSession.getMapper(HotelMapper.class).boardview(hotel_code);
	}

	public Hotel4s_Join_Hotel_Sub4s roomone(String room_code) {
		return sqlSession.getMapper(HotelMapper.class).roomone(room_code);
	}

	public boolean resinsert(Reservation res) {
		return sqlSession.getMapper(HotelMapper.class).resinsert(res);
	}

	public Reservation selectres(Reservation res) {
		return sqlSession.getMapper(HotelMapper.class).selectres(res);
	}


	public Payment selectresone(Reservation res) {
		return sqlSession.getMapper(HotelMapper.class).selectresone(res);
	}

	public boolean payinsert(Payment pay) {
		return sqlSession.getMapper(HotelMapper.class).payinsert(pay);
	}

	public boolean resupdate(int res_seq) {
		return sqlSession.getMapper(HotelMapper.class).resupdate(res_seq);
	}
	
	public boolean cpnupdate(String search_coupon)
	{
		return sqlSession.getMapper(HotelMapper.class).cpnupdate(search_coupon);
	}
	
	public List<Reservation> reslist()
	{
		return sqlSession.getMapper(HotelMapper.class).reslist();
	}

	
} // end class