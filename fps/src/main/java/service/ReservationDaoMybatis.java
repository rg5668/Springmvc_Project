package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import mapper.ReservationMapper;
import model.Board;
import model.Member;
import model.Member_Card;
import model.Member_Coupon;
import model.Reservation;
import model.hotel4s_hotel_sub4s_reservation4s_join;

@Repository
public class ReservationDaoMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectmember(String user_id) {
		return sqlSession.getMapper(ReservationMapper.class).selectmember(user_id);
	}

	public boolean updatemember(Member mem) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", mem.getUser_id());
		map.put("birth", mem.getBirth());
		map.put("name", mem.getName());
		map.put("email", mem.getEmail());
		map.put("tel", mem.getTel());
		map.put("addr", mem.getAddr());
		return sqlSession.getMapper(ReservationMapper.class).updatemember(map);
	}
	
	public boolean memberdelete(String user_id)
	{
		return sqlSession.getMapper(ReservationMapper.class).memberdelete(user_id);
	}

	public List<hotel4s_hotel_sub4s_reservation4s_join> selectreservation4s(String user_id) {
		return sqlSession.getMapper(ReservationMapper.class).selectreservation4s(user_id);
	}

	public hotel4s_hotel_sub4s_reservation4s_join selectreservation4s2(@Param("user_id") String user_id,
			@Param("res_seq") int res_seq) {
		return sqlSession.getMapper(ReservationMapper.class).selectreservation4s2(user_id, res_seq);
	}

	public boolean updatereservation(int res_seq) {
		return sqlSession.getMapper(ReservationMapper.class).updatereservation(res_seq);
	}
	
	public Board reviewsearch(int res_seq)
	{
		return sqlSession.getMapper(ReservationMapper.class).reviewsearch(res_seq);
	}
	
	public Board reviewres(int res_seq)
	{
		return sqlSession.getMapper(ReservationMapper.class).reviewres(res_seq);
	}
	
	public boolean reviewinsert(Board b)
	{
		return sqlSession.getMapper(ReservationMapper.class).reviewinsert(b);
	}
	
	public List<Member_Coupon> searchcpn(String user_id)
	{
		return sqlSession.getMapper(ReservationMapper.class).searchcpn(user_id);
	}
	public List<Member_Card> searchcard(String user_id)
	{
		return sqlSession.getMapper(ReservationMapper.class).searchcard(user_id);
	}
	public Member_Coupon checkcpn(String cpn_number)
	{
		return sqlSession.getMapper(ReservationMapper.class).checkcpn(cpn_number);
	}
	
	public Member_Coupon duplicationcpn(Member_Coupon cpn)
	{
		return sqlSession.getMapper(ReservationMapper.class).duplicationcpn(cpn);
	}
	public boolean insertcpn(Member_Coupon mc)
	{
		return sqlSession.getMapper(ReservationMapper.class).insertcpn(mc);
	}

}
