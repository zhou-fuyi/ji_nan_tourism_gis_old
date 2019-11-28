package com.tourism.gis.bean;

import java.sql.Timestamp;

/**
 * 文章类
 * 
 * @author Administrator
 *
 */
public class Article {

	private String id; // 主键
	private String title; // 文章标题
	private String author; // 文章作者
	private String subject; // 文章摘要
	private String content; // 文章内容
	private Integer clickHit; // 点击量
	private Integer repleHit; // 回复量
	private Timestamp time; // 发布时间
	private Integer sign = 0; // 文章标记 文章为0 景区详情为1
	private String keyWord;
	private User user;
	private AdminUser adminUser;

	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
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

	public Integer getClickHit() {
		return clickHit;
	}

	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}

	public Integer getRepleHit() {
		return repleHit;
	}

	public void setRepleHit(Integer repleHit) {
		this.repleHit = repleHit;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getSign() {
		return sign;
	}

	public void setSign(Integer sign) {
		this.sign = sign;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", author=" + author + ", subject=" + subject + ", content="
				+ content + ", clickHit=" + clickHit + ", repleHit=" + repleHit + ", time=" + time + ", sign=" + sign
				+ ", keyWord=" + keyWord + "]";
	}

}
