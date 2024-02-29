package bbs.model;

import java.sql.*;

// 게시판과 관련된 도메인 객체
public class BbsVO {

	@Override
	public String toString() {
		return "BbsVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", wdate="
				+ wdate + "]";
	}

	private int no; // String을 해도 호환이 되기에 무방함
	private String title;
	private String writer;
	private String content;
	private Date wdate;

	// Source -> Generate 사용하여 생성하기
	public BbsVO() {
		super(); // 명시를 하지 않아도 묵시적으로 super()을 호출함
		System.out.println("BbsVO() 생성됨..."); // bean(insert2.jsp)이 기본생성자를 부름
	}

	public BbsVO(int no, String title, String writer, String content, Date wdate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.wdate = wdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
		System.out.println("setTitle() : " + title); // beans로 호출한 파라미터를 찍어보자
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

}
