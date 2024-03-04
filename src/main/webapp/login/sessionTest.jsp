<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/inc/top.jsp"/>
<div class="container">
	<h1>Session Test</h1>
	<h2 style="color:red">JSessionId : <%=session.getId() %></h2>
	<hr color="blue">
	<br>
	<h2>세션에 저장된 모든 변수를 출력해보자</h2>
	<%
		// 서블릿의 경우 : HttpSession session = request.getSession();
		// JSP의 경우 : 내장객체 => session
		java.util.Enumeration<String> en = session.getAttributeNames();// 세션에 저장된 세션변수의 이름을 반환한다.
		
		while(en.hasMoreElements()){ //세션에 저장된 요소들이 있다면
			//커서를 이용해서 꺼내준다.
			String key=en.nextElement();
			//가리키고 있는 요소가 있다면 true, 없다면 false 반환
			Object val=session.getAttribute(key);
			// scope="session" 으로 되어있다면 key값과 value가 저장되어 반환되는 것을 확인할 수 있다.(list2.jsp에서 확인)
			%>
			<h3><%=key %> ==> <%=val %></h3>
			<%
			
		}
		
	
	%>
</div>
<jsp:include page="/inc/foot.jsp"/>