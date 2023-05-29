package org.jsp.college.controller;

import org.jsp.college.dto.Course;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.helper.Login;
import org.jsp.college.service.Admin_service;
import org.jsp.college.service.Course_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class Admin_controller {
	@Autowired
	Admin_service admin_service;
	@Autowired
	Course_service course_service;

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return admin_service.login(login, session);
	}

	@PostMapping("course")
	public ModelAndView add_course(@ModelAttribute Course course) {
		return course_service.add_course(course);
	}
	
	@GetMapping("stream")
	public ModelAndView checkStream() {
		return course_service.check_course();
	}
	
	@PostMapping("stream")
	public ModelAndView savestream(@ModelAttribute Stream_dto stream_dto,@RequestParam String coursename) {
		return course_service.save_stream(stream_dto, coursename);
		
	}
	@GetMapping("update")
	public ModelAndView update_fee_course()
	{
		return course_service.update_fee_course();
	}
	
	
}
