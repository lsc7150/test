package kr.co.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/about")
@Controller
public class aboutController {

	@GetMapping("/about")
	public String index() {
		return "about";
	}
	
}
