package org.jsp.college.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import org.jsp.college.dao.Staff_Dao;
import org.jsp.college.dto.Staff;
import org.jsp.college.helper.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Staff_Service {
	@Autowired
	Staff_Dao StaffDao;

	public ModelAndView signup(Staff Staff, String date) {
		ModelAndView view = new ModelAndView();
		if (StaffDao.fetch(Staff.getEmail()) == null && StaffDao.fetch(Staff.getMobile()) == null) {
			Date dob = Date.valueOf(date);
			Staff.setDob(dob);
			int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
			Staff.setAge(age);

			StaffDao.save(Staff);
			view.setViewName("home");
			view.addObject("success", "Staff Account created Success");
		} else {
			view.setViewName("StaffSignup");
			view.addObject("fail", "Email or Phone already Exists");
		}
		return view;
	}

	public ModelAndView login(Login login, HttpSession session) {
		ModelAndView view = new ModelAndView();
		Staff Staff = StaffDao.fetch(login.getEmail());
		if (Staff == null) {
			view.setViewName("StaffLogin");
			view.addObject("fail", "Email Wrong");
		} else {
			if (login.getPassword().equals(Staff.getPassword())) {
				session.setAttribute("Staff", "Staff");
				view.setViewName("StaffHome");
				view.addObject("success", "Login Success");
			} else {
				view.setViewName("StaffLogin");
				view.addObject("fail", "Password Wrong");
			}
		}

		return view;
	}

}
