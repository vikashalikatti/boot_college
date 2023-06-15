package org.jsp.college.controller;

import java.io.IOException;

import org.jsp.college.dto.Staff;
import org.jsp.college.helper.Login;
import org.jsp.college.service.Staff_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Staff")
public class Staff_controller {
	@Autowired
	Staff_Service StaffService;

	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Staff Staff, @RequestParam String date,
			@RequestParam MultipartFile photo) throws IOException {
		return StaffService.signup(Staff, date, photo);
	}

	@PostMapping("login")
	public ModelAndView login(@ModelAttribute Login login, HttpSession session) {
		return StaffService.login(login, session);
	}

	@GetMapping("fetchall")
	public ModelAndView fetchAll() {
		return StaffService.fetchAll();
	}

	@PostMapping("change/{id}")
	public ModelAndView changeStatus(@PathVariable int id) {
		return StaffService.changeStatus(id);
	}
}