<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page directive element -->
<!-- 1. html 주석 ===> 페이지에 노출됨-->
<h1>처음 해보는 JSP</h1>
<!-- 
script element
 -->
<%
// 2. 자바 주석
// <1> scriptlet 태그
/* 스크립트렛 태그 안에서는
	자바코드를 기술할 수 있어요
*/
	int a=10; // scriptlet태그 안에서 선언된 변수들은 모두 지역변수
	int b=20;
	// 내장객체 사용 가능
	out.println("<h2>" + a + "+" + b + "=" + (a + b) + "</h2>");
	// out : JspWriter타입의 출력스트림
%>
<!-- html태그 안에 jsp태그를 넣을 수 없다!! -->
<%-- 3. JSP주석 ===> 페이지에 노출이 되지 않음 --%>
<%-- <% int c = 10; %> --%>
<%!
// <2> declaration : 메서드를 구성할 수 있다.
	String str ="나는 멤버변수(인스턴스 변수)";

	public String sayHello(String name){
		return "<h2>Hello " + name +"</h2>";
	}
%>
<%-- <3> expression : 출력식 
	<%=변수%> 
	out.println(변수); 와 동일함 (문장끝 세미콜론X)
	
--%>
<%=str%><br>

<!-- sayHello() 호출해서 결과값 출력 -->
<%= sayHello("Tom")%>

<%--
JSP가 서블릿으로 변환되어 실행된다.
이클립스 서블릿 코드가 생성되는 곳
D:\multicampus\java-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\work
 --%>