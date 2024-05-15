package com.hotels.springboot.resthotel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

/*
해당 컨트롤러에서 반환되는 모든 문자열은 웹 브라우저에 즉시 출력된다.
즉 View로 포워드 되지 않는다.
 */
@RestController
public class HotelRestController {
	
	@Autowired
	IHotelService dao;
	
	//검색하기
	@GetMapping("/restHotelSearch.do")
	public List<HotelDTO> restHotelSearch(HttpServletRequest req,
			ParameterDTO parameterDTO) {
		if(parameterDTO.getHt_lat() == null) {
			parameterDTO.setHt_lat(37.559);
			parameterDTO.setHt_lng(126.98582);
		}
		if(parameterDTO.getGrade() == null) {
			parameterDTO.setGrade(0.0);
		}
		List<HotelDTO> searchList = dao.search(parameterDTO);
		return searchList;
	}
	
	//DTO를 반환하면 JSON 객체 형태로 출력된다.
	@GetMapping("/restHotelView.do")
	public List<HotelDTO> restHotelView(ParameterDTO parameterDTO) {
		List<HotelDTO> viewList = dao.view(parameterDTO);
		return viewList;
	}
	
	@GetMapping("/restHotelComment.do")
	public List<HotelDTO> restHotelComment(@RequestParam("hotel_idx") int hotel_idx) {
		List<HotelDTO> viewList = dao.comment(hotel_idx);
		return viewList;
	}
	
	@GetMapping("/restHotelGrade.do")
	public HotelDTO restHotelGrade(ParameterDTO parameterDTO) {
		HotelDTO viewList = dao.getGrade(parameterDTO);
		return viewList;
	}
}



















