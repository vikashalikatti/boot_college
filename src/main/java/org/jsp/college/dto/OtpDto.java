package org.jsp.college.dto;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class OtpDto {

	@Id
	private int otp;
	private LocalDateTime expiryTime;

	// Removed Autowired annotation here
	public OtpDto(int otp, LocalDateTime expiryTime) {
		this.otp = otp;
		this.expiryTime = expiryTime;
	}

	public int getOtp() {
		return otp;
	}

	public void setOtp(int otp) {
		this.otp = otp;
	}

	public LocalDateTime getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(LocalDateTime expiryTime) {
		this.expiryTime = expiryTime;
	}

	public boolean isExpired() {
		return LocalDateTime.now().isAfter(this.expiryTime);
	}
}
