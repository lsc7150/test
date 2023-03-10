package kr.co.ezen.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.MemberDAO;
@Service
public class MemberService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;  	
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	public void getLoginMember(MemberBean MemberBean) {
		MemberBean loginMemberBean2 = memberDAO.getLoginMember(MemberBean);
		
		if(loginMemberBean2 != null) {
			loginMemberBean.setM_classify(loginMemberBean2.getM_classify());
			loginMemberBean.setM_memberNo(loginMemberBean2.getM_memberNo());
			loginMemberBean.setM_id(loginMemberBean2.getM_id());
			loginMemberBean.setM_pw(loginMemberBean2.getM_pw());
			loginMemberBean.setM_name(loginMemberBean2.getM_name());
			loginMemberBean.setM_birth(loginMemberBean2.getM_birth());
			loginMemberBean.setM_gender(loginMemberBean2.getM_gender());
			loginMemberBean.setM_tele(loginMemberBean2.getM_tele());
			loginMemberBean.setM_joinDate(loginMemberBean2.getM_joinDate());
			loginMemberBean.setM_email(loginMemberBean2.getM_email());
			loginMemberBean.setM_confirm(loginMemberBean2.getM_confirm());
			
			MemberBean.setMemberlogin(true);
		}
	}
	
	public MemberBean getModifyMember(MemberBean modifyMemberBean) {
		
		MemberBean modifyMemberBean2 = memberDAO.getModifyMember(loginMemberBean.getM_memberNo());
		
		
		modifyMemberBean.setM_id(modifyMemberBean2.getM_id());
		modifyMemberBean.setM_name(modifyMemberBean2.getM_name());
		
		return modifyMemberBean;
	}
	
	public void updateMember(MemberBean modifyMemberBean) {
		modifyMemberBean.setM_memberNo(loginMemberBean.getM_memberNo());
		memberDAO.updateMember(modifyMemberBean);
	}
	
	public void deleteMemeber(int m_memberNo) {
		
		memberDAO.deleteMemeber(loginMemberBean.getM_memberNo());
	}
	
	public void joinMember(MemberBean joinMemberBean) {
		memberDAO.joinMember(joinMemberBean);
	}
	
	
	
	public MemberBean getMypageMember(MemberBean mypageMemberBean, HttpServletRequest request) {
		
		
		if(loginMemberBean.getM_memberNo() != 0) {
		MemberBean mypageMemberBean2 = memberDAO.getMypageMember(loginMemberBean.getM_memberNo());

		
		mypageMemberBean.setM_id(mypageMemberBean2.getM_id());
		mypageMemberBean.setM_name(mypageMemberBean2.getM_name());
		mypageMemberBean.setM_tele(mypageMemberBean2.getM_tele());
		mypageMemberBean.setM_email(mypageMemberBean2.getM_email());
		}else {
			HttpSession session = request.getSession();
		   MemberBean memberBean = (MemberBean) session.getAttribute("loginMemberBean");
			MemberBean mypageMemberBean2 = memberDAO.getMypageMember(memberBean.getM_memberNo());
			mypageMemberBean.setM_id(mypageMemberBean2.getM_id());
			mypageMemberBean.setM_name(mypageMemberBean2.getM_name());
			mypageMemberBean.setM_tele(mypageMemberBean2.getM_tele());
			mypageMemberBean.setM_email(mypageMemberBean2.getM_email());
		}
		return mypageMemberBean;
	}
	public List<MemberChildBean> getMypageMemberChild(int m_memberNo) {
		return memberDAO.getMypageMemberChild(m_memberNo);
	}
	
	public void insertChild(MemberChildBean insertChildBean) {
		memberDAO.insertChild(insertChildBean);
 	}
	
	public MemberChildBean getModifyChild(MemberChildBean modifyChildBean) {
		modifyChildBean.setM_memberNo(loginMemberBean.getM_memberNo());
 		MemberChildBean modifyChildBean2 = memberDAO.getModifyChild(modifyChildBean);
 		
 		modifyChildBean.setC_name(modifyChildBean2.getC_name());
 		modifyChildBean.setC_grade(modifyChildBean2.getC_grade());
 		modifyChildBean.setC_gender(modifyChildBean2.getC_gender());
 		modifyChildBean.setC_level(modifyChildBean2.getC_level());
 		return modifyChildBean;
 			
 	}
	
	public void modifyChild(MemberChildBean modifyChild) {
		
		memberDAO.modifyChild(modifyChild);
 	}
	
	public void deleteChild(MemberChildBean deleteChildBean) {
		
		memberDAO.deleteChild(deleteChildBean);
 	}

	public void deleteAllChild(int m_memberNo) {
		memberDAO.deleteAllChild(m_memberNo);
 	}
	
	public void deleteWishList(int m_memberNo) {
		memberDAO.deleteWishList(m_memberNo);
 	}
	
	public MemberBean getKakaoLoginMember( String m_id) {
		  MemberBean kakaoMemberBean =  memberDAO.getKakaoLoginMember(m_id);
		return kakaoMemberBean; 
	  }
	
	// ???????????????
		public void sendEmail(MemberBean memberBean, String div) throws Exception {
			// Mail Server ??????
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com"; // ????????? ????????? smtp.naver.com
			String hostSMTPid = ""; //moma417@naver.com
			String hostSMTPpwd = ""; //3M5PE4G346VL
			
			// ????????? ?????? EMail, ??????, ??????
			String fromEmail = "moma417@naver.com";
			String fromName = "SkyCastle";
			String subject = "";
			String msg = "";

			if (div.equals("findpw")) {
				subject = "??????????????? ?????? ???????????? ?????????.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += memberBean.getM_id() + "?????? ?????? ???????????? ?????????. ??????????????? ???????????? ???????????????.</h3>";
				msg += "<p>?????? ???????????? : ";
				msg += memberBean.getM_pw() + "</p></div>";
			}

			// ?????? ?????? E-Mail ??????
			String mail = memberBean.getM_email();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(465); // ????????? ????????? 587

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("???????????? ?????? : " + e);
			}
		}

		//??????????????????
		public void findPw(HttpServletResponse response, MemberBean memberBean) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			MemberBean ck = memberDAO.readMember(memberBean.getM_id());
			PrintWriter out = response.getWriter();
			// ????????? ???????????? ?????????
			if (memberDAO.readMember(memberBean.getM_id()) == null) {
				out.print("???????????? ?????? ??????????????????.");
				out.close();
			}
			// ????????? ???????????? ?????????
			else if (!memberBean.getM_email().equals(ck.getM_email())) {
				out.print("???????????? ?????? ??????????????????.");
				out.close();
			} else {
				// ?????? ???????????? ??????
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				memberBean.setM_pw(pw);
				// ???????????? ??????
				memberDAO.updatePw(memberBean);
				// ???????????? ?????? ?????? ??????
				sendEmail(memberBean, "findpw");

				out.print("???????????? ?????? ??????????????? ?????????????????????.");
				out.close();
			}
		}
		
		//????????????????????? 
		
		public String getAccessToken (String authorize_code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";

			try {
				URL url = new URL(reqURL);
	            
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				// POST ????????? ?????? ???????????? false??? setDoOutput??? true???
	            
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				// POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
	            
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
	            
				sb.append("&client_id=fbbc5c452681184de4d17b6575dd2e5d"); //????????? ???????????? key
				sb.append("&redirect_uri=http://localhost:8700/SkyCastleProject/"); // ????????? ????????? ??????
	            
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
	            
				// ?????? ????????? 200????????? ??????
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
	            
				// ????????? ?????? ?????? JSON????????? Response ????????? ????????????
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
	            
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
	            
				// Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
	            
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
	            
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}
		
		//?????? ??? ????????????
		public List<SiteAskBean> getMyaskList(int m_memberNo){
			return memberDAO.getMyaskList(m_memberNo);
		}	
		public SiteAskBean getMyaskRead(Timestamp sa_time, int m_memberNo){
			return memberDAO.getMyaskRead(sa_time, m_memberNo);
		}
		
		public int getMyAskListCnt(MemberBean myAskBean) {
			return memberDAO.getMyAskListCnt(myAskBean);
		}
		
		public PageCountBean getMyAskContentCnt(int currentPage) {
		
			int content_cnt = memberDAO.getMyAskContentCnt(loginMemberBean.getM_memberNo());
			 
			//contentCnt: ???????????????, currentPage: ????????? ??????, contentPageCnt: ???????????? ??? ??????, pagButtonCnt: ????????? ????????? ??????
			PageCountBean mypageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
			 
			return mypageCountBean;
		}
		
		//????????? ???????????????
		//public List<MemberBean> getAdminPageList() {
		//	return memberDAO.getAdminPageList();
		//}
		
		//????????? ???????????? ?????????
		public List<MemberBean> getAdMemberList(){
			return memberDAO.getAdMemberList();
		}
		//????????????
		public int getAdminMemberCnt(MemberBean myAdminMemberBean) {
			return memberDAO.getAdminMemberCnt(myAdminMemberBean);
		}
}
