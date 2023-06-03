package org.jsp.college.controller;

import java.util.List;

import org.jsp.college.dao.Course_dao;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.dto.Student;
import org.jsp.college.helper.Login;
import org.jsp.college.service.Student_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("student")
public class Student_controller {

	@Autowired
	Student_service student_service;
	@Autowired
	Course_dao course_service;

	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Student student, @RequestParam String date) {
		return student_service.signup(student, date);
	}

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return student_service.login(login, session);
	}

	@GetMapping("course")
	public ModelAndView fetchStaff() {
		return student_service.fetchCourse();
	}

	@GetMapping("/getStreams/{courseId}")
	@ResponseBody
	public List<Stream_dto> fetchstreambycourse(@PathVariable int courseId) {
		return student_service.fetchstreambycourse(courseId);
	}
}
