package com.hotels.springboot.resthotel;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IHotelService {
	
	//호텔 검색
	public ArrayList<HotelDTO> search(ParameterDTO parameterDTO);
	
	//호텔 상세보기(객실보기)
	public ArrayList<HotelDTO> view(ParameterDTO parameterDTO);
	
	//후기 리스트
	public ArrayList<HotelDTO> comment(int hotel_idx);
	
	//호텔 평점
	public HotelDTO getGrade(ParameterDTO parameterDTO);
	
}
