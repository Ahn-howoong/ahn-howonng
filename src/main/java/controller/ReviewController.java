package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	// 한줄평 메인 페이지 보이기
	@RequestMapping("/review.do")
	public String review(Model model) {

		List<ReviewVO> list = review_dao.selectList();
		model.addAttribute("list", list);

		// show라는 이름으로 저장된 값을 제거
		request.getSession().removeAttribute("show");

		return PATH + "review/review.jsp";
	}

	// 한줄평 작성 페이지로 이동
	@RequestMapping("/review_write.do")
	public String review_write(Model model) {

		return PATH + "review/review_write.jsp";
	}

	// 책 검색하기
	@RequestMapping("/book_search.do")
	public String book_search(Model model) {

		return PATH + "review/book_search.jsp";
	}

	// 한줄평 조회하기
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

	// 내용 작성하기
	@RequestMapping("/review_insert.do")
	public String review_insert(ReviewVO vo) {

		// ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		int res = review_dao.insert(vo);

		return "redirect:review.do";
	}

	// 수정폼 이동하기
	@RequestMapping("/review_modify.do")
	public String review_modify(Model model, int idx) {

		ReviewVO vo = review_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		return PATH + "review/review_modify.jsp";
	}

	// 수정하기
	@RequestMapping("/review_update.do")
	public String review_update(ReviewVO vo) {

		// ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		int res = review_dao.update(vo);

		return "redirect:review_view.do?idx=" + vo.getIdx();
	}

	// 삭제 메서드
	@RequestMapping("/review_delete.do")
	@ResponseBody // return 값을 jsp 등으로 인식하지 않고, 콜백메서드로 전달하기 위한 키워드
	public String delete(int idx) {
		int res = review_dao.delete(idx);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes 데이터는 콜백 메서드로 돌아간다.
		return result;
	}
}
