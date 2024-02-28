<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>ex07_request.jsp</h1>
<%
/*
	request 내장객체 : HttpServletRequest 타입
	<1> 단일값을 받을 경우
		- String getParameter("파라미터명");
	<2> 다중값을 받을 경우
		- String[] getParameterValues("파라미터명");
*/
// (1) 성별, 직업 값을 받아서 출력하세요
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	if(gender==null || job==null){
		response.sendRedirect("ex07_form.jsp");
		return;
	}
// (2) 취미, 언어 값들을 받아서 출력하세요
	String[] hobbies = request.getParameterValues("hobby");
	String[] langs = request.getParameterValues("lang");
%>
	<h3>성별 : <%=gender %> </h3>
	<h3>직업 : <%=job %> </h3>
	<h3>취미 : 
	<%
		if(hobbies!=null){
			for(String hb : hobbies){
				out.println(hb+", ");
			}
		}
	%>
	</h3>
	<h3>언어 : 
	<%
		if(langs!=null){
			for(String lang : langs){
				out.println(lang+", ");
			}
		}
	%>
	</h3>
	<hr color="blue">
	<h2>request의 주요 메서드</h2>
	http://localhost:9090/MyWeb/example/ex07_request.jsp?gender=F&hobby=reading&hobby=music&job=Frontend&lang=JavaScript
	<%
		String server = request.getServerName(); //호스트명
		int port = request.getServerPort(); //포트번호
		StringBuffer url= request.getRequestURL(); // url정보 반환 (StringBuffer) 호스트명,포트번호,파일경로
		String uri=request.getRequestURI (); // uri정보 반환 (String) 컨텍스트(호스트명,포트번호) 이후의 정보
		
		String queryStr = request.getQueryString(); // query string
		String ctx = request.getContextPath(); // 컨텍스트명 "/MyWeb"
		
		String protocol = request.getProtocol(); // 프로토콜
		String cip=request.getRemoteAddr(); // 클라이언트의 ip주소
	%>
	<h3>호스트명 : <%=server %></h3>
	<h3>서버 포트번호 : <%=port %></h3>
	<h3>요청 url : <%=url %></h3>
	<h3>요청 uri : <%=uri %></h3>
	<h3>쿼리스트링 : <%=queryStr %></h3>
	<h3>컨텍스트명 : <%=ctx %></h3>
	<h3>프로토콜 : <%=protocol %></h3>
	<h3>클의 ip : <%=cip %></h3>
	<h3>컨텍스트명 이후의 경로 : <%=request.getServletPath() %></h3>
	<hr color="orange">
	[문제1] 요청 URI 중에서 /MyWeb/example/ex07_request.jsp
	==> /example/ex07_request.jsp 정보만 추출해서 브라우저에 출력하세요
	<br>
	<%
		int len = ctx.length(); // 컨텍스트명의 길이만큼
		String str = uri.substring(len); // 제외하고 출력
		
		//request.getServletPath() 로 동일한 결과 출력
	%>
	<h3><%=str %></h3>
	
	[문제2] /example/ex07_request.jsp 에서 확장자를 제외한 /example/ex07_request 만 추출
	<%
		int idx = str.lastIndexOf(".jsp");
		// 검색한 문자열이 없으면 -1 반환
		System.out.println("idx : " + idx);
		if(idx!=-1){
			str = str.substring(0, idx); // 맨앞부터 index를 찾은 직전까지 잘라냄
		}
	%>
	<h3><%=str %></h3>