package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.utill.Pager;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	private static String namespace = "woo.edu.c.dao.BoardDao";
	//text 
	@Override
	public List<testVo> test() {
		return sql.selectList(namespace + ".test");
	}
	//占쌉쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙
	@Override
	public List<boardVo> getBoardList(Pager pager) {
		return sql.selectList(namespace + ".getBoardList",pager);
	}
	//占쌉쏙옙占쏙옙 占쏙옙
	@Override
	public boardVo getBoardDetail(boardVo boardVo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardDetail",boardVo);
	}
	//占쌉시깍옙 占쌩곤옙
	@Override
	public int setBoardAdd(boardVo boardVo) {
		return sql.insert(namespace + ".setBoardAdd",boardVo);
	}
	//占쌉시깍옙 占쏙옙占쏙옙
	@Override
	public int setBoardDelete(boardVo boardVo) {
		return sql.delete(namespace + ".setBoardDelete",boardVo);
	}
	//占쌉시깍옙 占쏙옙占쏙옙占쏙옙트
	@Override
	public int setBoardUpdate(boardVo boardVo) {
		return sql.update(namespace + ".setBoardUpdate", boardVo);
	}
	//캘占쏙옙占쏙옙 占쏙옙占쏙옙占쌩곤옙 
	@Override
	public int setCalendar(CalendarVo calendarVo) {
		return sql.insert(namespace + ".setCalendar", calendarVo);
	}
	//캘占쏙옙占쏙옙 占쏙옙占쏙옙트 占쏙옙占�
	@Override
	public List<CalendarVo> getCalendarList(CalendarVo calendarVo) {
		return sql.selectList(namespace + ".getCalendarList",calendarVo);
	}
	//캘占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙트 占쏙옙占�
	@Override
	public List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo) {
		return sql.selectList(namespace + ".getCalendarDetailList",calendarVo);
	}
	//캘占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@Override
	public int setCalendarDelete(CalendarVo calendarVo) {
		return sql.delete(namespace + ".setCalendarDelete",calendarVo);
	}
	@Override
	public Long getTotalCount(Pager pager) {
		return sql.selectOne(namespace + ".getTotalCount",pager);
	}
	
}
