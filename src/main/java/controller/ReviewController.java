package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReviewDAO;
import vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	HttpServletRequest request;

	final String PATH = "/WEB-INF/views/";
	ReviewDAO review_dao;

	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}

	@RequestMapping("/review.do")
	public String review(Model model) {

		List<ReviewVO> list = review_dao.selectList();
		model.addAttribute("list", list);

		// show라는 이름으로 저장된 값을 제거
		request.getSession().removeAttribute("show");

		return PATH + "review/review.jsp";
	}

	@RequestMapping("/review_write.do")
	public String review_write(Model model) {

		return PATH + "review/review_write.jsp";
	}

	@RequestMapping("/book_search.do")
	public String book_search(Model model) {

		return PATH + "review/book_search.jsp";
	}

	@RequestMapping("/review_view.do")
	public String review_view(Model model, int idx) {

		ReviewVO vo = review_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			// 조회수 증가를 위한 업데이트 메서드 호출
			review_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}

		return PATH + "review/review_view.jsp";
	}

	@RequestMapping("/review_insert.do")
	public String review_insert(ReviewVO vo) {

		// ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		System.out.println(vo.getTitle());

		int res = review_dao.insert(vo);

		return "redirect:review.do";
	}
}
