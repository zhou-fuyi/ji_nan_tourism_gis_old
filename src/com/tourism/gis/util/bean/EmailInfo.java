package com.tourism.gis.util.bean;

/**
 * 邮件信息类
 * 
 * @author Administrator
 *
 */
public class EmailInfo {

	private String subject; // 邮件主题
	private String content; // 邮件内容
	private String from; // 邮件发送人
	private String host; // 指定发送邮件的主机
	private String username; // 用户名
	private String password; // 密码
	private String to; // 邮件收件人ַ
	private String activationCode; // 验证码

	public EmailInfo() {
		// TODO Auto-generated constructor stub
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	@Override
	public String toString() {
		return "EmailInfo [subject=" + subject + ", content=" + content + ", from=" + from + ", host=" + host
				+ ", username=" + username + ", password=" + password + ", to=" + to + ", activationCode="
				+ activationCode + "]";
	}

}
