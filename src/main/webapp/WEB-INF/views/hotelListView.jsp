<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<script>
$(function(){
	$('#btnHotelList').click(function(){
		$('#loading').show();
		$.ajax({
			type : 'get',	
			url : './restHotelList.do',
			data : {pageNum : $('#pageNum').val()},		
			contentType : "text/html;charset:utf-8",	
			dataType : "json",	
			success : sucCallBack1,	
			error : errCallBack1	
		});
	});
	$('#btnHotelView').click(function(){
		$('#loading').show();
		$.ajax({
			type : 'get',
			url : './restHotelView.do',
			data : {num : $('#num').val()},
			contentType : "text/html;charset:utf-8",
			dataType : "json",
			success : sucCallBack2,
			error : errCallBack2
		});
	});
	
	$('#btnHotelList').trigger('click');
	
});
function sucCallBack1(resData) {
	let tableData = "";
	tableData += "<h2>게시판 API 활용하여 목록 출력하기</h2>"
	+"<table class='table table-bordered'>"
	+"	<tr>"
	+"		<th>번호</th>"
	+"		<th>제목</th>"
	+"		<th>아이디</th>"
	+"		<th>작성일</th>"
	+"		<th>조회수</th>"
	+"	</tr>"
	+"	<tbody id='show_data'>";
	
	$(resData).each(function(index, data) {
		tableData += ""
		+"<tr>"
		+"	<td>" + data.num + "</td>"
		+"	<td>" + data.title + "</td>"
		+"	<td>" + data.id + "</td>"
		+"	<td>" + data.postdate + "</td>"
		+"	<td>" + data.visitcount + "</td>"
		+"</tr>";
	});
	
	tableData +="</tbody>"
	+"</table>";
	
	$('.list').html(tableData);
	$('.view').html("");
	$('#loading').hide();
}
function errCallBack1(errData) {
	console.log(errData.status + " : " + errData.statusText);
}

function sucCallBack2(resData) {
	let tableData = "";
	tableData += "<h2>게시판 API 활용하여 내용 출력하기</h2>"
	+"<table class='table table-bordered'>"
	+"	<tr>"
	+"		<th>번호</th><td id='td1'>"+ resData.num +"</td>"
	+"		<th>아이디</th><td id='td2'>"+ resData.id +"</td>"
	+"	</tr>"
	+"	<tr>"
	+"		<th>조회수</th><td id='td3'>"+ resData.postdate +"</td>"
	+"		<th>작성일</th><td id='td4'>"+ resData.visitcount +"</td>"
	+"	</tr>"
	+"	<tr>"
	+"		<th>제목</th><td colspan='3' id='td5'>"+ resData.title +"</td>"
	+"	</tr>"
	+"	<tr>"
	+"		<th>내용</th><td colspan='3' id='td6'>"+ resData.content +"</td>"
	+"	</tr>"
	+"</table>";
	
	$('.view').html(tableData);
	$('.list').html("");
	$('#loading').hide();
}
function errCallBack2(errData) {
	console.log(errData.status + " : " + errData.statusText);
}
</script>
</head>
<body>
<div class="container">
	<div>
		<select id="pageNum">
		<c:forEach begin="1" end="11" var="num">
			<option value="${num }">${num }page</option>
		</c:forEach>
		</select>
		<input type="button" value="목록불러오기" id="btnHotelList" />
		<input type="number" id="num" value="2" />
		<input type="button" value="내용불러오기" id="btnHotelView" />
	</div>
	<div id="loading">
		<img src="./loading.gif" />
	</div>
	<div class="list">
	</div>
	<div class="view">
	</div>
	
</div>
</body>
</html>