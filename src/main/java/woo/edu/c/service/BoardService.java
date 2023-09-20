package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardService {
	//text
	List<testVo> test();
	//게시판 불러오기
	List<boardVo> getBoardList();
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
}
