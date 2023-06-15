package org.jsp.college.helper;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import org.jsp.college.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class SendMail {

	@Autowired
	JavaMailSender javaMailSender;
	@Autowired
	Configuration configuration;

	public void send(Student student) {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setFrom("gangsteryt222@gmail.com");
			helper.setTo(student.getEmail());
			helper.setText(getEmailContent(student),true);

			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	public String getEmailContent(Student student) {
		StringWriter writer = new StringWriter();
		Map<String, Object> model = new HashMap();
		model.put("merchant", student);
		try {
			configuration.getTemplate("Email.ftl").process(model, writer);
		} catch (TemplateException | IOException e) {
			e.printStackTrace();
		}
		return writer.getBuffer().toString();
	}

}
