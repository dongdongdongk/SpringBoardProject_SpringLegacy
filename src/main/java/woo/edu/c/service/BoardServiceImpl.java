package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;
	
	//text 
	@Override
	public List<testVo> test() {
		return boardDao.test();
	}
	//게시판 불러오기
	@Override
	public List<boardVo> getBoardList() {
		return boardDao.getBoardList();
	}
	//게시판 상세
	@Override
	public boardVo getBoardDetail(boardVo boardVo) {
		return boardDao.getBoardDetail(boardVo);
	}
	//게시글 추가
	@Override
	public int setBoardAdd(boardVo boardVo) {
		return boardDao.setBoardAdd(boardVo);
	}
	//게시글 삭제
	@Override
	public int setBoardDelete(boardVo boardVo) {
		return boardDao.setBoardDelete(boardVo);
	}
	//게시글 업데이트
	@Override
	public int setBoardUpdate(boardVo boardVo) {
		return boardDao.setBoardUpdate(boardVo);
	}
	//캘린더 일정추가 
	@Override
	public int setCalendar(CalendarVo calendarVo) {
		return boardDao.setCalendar(calendarVo);
	}
	//캘린더 리스트 출력
	@Override
	public List<CalendarVo> getCalendarList(CalendarVo calendarVo) {
		return boardDao.getCalendarList(calendarVo);
	}
	//캘린더 디테일 리스트 출력
	@Override
	public List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo) {
		return boardDao.getCalendarDetailList(calendarVo);
	}
	
}
