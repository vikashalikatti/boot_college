package org.jsp.college.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jsp.college.dto.Course;
import org.jsp.college.dto.Faculty;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.repository.Course_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;

@Repository
public class Course_dao {
	@Autowired
	Course_repository course_repository;

	@Autowired
	private EntityManager em;

	public void add(Course course) {
		course_repository.save(course);
	}

	public Course fetch(String name) {
		return course_repository.findByName(name);
	}

	public List<Course> fetchall() {
		return course_repository.findAll();
	}

	public Course update(Course course) {

		return course_repository.save(course);
	}

	public List<Stream_dto> fetchstreambycourse(int courseId) {
		Course course = em.find(Course.class, courseId);
		if (course != null) {
			return course.getStream();
		} else {
			return new ArrayList<>();
		}
	}

	public Course fetchById(int id) {
		Optional<Course> op = course_repository.findById(id);
		if (op.isEmpty())
			return null;
		else
			return op.get();
	}

}
