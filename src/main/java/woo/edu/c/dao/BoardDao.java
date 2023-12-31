package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.utill.Pager;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardDao {
	//text 
	List<testVo> test();
	//게시판 불러오기
	List<boardVo> getBoardList(Pager pager);
	//게시판 상세
	boardVo getBoardDetail(boardVo boardVo);
	//게시글 추가
	int setBoardAdd (boardVo boardVo);
	//게시글 삭제
	int setBoardDelete(boardVo boardVo);
	//게시글 업데이트
	int setBoardUpdate(boardVo boardVo);
	
	//캘린더 일정 추가 
	int setCalendar(CalendarVo calendarVo);
	
	//캘린더 리스트 출력
	List<CalendarVo> getCalendarList(CalendarVo calendarVo);
	//캘린더 디테일 리스트 출력
	List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo);
	
	//캘린더 스케줄 삭제
	int setCalendarDelete(CalendarVo calendarVo);
	
	//페이저 총 카운트
	Long getTotalCount(Pager pager);
}
