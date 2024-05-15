package com.hotels.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/boardList.do")
	public String BoardList() {
		return "boardList";
	}
	
	@GetMapping("/boardView.do")
	public String BoardView() {
		return "boardView";
	}
	
	@GetMapping("/boardListView.do")
	public String BoardListView() {
		return "boardListView";
	}
}
