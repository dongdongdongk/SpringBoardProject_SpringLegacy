package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardDao {
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
	
}
