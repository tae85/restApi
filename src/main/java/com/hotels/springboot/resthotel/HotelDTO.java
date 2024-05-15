package com.hotels.springboot.resthotel;

import java.sql.Date;

import lombok.Data;

@Data
public class HotelDTO {
	//호텔
	private int hotel_idx;
	private String hotel;
	private String country;
	private String city;
	private String province;
	private String street;
    private String checkin_time;
    private String checkout_time;
    private String ht_lat;
    private String ht_lng;
    private String picture;
    private String site;
	private double disKm;
    
    //객실
    private int room_idx;
    private String room;
    private int price;
    private int room_cnt;
    private String room_opic;
    private String room_spic;
    
    //후기
    private int comment_idx;
    private String idx;
    private String name;
    private double grade;
    private String comments;
    private String comment_date;
    private String total_comment;
    
    //멤버
    private String email;
    private String naver;
    private String google;
    private String apple;
}
