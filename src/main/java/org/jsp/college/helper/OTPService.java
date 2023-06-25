package org.jsp.college.helper;

import org.springframework.stereotype.Service;
import org.jsp.college.dto.OtpDto;
import org.jsp.college.dto.Student;

import java.util.HashMap;
import java.util.Map;
import java.time.LocalDateTime;

@Service
public class OTPService {

	// In-memory storage for OTPs
	private Map<String, OtpDto> otpStorage = new HashMap<>();

	public int generateOTP() {
		// generate a 6-digit integer
		int otp = (int) ((Math.random() * 900000) + 100000);
		return otp;
	}

	public OtpDto createAndSaveOTP(String key) {
		int otp = generateOTP();
		LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5);
		OtpDto otpDto = new OtpDto(otp, expiryTime);

		// Save the OTP associated with the provided key (e.g., email or phone number)
		otpStorage.put(key, otpDto);

		return otpDto;
	}

	public void saveOtp(String key, OtpDto otpDto) {
		// Save the provided OTP associated with the provided key (e.g., email or phone
		// number)
		otpStorage.put(key, otpDto);
	}

	public OtpDto getOtp(String key) {
		return otpStorage.get(key);
	}

	public boolean validateOTP(String key, int otp) {
		OtpDto otpDto = otpStorage.get(key);

		if (otpDto == null || otpDto.isExpired()) {
			return false;
		}

		return otpDto.getOtp() == otp;
	}

	public OtpDto createAndSaveOTPFoMobile(String mobileNumber) {
		int otp = generateOTP();
		LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5);
		OtpDto otpDto = new OtpDto(otp, expiryTime);

		// Save the OTP associated with the provided mobile number
		otpStorage.put(mobileNumber, otpDto);

		return otpDto;
	}

	public OtpDto createAndSaveOTP(Student student) {
	    int otp = generateOTP();
	    LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5);
	    OtpDto otpDto = new OtpDto(otp, expiryTime);
	    otpStorage.put(student.getEmail(), otpDto);

	    return otpDto;
	}

}
