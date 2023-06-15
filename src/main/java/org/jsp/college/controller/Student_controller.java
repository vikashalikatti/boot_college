package org.jsp.college.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView signup(@ModelAttribute Student student, @RequestParam String date,
			@RequestParam MultipartFile photo) throws IOException {
		return student_service.signup(student, date,photo);
	}

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return student_service.login(login, session);
	}

	@GetMapping("course")
	public ModelAndView fetchStaff() {
		return student_service.fetchCourse();
	}


	@PostMapping("enroll")
	public ModelAndView enroll(@RequestParam String course, @RequestParam String stream, HttpSession session) {
		return student_service.enroll(course, stream, session);
	}

	@GetMapping("accept")
	public ModelAndView accept(HttpSession session) {
		return student_service.accept(session);
	}

	@GetMapping("reject")
	public ModelAndView reject(HttpSession session) {
		return student_service.reject(session);
	}

	@GetMapping("approve/{id}")
	public ModelAndView approve(@PathVariable int id) {
		return student_service.approveStudent(id);
	}
}
