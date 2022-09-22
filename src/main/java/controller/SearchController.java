package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.SearchDAO;
import util.Util;

@Controller
public class SearchController {

	SearchDAO search_dao;

	public void setSearch_dao(SearchDAO search_dao) {
		this.search_dao = search_dao;
	}

	@RequestMapping("/search.do")
	public String search(Model model) {

		return Util.Search.VIEW_PATH + "search.jsp";
	}

}
