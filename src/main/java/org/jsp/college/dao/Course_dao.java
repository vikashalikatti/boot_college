package org.jsp.college.dao;

import java.util.List;

import org.jsp.college.dto.Course;
import org.jsp.college.repository.Course_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Course_dao {
	@Autowired
	Course_repository course_repository;

	public void add(Course course) {
		course_repository.save(course);
	}

	public Course fetch(String name) {
		return course_repository.findByName(name);
	}
	
	public List<Course> fetch(){
		return course_repository.findAll();
	}


	public Course update(Course course) {
		// TODO Auto-generated method stub
		return course_repository.save(course);
	}
	
	
}
