package com.tourism.gis.util.bean;

import java.util.ArrayList;
import java.util.List;

public class Msg {

	private String code;
	private String msg;
	private List<String> data = new ArrayList<>();
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Msg() {

	}

	public Msg(String code, String msg, List<String> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Msg [code=" + code + ", msg=" + msg + ", data=" + data + "]";
	}

}
