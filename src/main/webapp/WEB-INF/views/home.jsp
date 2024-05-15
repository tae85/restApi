<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset{width:400px;}
</style>
</head>
<body>
	<h2>Rest API 만들어보기</h2>
	<fieldset>
		<legend>2개 이상의 단어 검색</legend>
		<p>
			2개 이상의 검색어는 스페이스로 구분해주세요.
		</p>
		<form action="restHotelSearch.do">
			<!-- <select name="searchField">
				<option value="hotel">hotel</option>
				<option value="place">place</option>
			</select> -->
			<input type="text" name="searchWord" />
			<input type="text" name="minPrice" value="0" />
			<input type="text" name="maxPrice" value="99999999" />
			<input type="text" name="grade" value="0" />
			<input type="text" name="ht_lat" value="37.55998" />
			<input type="text" name="ht_lng" value="126.9858296" />
			<input type="submit" value="요청하기" />
		</form>
	</fieldset>
	<fieldset>
		<legend>상세 내용 조회</legend>
		<form action="restHotelView.do">
			일련번호 : <input type="number" name="hotel_idx" />
			<input type="submit" value="요청하기" />
		</form>
	</fieldset>
	<fieldset>
		<legend>호텔 후기 보기</legend>
		<form action="restHotelComment.do">
			일련번호 : <input type="number" name="hotel_idx" />
			<input type="submit" value="요청하기" />
		</form>
	</fieldset>
	<fieldset>
		<legend>호텔 평점 보기</legend>
		<form action="restHotelGrade.do">
			일련번호 : <input type="number" name="hotel_idx" />
			<input type="submit" value="요청하기" />
		</form>
	</fieldset>
	
</body>
</html>
