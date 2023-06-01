package org.jsp.college.dao;

import java.util.ArrayList;
import java.util.List;

import org.jsp.college.dto.Course;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.dto.Student;
import org.jsp.college.repository.Student_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class Student_dao {

	@Autowired
	Student_repository student_repository;
	@PersistenceContext
	private EntityManager em;

	public void save(Student student) {
		student_repository.save(student);

	}

	public Student fetch(long mobile) {
		return student_repository.findByMobile(mobile);
	}

	public Student fetch(String email) {
		return student_repository.findByEmail(email);
	}

	
}
