package org.jsp.college.controller;

import org.jsp.college.dto.Student;
import org.jsp.college.service.Student_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("student")
public class Student_controller {

	@Autowired
	Student_service student_service;

	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Student student,@RequestParam String date)
	{
		return student_service.signup(student,date);
	}
}
