package org.jsp.college.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jsp.college.dao.Course_dao;
import org.jsp.college.dao.Student_dao;
import org.jsp.college.dto.Course;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.dto.Student;
import org.jsp.college.helper.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Student_service {
	@Autowired
	Student_dao student_dao;
	@Autowired
	Course_dao courseDao;


	public ModelAndView signup(Student student, String date) {
		ModelAndView view = new ModelAndView();
		if (student_dao.fetch(student.getEmail()) == null && student_dao.fetch(student.getMobile()) == null) {
			Date dob = Date.valueOf(date);
			student.setDob(dob);
			int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
			student.setAge(age);

			student_dao.save(student);
			view.setViewName("home");
			view.addObject("success", "Student Account created Success");
		} else {
			view.setViewName("student_signup");
			view.addObject("fail", "Email or Phone already Exists");
		}
		return view;

	}

	public ModelAndView login(Login login, HttpSession session) {
		ModelAndView view = new ModelAndView();
		Student student = student_dao.fetch(login.getEmail());
		if (student == null) {
			view.setViewName("StudentLogin");
			view.addObject("fail", "Email Wrong");
		} else {
			if (login.getPassword().equals(student.getPassword())) {
				session.setAttribute("student", "student");
				view.setViewName("StudentHome");
				view.addObject("success", "Login Success");
			} else {
				view.setViewName("StudentLogin");
				view.addObject("fail", "Password Wrong");
			}
		}

		return view;
	}

	public ModelAndView fetchCourse() {
		ModelAndView view = new ModelAndView();

		List<Course> list = courseDao.fetch();
		if (list.isEmpty()) {
			view.setViewName("StudentHome");
			view.addObject("fail", "No Courses to Opt");
		} else {
			view.setViewName("/EnrollCourse");
			view.addObject("list", list);
		}
		return view;

	}

	public List<Stream_dto> fetchstreambycourse(int courseId) {
		Optional<Course> course = courseDao.findById(courseId);
		return course.isPresent() ? course.get().getStream() : new ArrayList<>();
	}
}
