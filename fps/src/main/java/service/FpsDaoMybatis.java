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
import model.Hotel4s_Join_Hotel_Sub4s;
import model.Member;

@Repository
public class FpsDaoMybatis {
	 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Hotel4s> list(String area_code) {
		return sqlSession.getMapper(FpsMapper.class).select(area_code);
	}

	public Hotel4s selectArea(String area_code) {
		
		return sqlSession.getMapper(FpsMapper.class).selectArea(area_code);
	}
	
	public List<Hotel4s> search(String hotel_name) {
		return sqlSession.getMapper(FpsMapper.class).search(hotel_name);
	}
	
	public List<Hotel4s_Join_Hotel_Sub4s> saleList(String hotel_code) {
		return sqlSession.getMapper(FpsMapper.class).saleList(hotel_code);
	}
	
	public List<Hotel4s_Join_Hotel_Sub4s> bestList(String hotel_code) {
		return sqlSession.getMapper(FpsMapper.class).saleList(hotel_code);
	}
	
	public List<Hotel4s> temaList(String theme_code) {
		return sqlSession.getMapper(FpsMapper.class).temaList(theme_code);
	}
	
	public List<Hotel4s> alllist() {
		return sqlSession.getMapper(FpsMapper.class).alllist();
	}
}