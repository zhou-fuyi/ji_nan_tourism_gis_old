package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.Article;
import com.tourism.gis.bean.Result;
import com.tourism.gis.bean.User;
import com.tourism.gis.service.ArticleService;
import com.tourism.gis.service.ResultService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.PageUtil;
import com.tourism.gis.util.WriteJsonFile;
import com.tourism.gis.util.bean.PageBean;

public class ArticleAction extends ActionSupport implements ModelDriven<Article> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArticleService articleService;
	private Article article;
	private InputStream inputStream;
	private String pathName = "json\\article\\article.json";
	private ResultService resultService;

	public void setResultService(ResultService resultService) {
		this.resultService = resultService;
	}

	private Map<String, Object> sessionMap = ActionContext.getContext().getSession();

	private HttpServletRequest request = (HttpServletRequest) ActionContext.getContext()
			.get(StrutsStatics.HTTP_REQUEST);

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String addBlog() throws UnsupportedEncodingException {
		System.out.println(article);
		article.setId(CommonUtils.uuid());
		if (article == null) {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			return "blogJson";
		}
		Result result = new Result();
		User user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println(user);
		if (user == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		article.setUser(user);
		String author = null;
		if (user.getUserCname() == null || user.getUserCname() == "") {
			author = user.getUserName();
		} else {
			author = user.getUserCname();
		}

		article.setAuthor(author);
		article.setClickHit(0);
		article.setRepleHit(0);
		// article.setSign(0);
		article.setTime(new Timestamp(new Date().getTime()));

		System.out.println(article);

		result.setId(CommonUtils.uuid());
		result.setArticleId(article.getId());
		result.setKeyWord(article.getKeyWord());
		result.setSubject(article.getSubject());
		result.setTime(article.getTime());
		result.setTitle(article.getTitle());
		result.setType(article.getSign());

		this.articleService.addArticle(article, result);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		this.writeUserArticles();
		return "blogJson";
	}

	/**
	 * 不管是添加资讯还是添加游记 都是这个方法
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	/*
	 * public String addBlogByAdmin() throws UnsupportedEncodingException {
	 * System.out.println(article); article.setId(CommonUtils.uuid()); if (article
	 * == null) { inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
	 * return "blogJson"; } AdminUser adminUser = (AdminUser)
	 * ActionContext.getContext().getSession().get("adminUser");
	 * System.out.println(adminUser); if (adminUser == null) { inputStream = new
	 * ByteArrayInputStream("-1".getBytes("UTF-8")); return "blogJson"; }
	 * article.setAdminUser(adminUser); String author = null; if
	 * (adminUser.getAdminCname() == null || adminUser.getAdminCname() == "") {
	 * author = adminUser.getAdminName(); } else { author =
	 * adminUser.getAdminCname(); }
	 * 
	 * article.setAuthor(author); article.setClickHit(0); article.setRepleHit(0); //
	 * article.setSign(0); article.setTime(new Timestamp(new Date().getTime()));
	 * 
	 * System.out.println(article); this.articleService.addArticle(article);
	 * inputStream = new ByteArrayInputStream("1".getBytes("UTF-8")); return
	 * "blogJson"; }
	 */

	/**
	 * 管理员获取文章列表(游记和资讯的区别在于sign参数的不同)
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getArticleSetByAdmin() throws UnsupportedEncodingException {
		Set<Article> articleList = articleService.getArticleSetByAdmin(article.getSign());
		if (articleList == null || articleList.size() == 0) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		/*
		 * Gson gson = new
		 * GsonBuilder().registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY)
		 * .create(); String result = gson.toJson(articleList);
		 */
		String result = com.alibaba.fastjson.JSON.toJSONString(articleList);
		WriteJsonFile.writeConfigJsonFile(result, pathName);
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "blogJson";
	}

	public String getArticleById() {
		Article blog = this.articleService.getArticleById(article);
		String[] keyWordArray = null;
		if (blog.getKeyWord() != null) {
			try {
				keyWordArray = blog.getKeyWord().split(" ");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("真的有异常。。。。。。。。。。。");
			}
		}
		request.setAttribute("blog", blog);
		request.setAttribute("keyWords", keyWordArray);
		System.out.println(blog.getSign());
		if (blog.getSign() == 0) {
			return "blogDetail";
		} else {
			return "infoDetail";
		}
	}

	public String getUserArticleById() throws UnsupportedEncodingException {
		Article blog = this.articleService.getArticleById(article);
		// String[] keyWordArray = null;
		if (blog == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		System.out.println(blog);
		// ActionContext.getContext().getSession().put("myBlog", blog);
		String result = JSON.toJSONString(blog);
		System.out.println(result);
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return "blogJson";
	}

	public String getArticleListByUser() {
		return null;
	}

	public String getArticleListByUserId() {
		return null;
	}

	public String editUserArticle() throws UnsupportedEncodingException {
		System.out.println(article);
		if (article.getId() == null) {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			System.out.println("空id");
			return "blogJson";
		}
		Result result = this.resultService.getResultByArticleId(article.getId());
		User user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println(user);
		if (user == null) {
			inputStream = new ByteArrayInputStream("-1".getBytes("UTF-8"));
			return "blogJson";
		}
		Article temp = articleService.getArticleById(article);
		article.setUser(user);
		String author = null;
		if (user.getUserCname() == null || user.getUserCname() == "") {
			author = user.getUserName();
		} else {
			author = user.getUserCname();
		}

		article.setAuthor(author);
		temp.setAuthor(author);
		// article.setSign(0);
		temp.setTime(new Timestamp(new Date().getTime()));
		temp.setTitle(article.getTitle());
		temp.setSubject(article.getSubject());
		temp.setKeyWord(article.getKeyWord());
		System.out.println(temp);
		result.setKeyWord(article.getKeyWord());
		result.setSubject(article.getSubject());
		result.setTime(article.getTime());
		result.setTitle(article.getTitle());
		result.setType(article.getSign());

		this.articleService.updateArticle(temp, result);
		this.writeUserArticles();
		inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		System.out.println("====================================");
		return "blogJson";
	}

	public String loadArticles() {
		int pageCode = PageUtil.getPageCode(request);
		article.setSign(PageUtil.getSign(request));
		System.out.println(article);
		PageBean<Article> beanList = this.articleService.getArticlePageBean(article, pageCode);
		if (beanList != null) {
			beanList.setUrl(PageUtil.getURL(request));
		}
		sessionMap.put("pageBean", beanList);
		if (article.getSign() == 0) {
			return "blogList";
		} else {
			return "infoList";
		}

	}

	public void writeUserArticles() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		int pageCode = PageUtil.getPageCode(request);
		if (user != null) {
			PageBean<Article> pageBean = this.articleService.loadUserArticles(user, pageCode);
			sessionMap.put("userArticle", pageBean);
		}
	}

	public String deleteArticleByUser() {
		if (article.getId() != null || article.getId() != "") {
			this.articleService.deleteArticle(article);
			writeUserArticles();
			return "self";
		} else {
			return "info";
		}
	}

	public String loadSomeArticle() {
		String hql = "from Article a where a.sign = 0 Order by time Desc";
		List<Article> blogList = this.articleService.getArticleList(hql);
		hql = "from Article a where a.sign = 1 Order by time Desc";
		List<Article> infoList = this.articleService.getArticleList(hql);
		this.sessionMap.put("myBlogList", blogList);
		this.sessionMap.put("myInfoList", infoList);
		System.out.println(infoList);
		System.out.println(blogList);
		return "index";
	}

	@Override
	public Article getModel() {
		// TODO Auto-generated method stub
		article = new Article();
		return article;
	}

}
