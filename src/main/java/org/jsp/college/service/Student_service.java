package org.jsp.college.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import org.jsp.college.dao.Student_dao;
import org.jsp.college.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class Student_service {
	@Autowired
	Student_dao dao;

	public ModelAndView signup(Student student, String date) {
		ModelAndView view = new ModelAndView();
		if(dao.fetch(student.getEmail())==null && dao.fetch(student.getMobile())==null )
		{	
		Date dob = Date.valueOf(date);
		student.setDob(dob);
		int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		student.setAge(age);

		dao.save(student);
		view.setViewName("home");
		view.addObject("success", "Student Account created Success");
		}
		else {
			view.setViewName("student_signup");
			view.addObject("fail", "Email or Phone already Exists");
		}
		return view;

	}

}
