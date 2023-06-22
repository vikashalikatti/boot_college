package org.jsp.college.repository;

import java.util.List;

import org.jsp.college.dto.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface Student_repository extends JpaRepository<Student, Integer> {

	Student findByEmail(String email);

	Student findByMobile(long mobile);

	@Query("select x from Student x where status=true and doj=null and otpstatus=true")
	List<Student> fetchAllApprovedStudents();

}
