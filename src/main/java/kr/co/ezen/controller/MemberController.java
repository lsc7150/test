package kr.co.ezen.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.service.MemberService;
@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	@Lazy
	MemberBean loginMemberBean;
	
	
	//로그인페이지이동
	@GetMapping("/login")
	public String login(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean, Model model) {
		
		model.addAttribute("loginMemberBean", loginMemberBean);
		
		return "member/login";
	}
	//로그인 
	@PostMapping("/login_pro")
	public String login_pro(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean, BindingResult result, HttpServletRequest request){
		if(result.hasErrors()) {
			return "member/login";
		}
		memberService.getLoginMember(loginMemberBean);
		
		if(loginMemberBean.isMemberlogin() == true) {
			 HttpSession session = request.getSession();
			 session.setAttribute("loginMemberBean", this.loginMemberBean);
			loginMemberBean.setMemberlogin(true);
			return "index";
		}else {
			loginMemberBean.setMemberlogin(false);
			return "index";
		}
		
		
	}
	//회원정보수정페이지이동
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean) {
		
		memberService.getModifyMember(modifyMemberBean);
		
		return "member/modify";
	}
	//회원정보수정
	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, 
													@ModelAttribute("mypageMemberBean") MemberBean mypageMemberBean, 
													BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "member/modify";
		}
		memberService.updateMember(modifyMemberBean);
		memberService.getMypageMember(mypageMemberBean, request);
		return "member/mypage";
	}
	//회원탈퇴확인
		@GetMapping("/delete")
		public String delete() {
			return "member/delete";
		}
		
		//회원탈퇴
		@GetMapping("/delete_pro")
		public String delete(HttpSession session) {
			memberService.deleteWishList(loginMemberBean.getM_memberNo());
			memberService.deleteAllChild(loginMemberBean.getM_memberNo());
			memberService.deleteMemeber(loginMemberBean.getM_memberNo());
			session.invalidate();
			return "index";
		}
	//회원가입페이지 이동
	@GetMapping("/join")
	public String join(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean, @ModelAttribute("joinAcademyMemberBean") AcademyMemberBean joinAcademyMemberBean) {
		
		
		return "member/join";
	}
	//회원가입
	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "member/join";
		}
		memberService.joinMember(joinMemberBean);
		return "index";
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	//mypage보기
		@GetMapping("/mypage")
		public String mypage(@ModelAttribute("mypageMemberBean") MemberBean mypageMemberBean, HttpServletRequest request, Model model) {
			
			
			memberService.getMypageMember(mypageMemberBean, request);
			
			return "member/mypage";
		}
	//자녀정보입력이동
	@GetMapping("/insertChild")
	public String insertChild(@ModelAttribute("insertChildBean") MemberChildBean insertChildBean) {
		
		return "member/insertChild";
	}
	//자녀정보입력
	@PostMapping("/insertChild_pro")
	public String insertChild_pro(@ModelAttribute("insertChildBean") MemberChildBean insertChildBean, BindingResult result) {
		if(result.hasErrors()) {
			return "member/insertChild";
		}
		insertChildBean.setM_memberNo(loginMemberBean.getM_memberNo());
		memberService.insertChild(insertChildBean);
		return "member/studentinfo";
	}
	//자녀정보수정페이지 이동
	@GetMapping("modifyChild")
	public String modifyChild(@ModelAttribute("modifyChildBean") MemberChildBean modifyChildBean, @RequestParam String c_name) {
		modifyChildBean.setC_name(c_name);
		memberService.getModifyChild(modifyChildBean);
		return "member/modifyChild";
	}
	//자녀정보수정
	@PostMapping("modifyChild_pro")
	public String modifyChild_pro(@ModelAttribute("modifyChildBean") MemberChildBean modifyChild, Model model, BindingResult result) {
		if(result.hasErrors()) {
			return "member/modifyChild";
		}
	
		memberService.modifyChild(modifyChild);
		List<MemberChildBean> memberChildlist = memberService.getMypageMemberChild(loginMemberBean.getM_memberNo());
	 	model.addAttribute("memberChildlist", memberChildlist);
		return "member/studentinfo";
	}
	//자녀정보삭제
	@GetMapping("deleteChild")
	public String deleteChild(@ModelAttribute("deleteChildBean") MemberChildBean deleteChildBean, @RequestParam String c_name, Model model) {
		deleteChildBean.setM_memberNo(loginMemberBean.getM_memberNo());
		deleteChildBean.setC_name(c_name);
		memberService.deleteChild(deleteChildBean);
		List<MemberChildBean> memberChildlist = memberService.getMypageMemberChild(loginMemberBean.getM_memberNo());
	 	model.addAttribute("memberChildlist", memberChildlist);
		return "member/studentinfo";
	}
	
	//비밀번호 찾기 
		@RequestMapping(value = "/findpw", method = RequestMethod.GET)
		public void findPwGET(){
			
		}

		@RequestMapping(value = "/findpw.do", method = RequestMethod.POST)
		@ResponseBody
		public void findPwPOST(@ModelAttribute MemberBean memberBean, HttpServletResponse response) throws Exception{
			System.out.println(memberBean);
			memberService.findPw(response, memberBean);
		}
		//내가 쓴 문의사항
		@GetMapping("/mypage_siteAsk")
		public String myAsk(@ModelAttribute("myAskBean") MemberBean myAskBean,
							@RequestParam(value = "myAskPage", defaultValue = "1") int myAskPage,
							Model model) {
			
			List<SiteAskBean> myasklist = memberService.getMyaskList(loginMemberBean.getM_memberNo());
			model.addAttribute("myasklist", myasklist);
			
			int myasktotCnt = memberService.getMyAskListCnt(myAskBean);
			model.addAttribute("myasktotCnt", myasktotCnt);
			
			PageCountBean mypageCountBean = memberService.getMyAskContentCnt(myAskPage);
			model.addAttribute("mypageCountBean", mypageCountBean);
			
			model.addAttribute("myAskPage", myAskPage);
			
			return "member/mypage_siteAsk";
		}
		
		@GetMapping("/mypage_siteAskRead")
		public String myAskRead(@RequestParam("sa_time") Timestamp sa_time, 
								Model model) {
			
			SiteAskBean myaskreadBean = memberService.getMyaskRead(sa_time, loginMemberBean.getM_memberNo());
			
			model.addAttribute("myaskreadBean", myaskreadBean);
			
			return "member/mypage_siteAskRead";
		}
		
		//관리자 마이페이지
		@GetMapping("/mypageAdmin")
		public String adminPage(Model model) {
							
			return "member/mypageAdmin";
		}
			
		//관리자 회원 목록 페이지
		@GetMapping("/mypageAdmin_member")
		public String abMemberList(@ModelAttribute("myAdminMemberBean") MemberBean myAdminMemberBean,
									Model model) {
			
			List<MemberBean> adMemberlist = memberService.getAdMemberList();
		 	model.addAttribute("adMemberlist", adMemberlist);
		 	
			int admemtotCnt = memberService.getAdminMemberCnt(myAdminMemberBean);
			model.addAttribute("admemtotCnt", admemtotCnt);
					
			model.addAttribute("myAdminMemberBean", myAdminMemberBean);
			
			return "member/mypageAdmin_member";
		}
				
			
		//관리자 문의사항 수신 목록	
		@GetMapping("/mypageAdmin_siteAsk")
		public String abSiteAskList(@ModelAttribute("myAdminSearchBean") MemberBean myAdminSearchBean,
									Model model) {	
			
			return "member/mypageAdmin_siteAsk";
			}
		
		//학생정보
		@GetMapping("/studentinfo")
		public String studentinfo(@ModelAttribute("memberChildBean") MemberChildBean memberChildBean , Model model) {
			List<MemberChildBean> memberChildlist = memberService.getMypageMemberChild(loginMemberBean.getM_memberNo());
		 	model.addAttribute("memberChildlist", memberChildlist);
		 	
		 	return "member/studentinfo";
		}
		
}
