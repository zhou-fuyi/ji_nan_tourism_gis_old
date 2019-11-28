package com.tourism.gis.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.tourism.gis.util.bean.EmailInfo;
import com.tourism.gis.util.bean.MailSenderInfo;

public class MailUtil {

	public static void sendWithWangyi(EmailInfo info) {

		String host = info.getHost(); // 邮件主机
		String username = info.getUsername(); // 用户名
		String password = info.getPassword(); // 密码
		String from = info.getFrom();
		String to = info.getTo();
		String subject = info.getSubject();
		/**
		 * MessageFormat.format("12{0}","56{1}","3","7"); 执行结果 "123,567"
		 */
		String content = MessageFormat.format(info.getContent(), info.getActivationCode());

		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost(host);
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUserName(username);
		mailInfo.setPassword(password);
		mailInfo.setFromAddress(from);
		mailInfo.setToAddress(to);
		mailInfo.setSubject(subject);
		mailInfo.setContent(content);

		SimpleMailSender sms = new SimpleMailSender();
		sms.sendTextMail(mailInfo);

	}

	/**
	 * 使用QQ邮件服务器发送邮件
	 * 
	 * @param info
	 */
	public static void sendWithQQ(EmailInfo info) {
		// 获取收件地址
		String to = info.getTo();

		// 获取发件地址
		String from = info.getFrom();

		// 邮件服务器 smtp.qq.com
		String host = info.getHost();

		// 获取系统属性

		Properties properties = System.getProperties();

		// 设置发送邮件的主机
		properties.setProperty("mail.smtp.host", host);

		// 这里开始报错了
		// Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.setProperty("mail.smtp.auth", "true");

		// 新建会话
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(info.getUsername(), info.getPassword()); // �������ʼ��û���������
			}
		});

		try {
			// 创建邮件体
			MimeMessage message = new MimeMessage(session);

			// Set From:
			message.setFrom(new InternetAddress(from));

			// Set To:
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject:
			message.setSubject(info.getSubject());

			//
			message.setText(MessageFormat.format("邢先生，您好，检测到您的账号存在盗号风险，请尽快修改密码！{0}", info.getActivationCode()));

			// 开始发送
			Transport.send(message);
			System.out.println("QQ发送");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		MailUtil util = new MailUtil();
		Properties prop = new Properties();
		InputStream stream = util.getClass().getClassLoader().getResourceAsStream("email.properties");
		try {
			prop.load(stream);
			EmailInfo info = new EmailInfo();
			info.setActivationCode("456132");
			info.setContent(prop.getProperty("content"));
			info.setFrom(prop.getProperty("from"));
			info.setHost(prop.getProperty("host"));
			info.setPassword(prop.getProperty("password"));
			info.setSubject(prop.getProperty("subject"));
			info.setTo("631436797@qq.com");
			info.setUsername(prop.getProperty("username"));
			MailUtil.sendWithWangyi(info);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
