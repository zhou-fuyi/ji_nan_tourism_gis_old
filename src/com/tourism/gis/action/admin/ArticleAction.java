package com.tourism.gis.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.AdminUser;
import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.Result;
import com.tourism.gis.service.ArticleService;
import com.tourism.gis.util.ArticleUtil;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.WriteJsonFile;
import com.tourism.gis.util.bean.ArticleView;

public class ArticleAction extends ActionSupport implements ModelDriven<Article> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArticleService articleService;
	private Article article;
	private InputStream inputStream;
	private String pathName = "json\\article\\article.json";

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	/**
	 * 向外写入json文件
	 */
	public void writeJsonFile(Integer sign) {
		Set<Article> set = this.articleService.getArticleSetByAdmin(sign);
		if (set != null) {
			List<Article> temp = new ArrayList<>(set);
			List<ArticleView> viewList = ArticleUtil.getArticleViewList(temp);
			String result = JSON.toJSONString(viewList);
			WriteJsonFile.writeConfigJsonFile(result, pathName);
		}
	}

	/**
	 * 自定义解析FormData
	 * 
	 * @param map
	 * @return
	 */
	public Map<String, String> handleFormData(String args) {
		Map<String, String> map = new HashMap<>();
		String[] strs = args.split("&");
		for (String st : strs) {
			String[] temp = st.split("=");
			if (temp.length == 1) {
				map.put(temp[0], "");
			} else {
				map.put(temp[0], temp[1]);
			}
		}
		System.out.println(map);
		return map;
	}

	/**
	 * 将解析后的formData封装为对象
	 * 
	 * @param map
	 * @return
	 */
	public Article createArticleByFormData(Map<String, String> map) {
		Article temp = new Article();
		/*
		 * temp.setId(map.get("id")); temp.setName(map.get("name"));
		 * temp.setColor(map.get("map"));
		 */
		return temp;
	}

//===============================================================================================

	/*
	 * public String addBlog() throws UnsupportedEncodingException {
	 * System.out.println(article); article.setId(CommonUtils.uuid()); if (article
	 * == null) { inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
	 * return "blogJson"; } User user = (User)
	 * ActionContext.getContext().getSession().get("user");
	 * System.out.println(user); if (user == null) { inputStream = new
	 * ByteArrayInputStream("-1".getBytes("UTF-8")); return "blogJson"; }
	 * article.setUser(user); String author = null; if (user.getUserCname() == null
	 * || user.getUserCname() == "") { author = user.getUserName(); } else { author
	 * = user.getUserCname(); }
	 * 
	 * article.setAuthor(author); article.setClickHit(0); article.setRepleHit(0); //
	 * article.setSign(0); article.setTime(new Timestamp(new Date().getTime()));
	 * 
	 * System.out.println(article); this.articleService.addArticle(article);
	 * inputStream = new ByteArrayInputStream("1".getBytes("UTF-8")); return
	 * "blogJson"; }
	 */

	/**
	 * 不管是添加资讯还是添加游记 都是这个方法
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String addBlogByAdmin() throws UnsupportedEncodingException {
		System.out.println(article);
		article.setId(CommonUtils.uuid());

		if (article == null) {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			return "blogJson";
		}
		Result result = new Result();
		AdminUser adminUser = (AdminUser) ActionContext.getContext().getSession().get("adminUser");
		System.out.println(adminUser);
		if (adminUser == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		article.setAdminUser(adminUser);
		String author = null;
		if (adminUser.getAdminCname() == null || adminUser.getAdminCname() == "") {
			author = adminUser.getAdminName();
		} else {
			author = adminUser.getAdminCname();
		}

		article.setAuthor(author);
		article.setClickHit(0);
		article.setRepleHit(0);
		// article.setSign(0);
		article.setTime(new Timestamp(new Date().getTime()));

		result.setId(CommonUtils.uuid());
		result.setArticleId(article.getId());
		result.setKeyWord(article.getKeyWord());
		result.setSubject(article.getSubject());
		result.setTime(article.getTime());
		result.setTitle(article.getTitle());
		result.setType(article.getSign());

		System.out.println(article);
		this.articleService.addArticle(article, result);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "blogJson";
	}

	/**
	 * 管理员获取文章列表(游记和资讯的区别在于sign参数的不同)
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getArticleSetByAdmin() throws UnsupportedEncodingException {
		Set<Article> articleSet = articleService.getArticleSetByAdmin(article.getSign());
		if (articleSet == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		List<Article> temp = new ArrayList<>(articleSet);
		List<ArticleView> viewList = ArticleUtil.getArticleViewList(temp);
		if (viewList == null || viewList.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		/*
		 * Gson gson = new
		 * GsonBuilder().registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY)
		 * .create(); String result = gson.toJson(articleList);
		 */
		System.out.println(viewList);
		String result = com.alibaba.fastjson.JSON.toJSONString(viewList);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "blogJson";
	}

	/**
	 * 删除文章
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String deleteBlog() throws UnsupportedEncodingException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);
		String idStr = request.getParameter("formData[id]");
		String[] ids = idStr.split(",");
		Integer sign = 0;
		for (int i = 0; i < ids.length; i++) {
			Article temp = new Article();
			String id = ids[i];
			temp.setId(id.substring(1, id.length() - 1));
			System.out.println(temp);
			temp = this.articleService.getArticleById(temp);
			System.out.println(temp);
			if (temp != null) {
				this.articleService.deleteArticle(temp);
				sign = temp.getSign();
			} else {
				inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
				return "blogJson";
			}
		}
		writeJsonFile(sign);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "blogJson";
	}

	public String getArticleListByUser() {
		return null;
	}

	public String getArticleListByUserId() {
		return null;
	}

	@Override
	public Article getModel() {
		// TODO Auto-generated method stub
		article = new Article();
		return article;
	}

}
