package org.jsp.college.repository;

import org.jsp.college.dto.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Staff_Repository extends JpaRepository<Staff, Integer>{

	Staff findByEmail(String email);

	Staff findByMobile(long mobile);

}
