package org.jsp.college.service;

import org.jsp.college.helper.Login;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Admin_service {

	public ModelAndView login(Login login, HttpSession session) {
		ModelAndView andView = new ModelAndView();
		if (login.getEmail().equals("admin")) {
			if (login.getPassword().equals("admin")) {
				session.setAttribute("admin", "admin");
				andView.setViewName("home");
				andView.addObject("success", "Login Sucess");
			} else {
				andView.setViewName("admin_login");

				andView.addObject("fail", "password wrong");
			}
		} else {
			andView.setViewName("admin_login");

			andView.addObject("fail", "Email worng");
		}
		return andView;
	}

}
