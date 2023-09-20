package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardService {
	//text
	List<testVo> test();
	//�Խ��� �ҷ�����
	List<boardVo> getBoardList();
	//�Խ��� ��
	boardVo getBoardDetail(boardVo boardVo);
	//�Խñ� �߰�
	int setBoardAdd (boardVo boardVo);
	//�Խñ� ����
	int setBoardDelete(boardVo boardVo);
	//�Խñ� ������Ʈ
	int setBoardUpdate(boardVo boardVo);
	//Ķ���� ���� �߰� 
	int setCalendar(CalendarVo calendarVo);
}
