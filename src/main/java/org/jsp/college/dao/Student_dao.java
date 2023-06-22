package org.jsp.college.dao;

import java.util.List;
import java.util.Optional;

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

	public Student save(Student student) {
		return student_repository.save(student);

	}

	public Student fetch(long mobile) {
		return student_repository.findByMobile(mobile);
	}

	public Student fetch(String email) {
		return student_repository.findByEmail(email);
	}

	public List<Student> fetchAllApprovedStudents() {
		return student_repository.fetchAllApprovedStudents();
	}
	
	public List<Student> fetchall(){
		return student_repository.findAll();
	}
	public Student fetch(int id) {
		Optional<Student> optional = student_repository.findById(id);
		if (optional.isPresent())
			return optional.get();
		else {
			return null;
		}
	}

}
