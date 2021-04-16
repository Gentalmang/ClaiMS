package com.bootdo.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class SendMsg {
    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String from;

    public void sendMessage(String subject,String message,String sendEmail) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
            helper.setFrom(from);//发送者邮件邮箱
            helper.setTo(sendEmail);//收邮件者邮箱
            helper.setSubject(subject);//发件主题
            helper.setText(message);//发件内容
            mailSender.send(helper.getMimeMessage());//发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
