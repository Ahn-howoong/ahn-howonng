package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Util;

@Controller
public class StaticController {

	@RequestMapping("/recommend.do")
	public String recommend() {

		return Util.Static.VIEW_PATH + "recommend.jsp";
	}

	@RequestMapping("/mbti.do")
	public String mbti() {

		return Util.Static.VIEW_PATH + "mbti.jsp";
	}

}
