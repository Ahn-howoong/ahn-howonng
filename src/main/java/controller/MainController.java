package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.NoticeDAO;
import vo.NoticeVO;

@Controller
public class MainController {
	final String PATH = "/WEB-INF/views/";
	NoticeDAO notice_dao2;

	public void setNotice_dao2(NoticeDAO notice_dao2) {
		this.notice_dao2 = notice_dao2;
	}

	@RequestMapping(value = { "/", "/main.do" })
	public String main(Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 2);
		map.put("search", "all");
		List<NoticeVO> list = notice_dao2.list_main(map);
		model.addAttribute("n_list", list);

		return PATH + "main.jsp";
	}

}
