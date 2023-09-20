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
	//�Խ��� �ҷ�����
	@Override
	public List<boardVo> getBoardList() {
		return boardDao.getBoardList();
	}
	//�Խ��� ��
	@Override
	public boardVo getBoardDetail(boardVo boardVo) {
		return boardDao.getBoardDetail(boardVo);
	}
	//�Խñ� �߰�
	@Override
	public int setBoardAdd(boardVo boardVo) {
		return boardDao.setBoardAdd(boardVo);
	}
	//�Խñ� ����
	@Override
	public int setBoardDelete(boardVo boardVo) {
		return boardDao.setBoardDelete(boardVo);
	}
	//�Խñ� ������Ʈ
	@Override
	public int setBoardUpdate(boardVo boardVo) {
		return boardDao.setBoardUpdate(boardVo);
	}
	//Ķ���� �����߰� 
	@Override
	public int setCalendar(CalendarVo calendarVo) {
		return boardDao.setCalendar(calendarVo);
	}
	//Ķ���� ����Ʈ ���
	@Override
	public List<CalendarVo> getCalendarList(CalendarVo calendarVo) {
		return boardDao.getCalendarList(calendarVo);
	}
	//Ķ���� ������ ����Ʈ ���
	@Override
	public List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo) {
		return boardDao.getCalendarDetailList(calendarVo);
	}
	
}
