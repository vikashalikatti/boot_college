package org.jsp.college.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;

@Entity
@Data
@Component

public class Stream_dto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private  int id;
	private String name;
	private double fee;
	private int seat;
	private int mseat;
	private int nseat;
	
	@OneToMany
	private List<Student> students;

}
