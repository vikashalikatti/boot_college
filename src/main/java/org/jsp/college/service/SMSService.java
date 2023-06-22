package org.jsp.college.service;

//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Service;
//
//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.account.Message;
//import com.twilio.type.PhoneNumber;
//
//@Service
//public class SMSService {

//	@Value("${twilio.account.sid}")
//	private String accountSid;
//
//	@Value("${twilio.auth.token}")
//	private String authToken;
//
//	@Value("${twilio.from.phone.number}")
//	private String fromPhoneNumber;
//
//	public void sendSMS(String toPhoneNumber, String messageText) {
//		Twilio.init(accountSid, authToken);
//
//		Message message = Message.creator(new PhoneNumber(toPhoneNumber), // to
//				new PhoneNumber(fromPhoneNumber), // from
//				messageText).create();
//
//		System.out.println(message.getSid());
//	}
//}
