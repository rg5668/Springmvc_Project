package service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mapper.AdminMapper;
import mapper.FpsMapper;
import mapper.MemberMapper;
import model.Hotel4s;
import model.Hotel4s2;
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Hotel_Sub4s;
import model.Member;

@Repository
public class AdminDaoMybatis {
	 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Hotel4s select(String hotel_code) {
		return sqlSession.getMapper(AdminMapper.class).select(hotel_code);
	}
	
	public boolean hinsert(Hotel4s hotel4s) {
		
		return sqlSession.getMapper(AdminMapper.class).hinsert(hotel4s);
	}
	
	public List<Hotel4s> hlist() {
		return sqlSession.getMapper(AdminMapper.class).hlist();
	}
	
	public int hupdate(Hotel4s hotel4s) {
		return sqlSession.getMapper(AdminMapper.class).hupdate(hotel4s);
	}
	
	public boolean hdelete(String hotel_code) {
		return sqlSession.getMapper(AdminMapper.class).hdelete(hotel_code);
	}
	
	public boolean hsinsert(Hotel_Sub4s hotel_sub) {
	    return sqlSession.getMapper(AdminMapper.class).hsinsert(hotel_sub);
	}
	
	public List<Hotel_Sub4s> hslist(String hotel_code) {
		return sqlSession.getMapper(AdminMapper.class).hslist(hotel_code);
	}
	
	public boolean hsdelete(String room_code) {
		return sqlSession.getMapper(AdminMapper.class).hsdelete(room_code);
	}
	
	public Hotel4s_Join_Hotel_Sub4s selectsub(String room_code) {
		return sqlSession.getMapper(AdminMapper.class).selectsub(room_code);
	}
	
	public int hsupdate(Hotel4s_Join_Hotel_Sub4s hotel4s_join_hotel_sub4s) {
		return sqlSession.getMapper(AdminMapper.class).hsupdate(hotel4s_join_hotel_sub4s);
	}
	
	public List<Member> memselect() {
		return sqlSession.getMapper(AdminMapper.class).memselect();
	}
	
	public int delete(String user_id) {	
		return sqlSession.getMapper(AdminMapper.class).delete(user_id);
	}
	
	public Member selectOne(String user_id) {	
		return sqlSession.getMapper(AdminMapper.class).selectMember(user_id);
	}
	
	public int update(Member member) {
		return sqlSession.getMapper(AdminMapper.class).update(member);
	}

	public List<Hotel4s> search(String hotel_name) {
		return sqlSession.getMapper(AdminMapper.class).search(hotel_name);
	}
}