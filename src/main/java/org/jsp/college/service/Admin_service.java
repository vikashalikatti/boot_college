package org.jsp.college.service;

import java.util.List;

import org.jsp.college.dao.FacultyDao;
import org.jsp.college.dao.Staff_Dao;
import org.jsp.college.dto.Faculty;
import org.jsp.college.dto.Staff;
import org.jsp.college.helper.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Admin_service {

	@Autowired
	FacultyDao facultyDao;
	@Autowired
	Staff_Dao staff_Dao;

	public ModelAndView login(Login login, HttpSession session) {
	    ModelAndView andView = new ModelAndView();
	    String admin = "admin";
	    if (login.getEmail().equals("admin") && login.getPassword().equals("admin")) {
	        session.setAttribute("admin",admin);
	        andView.setViewName("Admin_Home");
	        andView.addObject("success", "Login Success");
	    } else {
	        andView.setViewName("admin_login");
	        andView.addObject("fail", "Invalid Email or Password");
	    }
	    return andView;
	}

}
