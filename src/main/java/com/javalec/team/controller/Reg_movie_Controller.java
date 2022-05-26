package com.javalec.team.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.Reg_movie_Service;

@Controller
public class Reg_movie_Controller {
	@Autowired
	private Reg_movie_Service service;
	
	//0524 관리자 영화 넣기 - 근지
	@RequestMapping("/reg_movie")
	public String reg_movie(Model model) {
		System.out.println("@@@### reg_movie()");
		
		return "reg_movie/reg_movie";
	}
	
	//0524 관리자 영화 db 넣기 - 근지
	@RequestMapping("/reg_movie_insert")
	public String reg_movie_insert(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### reg_movie_insert() start");
		System.out.println("@@@### 영화제목 뷰에서 컨트롤러로 한글깨지니===>"+param.get("m_title"));
        
		service.reg_movie(param);
		
		return "redirect:movie_list";
	}

//	에이젝스 사용 후 필요없게 됨
//	//0525 관리자 영화 리스트 보기 - 근지
//	@RequestMapping("/movie_list")
//	public String movie_list(Model model) {
//		System.out.println("@@@### reg_movie()");
//		
//		ArrayList<MovieDto> list = service.list();
//		model.addAttribute("list", list);
//		
//		return "reg_movie/movie_list";
//	}
	
	
	//0525 관리자 영화 수정 - 근지
	@RequestMapping("/edit")
	public String edit(@RequestParam HashMap<String, String> param, Model model) {
		service.show(param);
		
		MovieDto dto = service.show(param);
		model.addAttribute("dto", dto);
		
		return "reg_movie/edit_movie";	
	}
	
	//0525 관리자 영화 db 수정 - 근지	
	@RequestMapping("/edit_movie")
	public String edit_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.edit_movie(param);
		
		return "redirect:movie_list";	
	}
	
	//0525 관리자 영화 삭제 - 근지
	@RequestMapping(value = "/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.del_movie(param);
		
		return "redirect:movie_list";	
	}
	
	//0526 에이젝스 사용시 첫화면. 기본값은 order by 최신순 - 근지
	@RequestMapping("/movie_list")
	public String movie_list(HttpServletRequest request, Model model) {
		System.out.println("request 값 제대로 나옴??? movie_list ===>"+request.getParameter("kind"));
		
		return "reg_movie/movie_list";
	}	
	
	
	//0526 에이젝스 체크 - 근지
	@RequestMapping("/ajax")
	public String ajax(HttpServletRequest request, Model model) {
		System.out.println("request 값 제대로 나옴??? ajax ===>"+request.getParameter("kind"));
		
		String sort = "";
		
		if (request.getParameter("kind") == null) {	// 처음화면 시작시 null값이라서. 첫화면 컨트롤러 새로 만들어서 그럴 일 없겠지만!
			sort = "m_date desc";
		} else {
			if (request.getParameter("kind").equals("최신순")) {
				sort = "m_date desc";
			} else if (request.getParameter("kind").equals("오래된순")) {
				sort = "m_date";
			} else if (request.getParameter("kind").equals("인기순")) {	// 일단 평점순으로 임시설정
				sort = "m_rate desc";
			}
		}
		
		model.addAttribute("sort", sort);
		
		ArrayList<MovieDto> list_sort = service.list_sort(model);
		model.addAttribute("list_sort", list_sort);
		return "reg_movie/movie_list2";
	}

}
