package com.tourism.gis.util;

import java.util.ArrayList;
import java.util.List;

import com.tourism.gis.bean.Article;
import com.tourism.gis.util.bean.ArticleView;

/**
 * 文章工具
 * 
 * @author Administrator
 *
 */
public class ArticleUtil {

	public static List<ArticleView> getArticleViewList(List<Article> list) {
		List<ArticleView> viewList = new ArrayList<ArticleView>();
		if (list == null || list.size() == 0) {
			return null;
		}
		for (Article article : list) {
			ArticleView view = new ArticleView(article);
			viewList.add(view);
		}
		return viewList;
	}
}
