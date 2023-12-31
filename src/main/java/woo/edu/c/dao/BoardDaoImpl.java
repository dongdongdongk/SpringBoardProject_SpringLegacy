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
	//? ???? ?? ? ???λ€μ? ??? ??
	@Override
	public List<boardVo> getBoardList(Pager pager) {
		return sql.selectList(namespace + ".getBoardList",pager);
	}
	@Override
	public Long getTotalCount(Pager pager) {
		return sql.selectOne(namespace + ".getTotalCount",pager);
	}
	
	//? ???? ?? ? ??
	@Override
	public boardVo getBoardDetail(boardVo boardVo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardDetail",boardVo);
	}
	//? ??κΉμ ? ?©κ³€μ
	@Override
	public int setBoardAdd(boardVo boardVo) {
		return sql.insert(namespace + ".setBoardAdd",boardVo);
	}
	//? ??κΉμ ? ??? ??
	@Override
	public int setBoardDelete(boardVo boardVo) {
		return sql.delete(namespace + ".setBoardDelete",boardVo);
	}
	//? ??κΉμ ? ??? ??? ???Έ
	@Override
	public int setBoardUpdate(boardVo boardVo) {
		return sql.update(namespace + ".setBoardUpdate", boardVo);
	}
	//μΊε ??? ?? ? ??? ??? ?©κ³€μ 
	@Override
	public int setCalendar(CalendarVo calendarVo) {
		return sql.insert(namespace + ".setCalendar", calendarVo);
	}
	//μΊε ??? ?? ? ??? ???Έ ? ??? οΏ?
	@Override
	public List<CalendarVo> getCalendarList(CalendarVo calendarVo) {
		return sql.selectList(namespace + ".getCalendarList",calendarVo);
	}
	//μΊε ??? ?? ? ??? ??? ?? ? ??? ???Έ ? ??? οΏ?
	@Override
	public List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo) {
		return sql.selectList(namespace + ".getCalendarDetailList",calendarVo);
	}
	//μΊε ??? ?? ? ??? ??? ?? ? ??? ??
	@Override
	public int setCalendarDelete(CalendarVo calendarVo) {
		return sql.delete(namespace + ".setCalendarDelete",calendarVo);
	}
}
