package kr.co.ezen.controller;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ezen.beans.MemberBean;


@Controller
public class MainController {
	
	@Autowired
	@Lazy
	private MemberBean loginMemberBean;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean, Model model) {
		model.addAttribute("loginMemberBean", loginMemberBean);
		return "index";
	}
	
}
