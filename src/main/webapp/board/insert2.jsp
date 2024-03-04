<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error.jsp"%>
<!-- 로그인 체크 모듈 include(소스를 포함시키자) ==> 상단에서 실행시켜야만 함 -->
<%@ include file="/login/loginCheckModule.jsp" %>
<!-- ------------------------------------------- -->
    
    
<jsp:useBean id="vo" class="bbs.model.BbsVO" scope="page" /> <%-- vo는 page를 줌 --%>
<%-- BbsVO v0 = new BbsVO(); 와 동일함 --%>

<jsp:setProperty name="vo" property="*" /> <%-- vo의 settet를 부르기 위함 --%>
<%-- 
input name과 vo객체의 property명이 같을 경우 "*" 로 처리할 수 있다.
	vo.setTitle(request.getParameter("title"); 와 동일 
--%>
<jsp:useBean id="dao" class="bbs.model.BbsDAO" scope="session"/> <%-- dao는 session을 줌 --%>
<%--
	scope : 객체가 살아있는 유효범위
	[1] page : 사용자의 개인정보를 가지고있을 경우 (vo), 하나의 페이지에서만 유효
	[2] request : 하나의 요청(request)을 처리하는 동안 유효
	[3] session : 하나의 브라우저를 사용하는 동안 유효 (dao)
	[4] application : 서버시작~종료시까지 객체가 살아있음
	
	page < request < session < application
	
	
	
	하지만 useBeans는 잘 사용하진 않음!
--%>
<%
	int n = dao.insertBbs(vo);
	response.sendRedirect("list2.jsp");
%>

<%--
BbsVO() 생성됨... <====기본생성자 생성 중요
setTitle() : 자바빈즈 사용
EncodingFilter doFilter()...
BbsDAO() 생성...
--%>
<%--
BbsVO() 생성됨...
setTitle() : usebean
BbsDAO() 생성...
Driver Loading success...
BbsVO() 생성됨...
setTitle() : usebaen vo는?

===>vo는 계속 생성됨(scope="page"), dao는 한번만 생성됨(scope="session")
 --%>
