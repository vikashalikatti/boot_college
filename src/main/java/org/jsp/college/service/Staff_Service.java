package org.jsp.college.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.jsp.college.dao.Staff_Dao;
import org.jsp.college.dto.Staff;
import org.jsp.college.helper.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Staff_Service {
	@Autowired
	Staff_Dao StaffDao;

	public ModelAndView signup(Staff staff, String date, MultipartFile pic) throws IOException {
		ModelAndView view = new ModelAndView();
		if (StaffDao.fetch(staff.getEmail()) == null && StaffDao.fetch(staff.getMobile()) == null) {
			Date dob = Date.valueOf(date);
			staff.setDob(dob);
			int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
			staff.setAge(age);
			byte[] picture = null;
			if (pic != null) {
				InputStream inputStream = pic.getInputStream();
				picture = new byte[inputStream.available()];
				inputStream.read(picture);
			}
			staff.setPicture(picture);

			StaffDao.save(staff);
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
		Staff staff = StaffDao.fetch(login.getEmail());
		if (staff == null) {
			view.setViewName("StaffLogin");
			view.addObject("fail", "Email Wrong");
		} else {
			if (login.getPassword().equals(staff.getPassword())) {
				if (staff.isStatus()) {
					session.setAttribute("staff", staff);
					view.setViewName("StaffHome");
					view.addObject("success", "Login Success");
				} else {
					view.setViewName("StaffLogin");
					view.addObject("fail", "Wait for Admins Approval");
				}
			} else {
				view.setViewName("StaffLogin");
				view.addObject("fail", "Password Wrong");
			}
		}

		return view;
	}

	public ModelAndView fetchAll() {
		ModelAndView view = new ModelAndView();
		List<Staff> list = StaffDao.findall();
		if (list.isEmpty()) {
			view.addObject("fail", "No Staff Registered Yet");
			view.setViewName("Admin_Home");
		} else {
			view.addObject("list", list);
			view.setViewName("staff_approve");
		}
		return view;
	}

	public ModelAndView changeStatus(int id) {
		ModelAndView view = new ModelAndView();

		Staff staff = StaffDao.fetchById(id);
		if (staff.isStatus())
			staff.setStatus(false);
		else
			staff.setStatus(true);
		StaffDao.save(staff);
		view.addObject("list", StaffDao.findall());
		view.setViewName("staff_approve");
		return view;
	}

}
