package org.jsp.college.dao;

import java.util.List;
import java.util.Optional;

import org.jsp.college.dto.Course;
import org.jsp.college.dto.Stream_dto;
import org.jsp.college.repository.Stream_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Stream_dao {
	@Autowired
	Stream_repository Stream_repository;

	public List<Stream_dto> fetchall() {
		return Stream_repository.findAll();
	}

	public Stream_dto fetchById(int id) {
		Optional<Stream_dto> op = Stream_repository.findById(id);
		if (op.isEmpty())
			return null;
		else
			return op.get();
	}

	public void save(Stream_dto stream) {
		Stream_repository.save(stream);
	}
}
