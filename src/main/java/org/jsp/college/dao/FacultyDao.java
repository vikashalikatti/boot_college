package org.jsp.college.dao;

import org.jsp.college.dto.Faculty;
import org.jsp.college.repository.FacultyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyDao {
	@Autowired
	FacultyRepository facultyRepository;

	public void save(Faculty faculty) {
		facultyRepository.save(faculty);
	}

	public Faculty fetch(String email) {
		return facultyRepository.findByEmail(email);
	}

	public Faculty fetch(long mobile) {
		return facultyRepository.findByMobile(mobile);
	}

}
