package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;

import member.model.*;
import java.util.*;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/MemberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 1. MemberDAO객체 생성해서 selectAll()호출
		MemberDAO userDAO = new MemberDAO();
		try {
			ArrayList<MemberVO> arr = userDAO.selectAll();

			// 2. ==> ArrayList<MemberVO> ==>request객체에 저장. (key: "userAll")
			req.setAttribute("userAll", arr);

			// 3. forward 방식으로 list.jsp 페이지로 이동시키기
			RequestDispatcher disp = req.getRequestDispatcher("member/list.jsp");
			disp.forward(req, res);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
