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
	//버튼을 클릭하면 ajax 함수를 호출한다.
	$('#btnHotel').click(function(){
		$('#loading').show();
		
		setTimeout(()=>{
			$.ajax({
				type : 'get',	//전송방식
				url : './restHotelList.do',	//요청URL(요청명)
				data : {pageNum : $('#pageNum').val()},		//파라미터(페이지번호)
				contentType : "text/html;charset:utf-8",	//컨텐츠타입
				dataType : "json",	//콜백데이터 형식
				success : sucCallBack,	//성공시 호출할 콜백함수
				error : errCallBack 	//실패시 호출할 콜백함수
			});
			
		}, 500);
	});
	//HTML 페이지가 로드되었을 때 자동으로 이벤트 실행
	$('#btnHotel').trigger('click');
});
//요청에 성공했을 때 호출되는 콜백함수 정의
function sucCallBack(resData) {
	//매개변수 resData로 JSON 배열이 전달된다.
	let tableData = "";
	//배열의 크기만큼 반복한다.
	$(resData).each(function(index, data) {
		//파싱한 데이터는 <tr> 태그로 누적해서 저장한다.
		tableData += ""
		+"<tr>"
		+"	<td>" + data.num + "</td>"
		+"	<td>" + data.title + "</td>"
		+"	<td>" + data.id + "</td>"
		+"	<td>" + data.postdate + "</td>"
		+"	<td>" + data.visitcount + "</td>"
		+"</tr>"
	});
	//누적된 <tr> 데이터를 해당 테이블에 삽입한다.
	$('#show_data').html(tableData);
	$('#loading').hide();
}
//요청에 실패했을 때 호출되는 콜백함수
function errCallBack(errData) {
	console.log(errData.status + " : " + errData.statusText);
}
</script>
</head>
<body>
<div class="container">
	<div class="list">
		<h2>게시판 API 활용하여 목록 출력하기</h2>
		<div id="loading">
			<img src="./loading.gif" />
		</div>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tbody id="show_data"></tbody>
		</table>
		<div>
			<select id="pageNum">
			<c:forEach begin="1" end="11" var="num">
				<option value="${num }">${num }page</option>
			</c:forEach>
			</select>
			<input type="button" value="목록불러오기" id="btnHotel" />
		</div>
	</div>
</div>
</body>
</html>



























