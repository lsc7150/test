package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.service.BlackListService;

@Controller
@RequestMapping("/blackList")
public class BlackListController {
	
	@SuppressWarnings("unused")
	@Autowired
	private BlackListService blackListService;

	@Autowired
	private MemberBean loginMemberBean;

	
	@GetMapping("/blackListList") 
		public String main(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
						   @RequestParam(value = "page", defaultValue = "1") int page,
						   Model model) {

		List<BlackListBean> bllist = blackListService.getBlList(page);
		model.addAttribute("bllist", bllist); 
			
		PageCountBean pageCountBean = blackListService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
		
		return "blackList/blackListList";
	}
	
	
	//검색 화면
	@GetMapping("/blackSearchList")
	public String blSearchList(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
								@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam("searchKeyword") String searchKeyword,
								Model model) {
		
		List<BlackListBean> blsearchList = blackListService.getBLSearchList(searchKeyword, page);
		model.addAttribute("blsearchList", blsearchList);
		
		PageCountBean pageCountBean = blackListService.getContentCnt2(searchKeyword, page);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page", page);
		
		return "blackList/blackSearchList";
	}
	
	//검색
	@GetMapping("/blackSearchList_pro")
	public String blSearchList_pro(@ModelAttribute("blSearchBean") BlackListBean blSearchBean,
			 					@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam("searchKeyword") String searchKeyword,
								Model model) {
	
		List<BlackListBean> blsearchList = blackListService.getBLSearchList(searchKeyword, page);
		blSearchBean.setSearchKeyword(blSearchBean.getSearchKeyword());
		blSearchBean.getM_name();
				
		model.addAttribute("blsearchList", blsearchList);
		model.addAttribute("blSearchBean", blSearchBean);
		
		PageCountBean pageCountBean = blackListService.getContentCnt2(searchKeyword, page);
		model.addAttribute("pageCountBean2", pageCountBean);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page", page);
		
		return "blackList/blackSearchList";
	}	
	
	@GetMapping("/blackListWrite")
	public String write(@ModelAttribute("blWriteBean") BlackListBean blWriteBean

	) {

		return "blackList/blackListWrite";
	}

	@PostMapping("blackListWrite_pro")
	public String write_pro(@ModelAttribute("blWriteBean") BlackListBean blWriteBean, BindingResult result) {

		if (result.hasErrors()) {
			return "blackList/blackListWrite";
		}
		
		blackListService.addBlContent(blWriteBean);
	
		return "blackList/blackListWrite_success";
	}

	@GetMapping("/blackListWrite_fail")
	public String noticeBoardWrite_fail() {
		return "blackList/blackListWrite_fail";
	}

	
	// 삭제
	@GetMapping("/blackListDelete")
	public String delete(@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
			Model model) {
		blackListService.delBlInfo(m_memberNo, a_memberNo);

		model.addAttribute("m_memberNo", m_memberNo);
		model.addAttribute("a_memberNo", a_memberNo);

		return "blackList/blackListDelete";
	}

}
