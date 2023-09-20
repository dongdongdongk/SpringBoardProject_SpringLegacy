package woo.edu.c.vo;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class CalendarVo {
	private Long calNo;
	private String calYear;
	private String calMonth;
	private String calDay;
	private String calTime;
	private String calReq;
	private String calContents;

	public String getCalTime() {
		return calTime;
	}
	public void setCalTime(String calTime) {
		this.calTime = calTime;
	}
	public Long getCalNo() {
		return calNo;
	}
	public void setCalNo(Long calNo) {
		this.calNo = calNo;
	}
	public String getCalYear() {
		return calYear;
	}
	public void setCalYear(String calYear) {
		this.calYear = calYear;
	}
	public String getCalMonth() {
		return calMonth;
	}
	public void setCalMonth(String calMonth) {
		this.calMonth = calMonth;
	}
	public String getCalDay() {
		return calDay;
	}
	public void setCalDay(String calDay) {
		this.calDay = calDay;
	}

	public String getCalReq() {
		return calReq;
	}
	public void setCalReq(String calReq) {
		this.calReq = calReq;
	}
	public String getCalContents() {
		return calContents;
	}
	public void setCalContents(String calContents) {
		this.calContents = calContents;
	}
	
}
