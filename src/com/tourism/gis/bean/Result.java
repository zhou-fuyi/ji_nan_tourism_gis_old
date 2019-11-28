package com.tourism.gis.bean;

import java.sql.Timestamp;

/**
 * 查询结果类
 * 
 * @author Administrator
 *
 */
public class Result {

	private String id; // 主键
	private String title; // 标题
	private String subject; // 摘要
	private String keyWord; // 关键字
	private Timestamp time; // 文章发布时间
	private Integer type; // 结果类型（文章/景区详情）
	private String articleId; // 文章ID
	private String scenicSpotId; // 景区详情ID

	public Result() {
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getScenicSpotId() {
		return scenicSpotId;
	}

	public void setScenicSpotId(String scenicSpotId) {
		this.scenicSpotId = scenicSpotId;
	}

	@Override
	public String toString() {
		return "Result [id=" + id + ", title=" + title + ", subject=" + subject + ", keyWord=" + keyWord + ", time="
				+ time + ", type=" + type + ", articleId=" + articleId + ", scenicSpotId=" + scenicSpotId + "]";
	}

}
