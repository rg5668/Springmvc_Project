package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mapper.MemberMapper;
import model.Member;
import model.Member_Card;
import model.Member_Coupon;

@Repository
public class MemberDaoMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Member mem) {

		return sqlSession.getMapper(MemberMapper.class).insert(mem);
	}

	public Member selectOne(String user_id) {

		return sqlSession.getMapper(MemberMapper.class).selectMember(user_id);
	}

	public List<Member_Card> selectcard(String user_id) {
		return sqlSession.getMapper(MemberMapper.class).selectcard(user_id);
	}

	public List<Member_Coupon> selectcoupon(String user_id) {
		return sqlSession.getMapper(MemberMapper.class).selectcoupon(user_id);
	}
	
	public Member selectNamefind(String name) {
		return sqlSession.getMapper(MemberMapper.class).selectNamefind(name);
	}

	public Member selectTelfind(String tel) {
		return sqlSession.getMapper(MemberMapper.class).selectTelfind(tel);
	}

	public int useridCheck(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberMapper.class).useridCheck(user_id);
	}
	
	public void signupcpn(String user_id)
	{
		sqlSession.getMapper(MemberMapper.class).signupcpn1(user_id);
		sqlSession.getMapper(MemberMapper.class).signupcpn2(user_id);
	}

}