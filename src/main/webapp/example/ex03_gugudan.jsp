<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex03_gugudan.jsp -->
<style>
	table{
		width:80%;
		margin:3em auto;
	}
	table th, td{
	text-align:center;
	}
</style>
<h1>구구단 전체를 테이블 형태로 출력하세요</h1>
<table border=1>
	<thead>
		<tr>
		<% for(int dan=2; dan<10; dan++){ %>
			<th><%=dan %>단</th>
		<%} %>
		</tr>
	</thead>
	<tbody>
		<%for(int i=2;i<10;i++){ %>
		<tr>
			<%for(int j=2;j<10;j++){ %>
			<td><%=j %>x<%=i %>=<%=i*j%></td>
			<%} %>
		</tr>
		<%} %>
	</tbody>
</table>