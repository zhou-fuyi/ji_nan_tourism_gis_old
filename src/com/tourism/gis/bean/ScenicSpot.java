package com.tourism.gis.bean;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 景区详情类
 * 
 * @author Administrator
 *
 */
public class ScenicSpot {

	private String id; // 主键
	private String name; // 景区名称
	private String tagline; // 宣传标语
	private String level; // 景区等级
	private String defaultPhoto; // 景区大图
	private String ticketPrice; // 票价
	private String intro; // 景区简介
	private String cName; // 景区称号
	private String feature; // 特色景观
	private List<ScenicType> typeList = new ArrayList<ScenicType>(); // 景区类型
	private String line; // 游览路线
	private String tel; // 景区电话
	private String guideMan; // 景区解说员说明
	private String address; // 景区地址
	private String time; // 景区营业时间
	private String supporting; // 景区配套服务设施
	private String costTime; // 游览时间
	private String website; // 景区官网
	private String serviceCenter; // 游客服务中心
	private String priceDescription; // 票价说明
	private String discount; // 门票优惠政策
	private List<Image> photoList = new ArrayList<Image>(); // 景区相册
	// private Image mapPhoto; // 交通指南地图中小图片
	private String bus; // 公交路线提示
	private String driving; // 自驾车指南
	private String park; // 停车场信息
	private LandMark landMark; // 景点地标信息
	private Integer sign = 1; // 景区的标记 景区简介默认为2 文章默认为0
	private Timestamp releaseDate; // 发布时间
	private String management;
	
	public ScenicSpot() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		System.out.println("设置name属性================");
		this.name = name;
	}

	public String getTagline() {
		return tagline;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getDefaultPhoto() {
		return defaultPhoto;
	}

	public void setDefaultPhoto(String defaultPhoto) {
		this.defaultPhoto = defaultPhoto;
	}

	public String getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(String ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public List<ScenicType> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<ScenicType> typeList) {
		this.typeList = typeList;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGuideMan() {
		return guideMan;
	}

	public void setGuideMan(String guideMan) {
		this.guideMan = guideMan;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSupporting() {
		return supporting;
	}

	public void setSupporting(String supporting) {
		this.supporting = supporting;
	}

	public String getCostTime() {
		return costTime;
	}

	public void setCostTime(String costTime) {
		this.costTime = costTime;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getServiceCenter() {
		return serviceCenter;
	}

	public void setServiceCenter(String serviceCenter) {
		this.serviceCenter = serviceCenter;
	}

	public String getPriceDescription() {
		return priceDescription;
	}

	public void setPriceDescription(String priceDescription) {
		this.priceDescription = priceDescription;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public List<Image> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Image> photoList) {
		this.photoList = photoList;
	}

	public String getBus() {
		return bus;
	}

	public void setBus(String bus) {
		this.bus = bus;
	}

	public String getDriving() {
		return driving;
	}

	public void setDriving(String driving) {
		this.driving = driving;
	}

	public String getPark() {
		return park;
	}

	public void setPark(String park) {
		this.park = park;
	}

	public LandMark getLandMark() {
		return landMark;
	}

	public void setLandMark(LandMark landMark) {
		this.landMark = landMark;
	}

	public Integer getSign() {
		return sign;
	}

	public void setSign(Integer sign) {
		this.sign = sign;
	}

	public Timestamp getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Timestamp releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getManagement() {
		return management;
	}

	public void setManagement(String management) {
		this.management = management;
	}

	@Override
	public String toString() {
		return "ScenicSpot [id=" + id + ", name=" + name + ", tagline=" + tagline + ", level=" + level
				+ ", defaultPhoto=" + defaultPhoto + ", ticketPrice=" + ticketPrice + ", intro=" + intro + ", cName="
				+ cName + ", feature=" + feature + ", typeList=" + typeList + ", line=" + line + ", tel=" + tel
				+ ", guideMan=" + guideMan + ", address=" + address + ", time=" + time + ", supporting=" + supporting
				+ ", costTime=" + costTime + ", website=" + website + ", serviceCenter=" + serviceCenter
				+ ", priceDescription=" + priceDescription + ", discount=" + discount + ", photoList=" + photoList
				+ ", bus=" + bus + ", driving=" + driving + ", park=" + park + ", landMark=" + landMark + ", sign="
				+ sign + ", releaseDate=" + releaseDate + ", management=" + management + "]";
	}

}
