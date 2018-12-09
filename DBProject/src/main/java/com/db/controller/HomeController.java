package com.db.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.db.dto.loginVO;
import com.db.service.MemberService;

import etc.REPriceVO;
import etc.departmentsVO;
import etc.real_estateVO;
import etc.real_estate_categoryVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +"Login.jsp");
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView dlogin(Locale local, ModelAndView mv
			,@ModelAttribute("loginVO") loginVO loginvo
			,HttpServletRequest request) throws Exception {
		
		loginVO check = null;
		int type = Integer.parseInt(loginvo.getType());
		logger.info(local +"login.do");
		if (type==1)
			check = service.login(loginvo, 1);
		else if (type==2) 
			{
				System.out.println("로그인 2번 진입");
				
				check = service.login(loginvo, 2);
			}
		else{}
		
		if(check==null){
			logger.info("로그인 실패");
			mv.setViewName("login");
		}
		else if(check != null){
			mv.setViewName("loginpass");
			logger.info("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("id", request.getParameter( "d_id" ));
			session.setAttribute("type", request.getParameter( "type" ));
			session.setMaxInactiveInterval(60*60);
		}
		System.out.println(check);
		return mv;
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +"main.jsp");
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/doctor", method = RequestMethod.GET)
	public ModelAndView doctor(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +"doctor.jsp");
		mv.setViewName("doctor");
		return mv;
	}
	/*
	//@ModelAttribute("departmentsVO") departmentsVO deptvo
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public ModelAndView index(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +" index 진입");
		
		
		mv.setViewName("index");
		mv.addObject("check","index 컨트롤러에서 받아온 문자열입니다.");
		return mv;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView select(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +" select 진입");
		
		List<real_estateVO> vo = service.hwselect();
		mv.setViewName("hw3");
		mv.addObject("vo",vo);
		return mv;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insert(Locale local, ModelAndView mv) throws Exception {
		logger.info(local +" insert 진입");
		List<real_estate_categoryVO> list = service.hwinsselect();
		mv.setViewName("hw4");
		mv.addObject("vo",list);
		return mv;
	}
	@RequestMapping(value = "/voinsert", method = RequestMethod.POST)
	public ModelAndView voinsert(Locale local, ModelAndView mv,
			@ModelAttribute("real_estate_categoryVO") real_estate_categoryVO vo) throws Exception {
		logger.info(local +" insert 진입");
		System.out.println(vo.getTYPE_ID() +" " +vo.getTYPE_NAME());
		int result = service.hwinsert(vo);
		System.out.println("삽입 결과 : "+ result);
		List<real_estate_categoryVO> list = service.hwinsselect();
		mv.setViewName("hw4view");
		mv.addObject("vo",list);
		return mv;
	}
	*/
}
