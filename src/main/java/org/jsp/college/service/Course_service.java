package org.jsp.college.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jsp.college.dao.Course_dao;
import org.jsp.college.dao.Staff_Dao;
import org.jsp.college.dao.Stream_dao;
import org.jsp.college.dto.Course;
import org.jsp.college.dto.Staff;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.repository.Stream_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Service
public class Course_service {

	@Autowired
	Course_dao course_dao;

	@Autowired
	Staff_Dao staff_Dao;

	@Autowired
	Stream_dao stream_dao;

	@Autowired
	Stream_repository stream_repository;

	public ModelAndView add_course(Course course) {

		ModelAndView andView = new ModelAndView("Admin_Home");
		Course course2 = course_dao.fetch(course.getName());
		if (course2 == null) {
			course_dao.add(course);
			andView.addObject("success", "Course Added Sucessfully");
		} else {
			andView.addObject("fail", " " + course.getName() + " " + "Course Already Available");
		}
		return andView;

	}

	public ModelAndView check_course() {
		ModelAndView view = new ModelAndView();
		List<Course> list = course_dao.fetchall();
		if (list.isEmpty()) {
			view.setViewName("home");
			view.addObject("fail", "Add Course");
		} else {
			view.setViewName("Add_stream");
			view.addObject("list", list);
		}
		return view;
	}

	public ModelAndView save_stream(Stream_dto stream_dto, String coursename) {

		ModelAndView andView = new ModelAndView();
		stream_dto.setNseat(stream_dto.getSeat() - ((stream_dto.getSeat() * 30) / 100));
		stream_dto.setMseat(stream_dto.getSeat() - stream_dto.getNseat());
		Course course = course_dao.fetch(coursename);
		List<Stream_dto> streams = course.getStream();
		if (streams == null) {
			streams = new ArrayList<Stream_dto>();
		}
		boolean flag = true;
		for (Stream_dto s : streams) {
			if (s.getName().equalsIgnoreCase(stream_dto.getName())) {
				flag = false;
			}
		}
		if (flag) {
			streams.add(stream_dto);
			course.setStream(streams);
			course_dao.add(course);
			andView.setViewName("home");
			andView.addObject("success", "Stream Added Success");
		} else {
			List<Course> list = course_dao.fetchall();
			andView.addObject("list", list);
			andView.addObject("fail",
					"Stream " + stream_dto.getName() + " already exists in the course " + coursename + "");
			andView.setViewName("Add_stream");
		}
		return andView;
	}


	public ModelAndView update_course(@PathVariable int id, @RequestParam double fee) {
		ModelAndView view = new ModelAndView();
		Course course = course_dao.fetchById(id);
		if (course != null) {
			course.setFee(fee);
			course_dao.add(course);
			view.addObject("success", "Course Fee updated successfully!");
		} else {
			view.addObject("fail", "Failed to update fee. Course not found.");
		}
		view.setViewName("Admin_Home");
		return view;
	}

	public ModelAndView fetchAll_stream(HttpSession session) {
		ModelAndView view = new ModelAndView();
		List<Stream_dto> streamlist = stream_dao.fetchall();
		List<Course> courselist = course_dao.fetchall();
		if (streamlist.isEmpty()) {
			view.addObject("fail", "No Stream fee to update");
			view.setViewName("Admin_Home");
		} else {
			session.setAttribute("streamlist", streamlist);
			session.setAttribute("courselist", courselist);
			view.setViewName("update_fee_stream");
		}
		return view;
	}

	public ModelAndView update_stream(int id, double fee,HttpSession session) {
		ModelAndView view = new ModelAndView();
		List<Course> list = course_dao.fetchall();
		Stream_dto stream = stream_dao.fetchById(id);
		if (stream != null) {
			stream.setFee(fee);
			session.setAttribute("list", list);
			stream_dao.save(stream);
			view.addObject("success", "Stream Fee updated successfully!");
		} else {
			view.addObject("fail", "Failed to update fee. Course not found.");
		}
		view.setViewName("update_fee_course");
		return view;
	}

}
