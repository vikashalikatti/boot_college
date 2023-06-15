package org.jsp.college.service;

import java.io.IOException;
import java.io.InputStream;
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
import org.jsp.college.helper.SendMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Student_service {
	@Autowired
	Student_dao student_dao;
	@Autowired
	Course_dao courseDao;
	@Autowired
	SendMail mail;

	public ModelAndView signup(Student student, String date, MultipartFile pic) throws IOException {
		ModelAndView view = new ModelAndView();
		if (student_dao.fetch(student.getEmail()) == null && student_dao.fetch(student.getMobile()) == null) {
			Date dob = Date.valueOf(date);
			student.setDob(dob);
			int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
			student.setAge(age);

			byte[] picture = null;
			if (pic != null) {
				InputStream inputStream = pic.getInputStream();
				picture = new byte[inputStream.available()];
				inputStream.read(picture);
			}
			student.setPicture(picture);
			student_dao.save(student);
			view.setViewName("home");
			view.addObject("success", "Student Account created Success");
		} else {
			view.setViewName("StudentSignup");
			view.addObject("fail", "Email or Phone already Exists");
		}
		return view;
	}

	public ModelAndView login(Login login, HttpSession session) {
		ModelAndView view = new ModelAndView();
		Student student = student_dao.fetch(login.getEmail());
		if (student == null) {
			view.setViewName("studentlogin");
			view.addObject("fail", "Email Wrong");
		} else {
			if (login.getPassword().equals(student.getPassword())) {
				session.setAttribute("student", student);
				mail.send(student);
				view.setViewName("StudentHome");
				view.addObject("success", "Login Success");
			} else {
				view.setViewName("studentlogin");
				view.addObject("fail", "Password Wrong");
			}
		}

		return view;
	}

	public ModelAndView fetchCourse() {
		ModelAndView view = new ModelAndView();

		List<Course> list = courseDao.fetchall();
		if (list.isEmpty()) {
			view.setViewName("StudentHome");
			view.addObject("fail", "No Courses to Opt");
		} else {
			view.setViewName("/EnrollCourse");
			view.addObject("list", list);
		}
		return view;

	}

	public ModelAndView enroll(String course, String stream, HttpSession session) {
		ModelAndView view = new ModelAndView();

		Student student = (Student) session.getAttribute("student");
		Stream_dto stream1 = null;
		Course course1 = courseDao.fetch(course);
		for (Stream_dto stream2 : course1.getStream()) {
			if (stream2.getName().equals(stream))
				stream1 = stream2;
		}
		if (student.getSslc() > 80 && student.getPuc() > 80) {
			if (stream1.getNseat() > 0) {
				view.addObject("name", student.getName());
				view.addObject("course", course);
				view.addObject("stream", stream);
				view.addObject("quota", "Normal");
				view.addObject("fee", course1.getFee() + stream1.getFee());
				view.setViewName("StudentAdmission");
				student.setQuota("Normal");
				student.setCourse(course1);
				student.setStream(stream1);
				Student student1 = student_dao.save(student);
				session.setAttribute("student", student1);
			} else if (stream1.getMseat() > 0) {
				view.addObject("name", student.getName());
				view.addObject("course", course);
				view.addObject("stream", stream);
				view.addObject("quota", "Management");
				view.addObject("fee", (course1.getFee() + stream1.getFee()) * 2);
				view.setViewName("StudentAdmission");
				student.setQuota("Management");
				student.setCourse(course1);
				student.setStream(stream1);
				Student student1 = student_dao.save(student);
				session.setAttribute("student", student1);
			} else {
				view.setViewName("StudentHome");
				view.addObject("fail",
						"Hello " + student.getName() + " Sorry Seats are Not Availbale in " + course + " " + stream);
			}
		} else {
			if (stream1.getMseat() > 0) {
				view.addObject("name", student.getName());
				view.addObject("course", course);
				view.addObject("stream", stream);
				view.addObject("quota", "Management");
				view.addObject("fee", (course1.getFee() + stream1.getFee()) * 2);
				view.setViewName("StudentAdmission");
				student.setCourse(course1);
				student.setQuota("Management");
				student.setStream(stream1);
				Student student1 = student_dao.save(student);
				session.setAttribute("student", student1);
			} else {
				view.setViewName("StudentHome");
				view.addObject("fail",
						"Hello " + student.getName() + " Sorry Seats are Not Availbale in " + course + " " + stream);
			}
		}
		return view;
	}

	public ModelAndView accept(HttpSession session) {
		ModelAndView view = new ModelAndView("StudentHome");
		Student student = (Student) session.getAttribute("student");
		student.setStatus(true);
		Stream_dto stream = student.getStream();
		if (student.getQuota().equals("Normal")) {
			stream.setNseat(stream.getNseat() - 1);
		} else {
			stream.setMseat(stream.getMseat() - 1);
		}
		student.setStream(stream);
		student_dao.save(student);
		view.addObject("success", "Successfully Enrolled Pay fee and Wait for confirmation");
		return view;
	}

	public ModelAndView reject(HttpSession session) {
		ModelAndView view = new ModelAndView("StudentHome");
		Student student = (Student) session.getAttribute("student");
		student.setCourse(null);
		student.setStream(null);
		student.setQuota(null);
		view.addObject("fail", "Successfully Rejected");
		return view;
	}

	public ModelAndView fetchAllAcceptedStudent() {
		ModelAndView view = new ModelAndView();
		List<Student> list = student_dao.fetchAllApprovedStudents();
		if (list.isEmpty()) {
			view.setViewName("Admin__Home");
			view.addObject("fail", "Currently no student have enrolled");
		} else {
			view.setViewName("ApproveStudent");
			view.addObject("students", list);
		}

		return view;
	}

	public ModelAndView approveStudent(int id) {
		ModelAndView view = new ModelAndView("home");
		view.addObject("success", "Approved Success");
		Student student = student_dao.fetch(id);
		student.setDoj(Date.valueOf(LocalDate.now()));
		student_dao.save(student);
		return view;
	}
}
