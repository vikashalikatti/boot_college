package org.jsp.college.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
@Component
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private long mobile;
	private int age;
	private Date dob;
	private boolean status;
	private String gender;
	private Date doj;
	private String password;
	private double sslc;
	private double puc;
	private String quota;
	private int otp;
	private boolean otpstatus;
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private byte[] picture;

	@ManyToOne
	private Course course;

	@ManyToOne(cascade = CascadeType.MERGE)
	private Stream_dto stream;

}
