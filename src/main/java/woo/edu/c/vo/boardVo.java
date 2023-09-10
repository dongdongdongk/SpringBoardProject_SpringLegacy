package woo.edu.c.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class boardVo {
	private Long num;
	private String title;
	private String contents;
	private String writer;
	private Timestamp writeDay; 
	
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(Timestamp writeDay) {
		this.writeDay = writeDay;
	}
}
