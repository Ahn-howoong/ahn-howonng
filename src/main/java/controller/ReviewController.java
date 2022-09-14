package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReviewDAO;

@Controller
public class ReviewController {

	final String PATH = "/WEB-INF/views/";
	ReviewDAO review_dao;

	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}

	@RequestMapping("/review.do")
	public String regi_show(Model model) {

		return PATH + "review/review.jsp";
	}
}
