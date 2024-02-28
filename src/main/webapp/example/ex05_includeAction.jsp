<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ex05_includeAction.jsp</h1>
<p>
 	include 액션 태그를 통해 다른 페이지를 여기에 포함시킬 수 있어요
 	<br>
 	include 액션은 실행결과를 포함시키는 방식이다. jsp의 흐름을 ex04_gugudan.jsp로 이동시켜 그 실행 결과문을 현재 위치에 포함시킨다
 </p>  
<hr color='red'>
<!-- include action 으로 구구단 페이지 포함 -->
<jsp:include page="ex03_gugudan.jsp" /> <!-- 공백없이 닫아주어야만 함 -->