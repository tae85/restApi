package com.hotels.springboot.resthotel;

import lombok.Data;

@Data
public class ParameterDTO {
	private String searchWord;
	private String checkin;
	private String checkout;
	private String personCnt;
	private String roomCnt;
	private String minPrice;
	private String maxPrice;
	private Double grade;
	private Double ht_lat;
	private Double ht_lng;
	private int start;
	private int end;
	
	private int hotel_idx;
	private int room_idx;
	
}
