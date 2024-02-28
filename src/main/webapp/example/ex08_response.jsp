<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ex08_response.jsp</h1>
<p>
	response객체의 주요 메서드
	- sendRedirect(페이지)<br>
	- sendError(에러코드)<br>
</p>
<%
//1. 아이디와 비번값 받아서 브라우저에 출력하세요
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
//2. null값이면 ex08_form.jsp로 redirect 이동시키기
	if(uid==null || pwd==null){
		response.sendRedirect("ex08_form.jsp");
		return;
	}
	
//3. //빈문자열일 경우 잘못된 요청 에러를 출력하세요 -400
	if(uid.trim().equals("") || pwd.trim().equals("")){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
//4. killer가 들어오면 접근 금지 에러를 출력하세요 -403
	if(uid.equals("killer")){
		response.sendError(response.SC_FORBIDDEN, "killer는 접근 금지");
	}
//5.uid가 redirect라면 "welcome.jsp"로 redirect방식으로 이동시키세요
	if(uid.equals("redirect")){ // http://localhost:9090/MyWeb/example/welcome.jsp
		
		request.setAttribute("msg",uid+"님 정말 환영해요");
		session.setAttribute("msg",uid+"님 정말 환영해요"); 
		// 여러페이지에 요청을 보내도 브라우저를 쓰는동안에 요청을 유지함
		
		response.sendRedirect("welcome.jsp");
		return;
		// 대부분은 forward를 이용하지만 불가피하게 이용하지못할땐 redirect를 이용한다. 
		// 이럴때 무언가를 저장해야 한다면 session에 저장해야한다. 
		// session에 저장한 값을 다른곳에서 가져와 사용할 수 있다.
	}
//6.uid가 forward라면 "welcome.jsp"로 forward방식으로 이동시키세요
	if(uid.equals("forward")){ // http://localhost:9090/MyWeb/example/ex08_response.jsp (redirect와는 다르게 이전url이 나온다.)
		request.setAttribute("msg",uid+"님 정말 환영해요");
		session.setAttribute("msg",uid+"님 정말 환영해요");
		
	%>
		<jsp:forward page="welcome.jsp" />
	<%
	}
	%>
<h3> 아이디 : <%=uid %></h3>
<h3> 아이디 : <%=pwd %></h3>