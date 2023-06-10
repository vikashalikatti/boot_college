package org.jsp.college.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class Main_Controller {
	@GetMapping("/")
	public ModelAndView home_page() {
		ModelAndView andView = new ModelAndView("home");
		return andView;
	}

	@GetMapping("logout")
	public ModelAndView logout(HttpSession session,ModelAndView andView) {
		session.invalidate();
		andView.addObject("success", "You have successfully logged out.");
		andView.setViewName("home");
		return andView;
	}
}
