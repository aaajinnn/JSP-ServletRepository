<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<jsp:include page="/inc/top.jsp"/>
<div class="container">
	<h1>Cookie Test</h1>
	<h2>쿠키에 정보를 저장해보자 - Cookie 클래스 활용</h2>
	<%
		//1. 쿠키 생성 절차
		//	[1] 쿠키 생성
		Cookie ck = new Cookie("visitId", "kim"); // key, value 형태로 저장 (String 타입만 가능하며 특수문자, 한글은 쓸 수 없다.)
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd_hh:mm:ss"); //공백 불가
		String time = sdf.format(date);
		
		Cookie ck2 = new Cookie("visitTime", time);
		
		//	[2] 쿠키 속성 설정 (유효기간, 도메인, 경로,...)
		ck.setMaxAge(60*60*24*7);// (60초*60분*24=하루) *7 => 7일간의 유효기간
		ck2.setMaxAge(60*60*24*3); // 3일간의 유효기간
		//setMaxAge(0); ==> 쿠키삭제
		
		//기본경로 /ligin/cookieTest.jsp
		ck.setPath("/"); //MyWeb 어디서든 꺼내쓰겠다는 경로
		
		//	[3] 쿠키를 클라이언트에 전송
		response.addCookie(ck); //응답메시지 헤더에 쿠키가 포함되어 클에게 전달
		response.addCookie(ck2);
		out.println("<h3>쿠키 저장 완료</h3>");
		
		//2. 쿠키를 꺼내 사용하는 절차(다른페이지에서)
	%>
	<hr>
	<a href="cookieList.jsp"><h2>쿠키 꺼내러 가기</h2></a>
</div>
<jsp:include page="/inc/foot.jsp"/>