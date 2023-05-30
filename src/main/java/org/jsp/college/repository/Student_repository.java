package org.jsp.college.repository;

import org.jsp.college.dto.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Student_repository extends JpaRepository<Student, Integer>{

	Student findByEmail(String email);

	Student findByMobile(long mobile);

}
