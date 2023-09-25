package woo.edu.c.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import woo.edu.c.service.BoardService;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	
	// 硫붿씤 �솕硫�
	@RequestMapping(value = "/board/home")
	public String home(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("/board/home");
		return "/board/boardhome";
	}
	
	// 게시글 리스트
	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {
		logger.info("/board/list");
		List<boardVo> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "/board/boardList";
	}
	
		
	//게시글 상세
	@RequestMapping(value = "/board/boardDetail", method = RequestMethod.GET)
	public ModelAndView getBoardDetail(boardVo boardVo) throws Exception {
		logger.info("/board/detail");
		ModelAndView mv = new ModelAndView();
		boardVo boardDetail = boardService.getBoardDetail(boardVo);
		mv.setViewName("board/boardDetail");
		mv.addObject("detail",boardDetail);
		return mv;
	}
	
	//게시글 추가
	@RequestMapping(value = "/board/boardAdd", method = RequestMethod.GET)
	public ModelAndView getBoardAdd(boardVo boardVo) throws Exception {
		logger.info("/board/Add");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardAdd");
		return mv;
	}
	
	@RequestMapping(value = "/board/boardAdd", method = RequestMethod.POST)
	public ModelAndView setBoardAdd(boardVo boardVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardAdd(boardVo);
		mv.setViewName("redirect:../board/boardList");
		return mv;
	}
		
	//게시글 삭제
	@RequestMapping(value = "/board/boardDelete",method = RequestMethod.GET)
	public ModelAndView setBoardDelete(boardVo boardVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardDelete(boardVo);
		mv.setViewName("redirect:../board/boardList");
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.GET)
	public ModelAndView getBoardUpdate(boardVo boardVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardVo boardDetail = boardService.getBoardDetail(boardVo);
		mv.addObject("detail",boardDetail);
		mv.setViewName("/board/boardUpdate");
		return mv;
	}
	
	
	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.POST)
	public ModelAndView setBoardUpdate(boardVo boardVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardUpdate(boardVo);
		mv.setViewName("redirect:../board/boardList");
		return mv;
	}
	
	
	
	
	
	//Ajax 게시판 이동
	@RequestMapping(value = "/board/boardAjax", method = RequestMethod.GET)
	public String AjaxBoardAjax(Model model) throws Exception {
		logger.info("/board/AjaxList");
		List<boardVo> ajaxBoardList = boardService.getBoardList();
		model.addAttribute("ajaxBoardList", ajaxBoardList);
		return "/board/boardAjax";
	}
	//Ajax 리스트 출력
	@RequestMapping(value = "/board/boardAjaxList", method = RequestMethod.GET)
	@ResponseBody
	public List<boardVo> AjaxBoardList(Model model) throws Exception {
		logger.info("/board/AjaxList");
		List<boardVo> ajaxBoardList = boardService.getBoardList();
		model.addAttribute("ajaxBoardList", ajaxBoardList);
		return ajaxBoardList;
	}
	
	//Ajax 게시글 추가
	@RequestMapping(value = "/board/AjaxBoardAdd", method = RequestMethod.GET)
	public ModelAndView getAjaxBoardAdd(boardVo boardVo) throws Exception {
		logger.info("/board/AjaxAdd");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/ajaxBoardAdd");
		return mv;
	}
	
	@RequestMapping(value ="/board/boardAjaxAdd", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView setAjaxBoardAdd(boardVo boardVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardAdd(boardVo);
		mv.setViewName("/board/boardAjax");
		return mv;
	}
	
	//Ajax 게시글 상세
	@RequestMapping(value = "/board/AjaxBoardDetail", method = RequestMethod.GET)
	public ModelAndView getAjaxBoardDetail(boardVo boardVo) throws Exception {
		logger.info("/board/AjaxDetail");
		ModelAndView mv = new ModelAndView();
		boardVo boardDetail = boardService.getBoardDetail(boardVo);
		mv.setViewName("board/ajaxBoardDetail");
		mv.addObject("detail",boardDetail);
		return mv;
	}
	
	//BoardMath 이동
	@RequestMapping(value = "/board/boardMath", method = RequestMethod.GET)
	public ModelAndView getBoardMath() throws Exception {
		logger.info("BoardMath이동");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardMath");
		return mv;
		
	}
	//계산기 이동
	@RequestMapping(value = "/board/calculator", method = RequestMethod.GET)
	public ModelAndView getCalculator() throws Exception {
		logger.info("calculator이동");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/calculator");
		return mv;
		
	}
	//캘린더
	@RequestMapping(value = "/board/calendar", method = RequestMethod.GET)
	public ModelAndView getCalendar(CalendarVo calendarVo) throws Exception {
		logger.info("calendar이동");
		ModelAndView mv = new ModelAndView();
		List<CalendarVo> calendarList = boardService.getCalendarList(calendarVo);
		mv.addObject("calendarList", calendarList);
		mv.setViewName("board/calendar");
		return mv;
		
	}
	
	//캘린더 일정추가 
	@ResponseBody
	@RequestMapping(value = "/board/setCalendar", method = RequestMethod.POST)
	public String setCalendar(@RequestBody CalendarVo calendarVo) throws Exception {
		logger.info("/board/setCalendar");
		String message = null;
		int result = boardService.setCalendar(calendarVo);
		if(result==1) {
       		 message = "success";
    	}else {
       		 message ="fail";
		}
		return message;
	}
	
	//캘린더 디테일 가져오기 
	@RequestMapping(value = "/board/CalendarDetail", method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarVo> getCalendarDetailList(CalendarVo calendarVo) throws Exception {
	    logger.info("calendarList");
	    List<CalendarVo> calDetailList = boardService.getCalendarDetailList(calendarVo);
	    return calDetailList;
	}
	
	//캘린더 데이터 리스트 가져오기 
	@ResponseBody
	@RequestMapping(value = "/board/CalendarListData", method = RequestMethod.GET)
	public List<CalendarVo> getCalendarListDate(CalendarVo calendarVo) throws Exception {
		logger.info("calendarListData");
		List<CalendarVo> calendarVos = boardService.getCalendarList(calendarVo);
		return calendarVos;
	}
	
	//캘린더 스케줄 삭제
	@RequestMapping(value = "/board/CalendarDelete",method = RequestMethod.POST)
	public ModelAndView setCalendarDelete(CalendarVo calendarVo) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = boardService.setCalendarDelete(calendarVo);
		return mv;
	}
	
	@RequestMapping(value = "/board/getCurrentMonthYear", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> getCurrentMonthYear() {
	    Map<String, Integer> result = new HashMap<String, Integer>();
	    Calendar cal = Calendar.getInstance();
	    result.put("year", cal.get(Calendar.YEAR));
	    result.put("month", cal.get(Calendar.MONTH) + 1); // 월은 0부터 시작하므로 1을 더해줍니다.
	    return result;
	}

	//검색 게시판
	@RequestMapping(value = "/board/searchBoard", method = RequestMethod.GET)
	public ModelAndView getSearchBoard() throws Exception {
		logger.info("searchBoard이동");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/searchBoard");
		return mv;
		
	}

}




