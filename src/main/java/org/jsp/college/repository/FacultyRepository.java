package org.jsp.college.repository;

import org.jsp.college.dto.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacultyRepository extends JpaRepository<Faculty, Integer> {

	Faculty findByEmail(String email);

	Faculty findByMobile(long mobile);

}