package bbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.db.DBUtil;

// 게시판 관련 CRUD 수행 => data layer
public class BbsDAO {

	private DataSource ds;

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// 기본생성자
	public BbsDAO() {
		System.out.println("BbsDAO() 생성...");
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle"); // 톰캣과 dbcp를 함께 찾는다.
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	/** 글쓰기(시퀀스 - Bbs_no_seq) */
	public int insertBbs(BbsVO vo) throws SQLException {
		try {
			// con = DBUtil.getCon();
			con = ds.getConnection(); // 데이터소스에서 얻어오기

			// oracle
			String sql = "INSERT INTO bbs (no, title, writer, content, wdate)";
			sql += " VALUES(BBS_NO_SEQ.NEXTVAL, ?, ?, ?, sysdate)";

			// mysql
			String sql2 = "INSERT INTO bbs (title, writer, content, wdate) VALUES(";
			sql2 += " ?, ?, ?, curdate())";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getWriter());
			ps.setString(3, vo.getContent());

			int n = ps.executeUpdate();
			return n;

		} finally {
			close();
		}
	}// --------------

	private ArrayList<BbsVO> makeList(ResultSet rs) throws SQLException {
		ArrayList<BbsVO> arr = new ArrayList<>();
		while (rs.next()) {
			int no = rs.getInt("no");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String content = rs.getString("content");
			java.sql.Date wdate = rs.getDate("wdate");
			// => 가져온객체를 VO에 담기
			BbsVO record = new BbsVO(no, title, writer, content, wdate);
			arr.add(record);
		}
		return arr;
	}

	/** 전체 글목록 가져오기 */
	public ArrayList<BbsVO> listBbs() throws SQLException {
		try {
			// con = DBUtil.getCon();
			con = ds.getConnection(); // 데이터소스에서 얻어오기

			// oracle, mydql
			String sql = "SELECT no,title,writer,content,wdate FROM bbs ORDER BY no DESC";
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			return makeList(rs);

		} finally {
			close();
		}
	}

	/** 로그인 한 id의 글목록 가져오기 */
	public ArrayList<BbsVO> selectMyBbs(String writer) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "SELECT bbs.* FROM java_member mem JOIN bbs bbs";
			sql += " ON mem.id = bbs.writer";
			sql += " WHERE writer = ?";
			sql += " ORDER BY wdate DESC";

			ps = con.prepareStatement(sql);
			ps.setString(1, writer);
			rs = ps.executeQuery();

			return makeList(rs);

		} finally {
			close();
		}
	}

	/** title로 검색하여 글목록 가져오기 */
	public ArrayList<BbsVO> selectTitle(String title) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "SELECT * FROM bbs WHERE title LIKE ? ORDER BY wdate DESC";

			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + title + "%");
			rs = ps.executeQuery();

			return makeList(rs);

		} finally {
			close();
		}
	}

	/** 게시판 마지막 글번호 가져오기 */
	public int selectNum() throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "SELECT last_number FROM user_sequences";
			sql += " WHERE sequence_name=?";

			ps = con.prepareStatement(sql);
			ps.setString(1, "BBS_NO_SEQ");

			rs = ps.executeQuery();

			rs.next();
			int n = rs.getInt("last_number");
			return n;

		} finally {
			close();
		}
	}

	/** 글삭제 */
	public int deleteBbs(String id, int no) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "DELETE FROM bbs";
			sql += " WHERE writer=(SELECT id FROM java_member WHERE id = ?)";
			sql += " AND no=?";

			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, no);

			int n = ps.executeUpdate();
			return n;

		} finally {
			close();
		}

	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// close()---------------------
}
