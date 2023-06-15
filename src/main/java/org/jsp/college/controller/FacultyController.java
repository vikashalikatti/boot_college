package org.jsp.college.controller;

import java.io.IOException;

import org.jsp.college.dto.Faculty;
import org.jsp.college.helper.Login;
import org.jsp.college.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("faculty")
public class FacultyController {
	@Autowired
	FacultyService facultyService;

	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Faculty faculty, @RequestParam String date,
			@RequestParam MultipartFile photo) throws IOException {
		return facultyService.signup(faculty, date, photo);
	}

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return facultyService.login(login, session);
	}
	@GetMapping("fetchall")
	public ModelAndView fetchAll()
	{
		return facultyService.fetchAll();
	}
	
	@PostMapping("change/{id}")
	public ModelAndView changeStatus(@PathVariable int id) {
		return facultyService.changeStatus(id);
	}
	
}