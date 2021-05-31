package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
import model.Member_Card;
import model.Member_Coupon;

public interface MemberMapper {

	@Insert("insert into member4s " + " (user_id, password,name, birth,email,tel,addr)"
			+ " values (#{user_id}, #{password},#{name}, #{birth},#{email,jdbcType=VARCHAR},#{tel,jdbcType=VARCHAR},#{addr})")
	int insert(Member mem);


	@Update("update member4s set name=#{name},birth=#{birth},tel=#{tel},"
			+ " email=#{email},addr=#{addr} where user_id=#{user_id}")
	int update(Member mem);

	@Update("update member4s set password=#{password} where user_id=#{user_id}")
	int updatepass(Map<String, Object> map);


	@Delete("delete from member4s where user_id=#{user_id}")
	int delete(String user_id);


	@Select("select * from member4s where user_id=#{user_id}")
	Member selectMember(String user_id);

	
	@Select("select * from member4s where name=#{name}")
	Member selectNamefind(String name);

	@Select("select * from member4s where tel=#{tel}")
	Member selectTelfind(String tel);

	
	@Select("select count(*) from member4s where user_id = #{user_id}")
	int useridCheck(String user_id);

	
	@Select("select * from member4s")
	List<Member> select();


	@Select("select * from member_card4s where user_id=#{user_id}")
	List<Member_Card> selectcard(String user_id);


	@Select("select * from member_coupon4s mc join COUPON4S c on(mc.CPN_NUMBER=c.CPN_NUMBER) where user_id=#{user_id}")
	List<Member_Coupon> selectcoupon(String user_id);

	
	@Insert("insert into member_coupon4s values(CPN_SEQ.nextval,#{user_id},'e06251600',sysdate,trunc(sysdate+7),'yes')")
	void signupcpn1(String user_id);
	@Insert("insert into member_coupon4s values(CPN_SEQ.nextval,#{user_id},'j08881125',sysdate,trunc(sysdate+7),'yes')")
	void signupcpn2(String user_id);
	

}
