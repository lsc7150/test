package kr.co.ezen.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.FaqBoardBean;
import kr.co.ezen.beans.KakaoBean;

public interface KakaoMapper {

	@Select("select * from kakaoT where k_name=#{nickname} and k_email=#{email}")
		KakaoBean selectKakaoOne(HashMap<String, Object> userInfo);
	
	@Insert("insert into kakaoT(k_number, k_name,k_email,k_gender,k_age_range,k_birthday) "
			+ " values(k_sq.nextval,#{nickname},#{email},#{gender, jdbcType=VARCHAR},#{age_range, jdbcType=VARCHAR},#{birthday, jdbcType=VARCHAR})")
		void insertKakao(HashMap<String, Object> userInfo);
}
