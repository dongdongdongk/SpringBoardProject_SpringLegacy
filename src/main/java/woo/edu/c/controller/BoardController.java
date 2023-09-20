package woo.edu.c.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value = "/board/setCalendar", method = RequestMethod.POST)
	public ModelAndView setCalendar(CalendarVo calendarVo) throws Exception {
		logger.info("/board/setCalendar");
		ModelAndView mv = new ModelAndView();
		int result = boardService.setCalendar(calendarVo);
		mv.setViewName("/board/calendar");
		return mv;
	}
	
	//캘린더 디테일 가져오기 
	@ResponseBody
	@RequestMapping(value = "/board/CalendarDetail", method = RequestMethod.POST)
	public ModelAndView getCalendarDetailList(CalendarVo calendarVo) throws Exception {
		logger.info("calendarList");
		ModelAndView mv = new ModelAndView();
		List<CalendarVo> calDetailList = boardService.getCalendarDetailList(calendarVo);
		mv.addObject("calDetailList",calDetailList);
		mv.setViewName("board/calendar");
		return mv;
	}
}




