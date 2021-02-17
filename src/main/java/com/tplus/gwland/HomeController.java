package com.tplus.gwland;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"ctx", "bbs"})
public class HomeController {
	@Autowired HttpSession session;
	@Autowired HttpServletRequest request;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@GetMapping("/")
	public String home() {
		String ctx = request.getContextPath();
		session.setAttribute("ctx", ctx);
		session.setAttribute("bbs", ctx+"/resources/bbs");
		return "index";
	}
	@GetMapping("/move/{dir}/{page}")
	public String move(@PathVariable String dir, @PathVariable String page) {
		logger.info("이동 파일: "+page);
		return String.format("%s/%s", dir, page);
	}
}
