package org.jsp.college.dao;

import org.jsp.college.dto.Student;
import org.jsp.college.repository.Student_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Student_dao {

	@Autowired
	Student_repository student_repository;

	public void save(Student student) {
		student_repository.save(student);

	}

	
	public Student fetch(long mobile)
	{
		return student_repository.findByMobile(mobile);
	}

	public Object fetch(String email) {
		return student_repository.findByEmail(email);
	}
}
