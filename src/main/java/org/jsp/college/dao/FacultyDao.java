package org.jsp.college.dao;

import java.util.List;
import java.util.Optional;

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

	public List<Faculty> ftech() {
		return facultyRepository.findAll();
	}

	public List<Faculty> findall() {
		return facultyRepository.findAll();
	}

	public Faculty fetchById(int id) {
		Optional<Faculty> op = facultyRepository.findById(id);
		if (op.isEmpty())
			return null;
		else
			return op.get();
	}

}
