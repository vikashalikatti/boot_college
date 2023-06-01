package org.jsp.college.controller;

import org.jsp.college.dto.Staff;
import org.jsp.college.helper.Login;
import org.jsp.college.service.Staff_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Staff")
public class Staff_controller {
	@Autowired
	Staff_Service StaffService;

	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Staff Staff, @RequestParam String date) {
		return StaffService.signup(Staff, date);
	}

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return StaffService.login(login, session);
	}
}