package com.tourism.gis.util.bean;

import com.tourism.gis.bean.Article;
import com.tourism.gis.util.DateUtil;

public class ArticleView {

	private String id; // 主键
	private String title; // 文章标题
	private String author; // 文章作者
	private String subject; // 文章摘要
	private String content; // 文章内容
	private Integer clickHit; // 点击量
	private Integer repleHit; // 回复量
	private String time; // 发布时间
	private String sign; // 文章标记 文章为0 景区详情为1
	private String keyWord;
	private String userId;
	private String adminId;

	public ArticleView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleView(Article blog) {
		super();
		this.id = blog.getId();
		this.title = blog.getTitle();
		this.author = blog.getAuthor();
		this.subject = blog.getSubject();
		this.content = blog.getContent();
		this.clickHit = blog.getClickHit();
		this.repleHit = blog.getRepleHit();
		this.time = DateUtil.timeStampToString(blog.getTime());
		if (blog.getSign() == 0) {
			this.sign = "旅游资讯";
		} else {
			this.sign = "旅游小记";
		}
		this.keyWord = blog.getKeyWord();
		if (blog.getUser() != null) {
			this.userId = blog.getUser().getUserId();
		}
		if (blog.getAdminUser() != null) {
			this.adminId = blog.getAdminUser().getAdminId();
		}
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "ArticleView [id=" + id + ", title=" + title + ", author=" + author + ", subject=" + subject
				+ ", content=" + content + ", clickHit=" + clickHit + ", repleHit=" + repleHit + ", time=" + time
				+ ", sign=" + sign + ", keyWord=" + keyWord + ", userId=" + userId + ", adminId=" + adminId + "]";
	}

}
