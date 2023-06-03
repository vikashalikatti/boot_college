package org.jsp.college.service;

import java.util.ArrayList;
import java.util.List;

import org.jsp.college.dao.Course_dao;
import org.jsp.college.dto.Course;
import org.jsp.college.dto.Stream_dto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class Course_service {

	@Autowired
	Course_dao course_dao;

	public ModelAndView add_course(Course course) {

		ModelAndView andView = new ModelAndView("home");
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
		List<Course> list = course_dao.fetch();
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
			List<Course> list = course_dao.fetch();
			andView.addObject("list", list);
			andView.addObject("fail",
					"Stream " + stream_dto.getName() + " already exists in the course " + coursename + "");
			andView.setViewName("Add_stream");
		}
		return andView;
	}

	public ModelAndView update_fee_course() {
		ModelAndView andView = new ModelAndView("update_fee_course");
        List<Course> courses = course_dao.fetch();
        andView.addObject("courses", courses);
        return andView;
	}	
}
