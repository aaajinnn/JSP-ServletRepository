<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//컨텍스트명 구하기
	String ctx = request.getContextPath(); // "/MyWeb"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyWeb</title>
<link rel="stylesheet" type="text/css" href="<%=ctx %>/css/style.css">
</head>
<body>
<%
	String loginId=(String)session.getAttribute("loginId"); // <==반환타입 Object이므로 강제형변환, 로그아웃 후 loginId=null;
	System.out.println("loginId : " + loginId);
%>
	<div class="wrap">
		<header>
			<!-- top menu -->
			<ul class="topMenu">
				<!-- 어디서 include 될지 모르기때문에 컨텍스트명을 기준으로 절대경로 설정 -->
				<li><a href="<%=ctx %>/index.jsp">Home</a></li> 
				<% if(loginId==null){%>
				<li><a href="<%=ctx%>/login/login.jsp">로그인</a></li>
				<% }else{%>
				
				<li><a href="#"><%=loginId %>님 로그인 중...</a></li>
				<li><a href="<%=ctx%>/login/logout.jsp">로그아웃</a></li>
				
				<% }%>
				<li><a href="<%=ctx %>/member/join.jsp">회원가입</a></li>
				<li><a href="<%=ctx %>/board/input.jsp">게시판 글쓰기</a></li>
				<li><a href="<%=ctx %>/board/list2.jsp">게시판 글목록</a></li>
				<li><a href="<%=ctx %>/login/mypage.jsp">MyPage</a></li>
			</ul>
		</header>
