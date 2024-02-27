package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;

@WebServlet("/MemberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res); // 405에러 없어짐

	}// -----------------------------------------

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter(); // 2byte 기반
//		ServletOutputStream sos = res.getOutputStream(); // 1byte 기반

		req.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");
		out.println("<br>" + id + "</br>");
		System.out.println("id : " + id);

		// get방식의 경우 사용자가 링크를 직접 입력하여 들어오면 null
		// 그래서 반드시 null체크를 하여 유효성검사를 해줘야한다.
		if (id == null || id.trim().isEmpty()) {
			res.sendRedirect("member/mypage.html");
			// sendRedirect : 페이지 이동
			// ==> 브라우저의 url을 member/mypage.html로 변경해서
			// 서버에 새롭게 요청을 보내는 방식으로 페이지를 이동한다.

			return;
		}

		MemberDAO userDao = new MemberDAO();
		try {
			int n = userDao.deleteMember(id);

			String msg = (n > 0) ? "회원탈퇴 완료!" : "탈퇴 실패(ID를 확인하세요.)";
			String loc = (n > 0) ? "index.html" : "javascript:history.back()";

			out.println("<script>");
			out.println("alert('" + msg + "')");
			out.println("location.href='" + loc + "'");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<b>서버 에러 : " + e.getMessage() + "</b><br>");
			e.printStackTrace();
		}
		out.close();
	}

}
