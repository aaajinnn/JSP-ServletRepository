package my.com;

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

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		req.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");
		System.out.println(id);

		if (id == null || id.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('아이디를 입력하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}

		MemberDAO userDao = new MemberDAO();
		try {
			int n = userDao.deleteMember(id);

			String msg = (n > 0) ? "회원탈퇴 완료!" : "탈퇴 실패(존재하지 않는 ID입니다.)";
			String loc = (n > 0) ? "index.html" : "member/mypage.html";

			out.println("<script>");
			out.println("alert('" + msg + "')");
			out.println("location.href='" + loc + "'");
			out.println("</script>");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.close();
	}

}
