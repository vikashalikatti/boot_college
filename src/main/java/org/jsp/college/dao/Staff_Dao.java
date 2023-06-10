package org.jsp.college.dao;

import java.util.List;
import java.util.Optional;

import org.jsp.college.dto.Staff;
import org.jsp.college.repository.Staff_Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Staff_Dao {
	@Autowired
	Staff_Repository StaffRepository;

	public void save(Staff Staff) {
		StaffRepository.save(Staff);
	}

	public Staff fetch(String email) {
		return StaffRepository.findByEmail(email);
	}

	public Staff fetch(long mobile) {
		return StaffRepository.findByMobile(mobile);
	}

	public List<Staff> findall() {
		return StaffRepository.findAll();
	}

	public Staff fetchById(int id) {
		Optional<Staff> op = StaffRepository.findById(id);
		if (op.isEmpty())
			return null;
		else
			return op.get();
	}
}
