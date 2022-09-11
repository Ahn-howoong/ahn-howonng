package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MemberController {

	MemberDAO member_dao;

	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	@RequestMapping(value = { "/", "regi_form.do" })
	public String show(Model model) {

		return "/WEB-INF/views/member/regi_form.jsp";
	}

	// 아이디 중복 체크
	@RequestMapping("/id_check.do")
	@ResponseBody // return 값을 jsp 등으로 인식하지 않고, 콜백메서드로 전달하기 위한 키워드
	public String selectOne(Model model, String id) {
		MemberVO vo = member_dao.selectOne(id);

		String result = "no";
		if (vo != null) {
			result = "yes";
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes 데이터는 콜백 메서드로 돌아간다.
		return result;
	}

	@RequestMapping("/regi_insert.do")
	@ResponseBody
	public String insert(Model model, String name, String id, String pwd, String email, String tel, String addr) {
		int res = member_dao.insert(name, id, pwd, email, tel, addr);
		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}
}
