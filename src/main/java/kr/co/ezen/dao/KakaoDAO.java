package kr.co.ezen.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.FaqBoardBean;
import kr.co.ezen.beans.KakaoBean;
import kr.co.ezen.mapper.FaqMapper;
import kr.co.ezen.mapper.KakaoMapper;
import kr.co.ezen.mapper.MemberMapper;

@Repository
public class KakaoDAO {

	@Autowired
	KakaoMapper kakaoMapper;
    
    
    
    // 정보 저장
    public void kakaoinsert(HashMap<String, Object> userInfo) {
    	kakaoMapper.insertKakao(userInfo);
    }
 
    // 정보 확인
    public KakaoBean findkakao(HashMap<String, Object> userInfo) {
        System.out.println("RN:"+userInfo.get("nickname"));
        System.out.println("RE:"+userInfo.get("email"));
        System.out.println("성별:"+userInfo.get("gender"));
        System.out.println("연령대:"+userInfo.get("age_range"));
        System.out.println("생일:"+userInfo.get("birthday"));
        
        return kakaoMapper.selectKakaoOne(userInfo);
    }
}