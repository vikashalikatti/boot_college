package org.jsp.college.repository;

import org.jsp.college.dto.Course;
import org.springframework.data.jpa.repository.JpaRepository;


public interface Course_repository extends JpaRepository<Course, Integer>{

	Course findByName(String name);

}
