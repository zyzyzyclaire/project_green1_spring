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
	
	//0524 ������ ��ȭ �ֱ� - ����
	@RequestMapping("/reg_movie")
	public String reg_movie(Model model) {
		System.out.println("@@@### reg_movie()");
		
		return "reg_movie/reg_movie";
	}
	
	//0524 ������ ��ȭ db �ֱ� - ����
	@RequestMapping("/reg_movie_insert")
	public String reg_movie_insert(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### reg_movie_insert() start");
		System.out.println("@@@### ��ȭ���� �信�� ��Ʈ�ѷ��� �ѱ۱�����?===>"+param.get("m_title"));

		
		service.reg_movie(param);
		
		//0530 ��� ���� ��ȭ �ڵ� �� �󿵿� �ֱ� ���� - ����
		MovieDto dto = service.getMax_m_code();
		String max = dto.getM_code();
		param.put("m_code", max);
//		System.out.println("m_code �ƽ���========>"+max);
		
		//0530 ��ȭ �߰��� �� �� ����(1~4)���� �ֱ� - ����
		int ran = (int)(Math.random()*4)+1;
		for (int i = 0; i < ran; i++) {
			param.put("h_num", (int)(Math.random()*4)+1+"");
			service.screen(param);
		}
		
		
		
		return "redirect:movie_list";
	}

	//�������� ��� �� �ʿ���� �� - �ٽ� �ʿ���
	//0525 ������ ��ȭ ����Ʈ ���� - ����
	@RequestMapping("/movie_list")
	public String movie_list(Model model) {
		System.out.println("@@@### reg_movie()");
		
		ArrayList<MovieDto> list = service.list();
		model.addAttribute("list", list);
		
		return "reg_movie/movie_list";
	}
	
	
	//0525 ������ ��ȭ ���� - ����
	@RequestMapping("/edit")
	public String edit(@RequestParam HashMap<String, String> param, Model model) {
		service.show(param);
		
		MovieDto dto = service.show(param);
		model.addAttribute("dto", dto);
		
		return "reg_movie/edit_movie";	
	}
	
	//0525 ������ ��ȭ db ���� - ����	
	@RequestMapping("/edit_movie")
	public String edit_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.edit_movie(param);
		
		return "redirect:movie_list";	
	}
	
	//0525 ������ ��ȭ ���� - ����
	@RequestMapping(value = "/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.del_movie(param);
		
		return "redirect:movie_list";	
	}
	
//	//0526 �������� ���� ùȭ��. �⺻���� order by �ֽż� - ���� - �̰� �ʿ� ������
//	@RequestMapping("/movie_list")
//	public String movie_list(HttpServletRequest request, Model model) {
//		System.out.println("request �� ����� ����??? movie_list ===>"+request.getParameter("kind"));
//		
//		return "reg_movie/movie_list";
//	}	
	
	
	//0526 ���� �������� üũ - ����
	@RequestMapping("/ajax")
	public String ajax(HttpServletRequest request, Model model) {
		System.out.println("request �� ����� ����??? ajax ===>"+request.getParameter("kind"));
		
		String sort = "";
		
		if (request.getParameter("kind") == null) {	// ó��ȭ�� ���۽� null���̶�. ùȭ�� ��Ʈ�ѷ� ���� ���� �׷� �� ��������!
			sort = "m_date desc";
		} else {
			if (request.getParameter("kind").equals("�ֽż�")) {
				sort = "m_date desc";
			} else if (request.getParameter("kind").equals("�����ȼ�")) {
				sort = "m_date";
			} else if (request.getParameter("kind").equals("�α��")) {	// �ϴ� ���������� �ӽü���
				sort = "m_rate desc";
			}
		}
		
		// ���ļ� dao�� ������ ���� ����
		model.addAttribute("sort", sort);
		
		ArrayList<MovieDto> list_sort = service.list_sort(model);
		model.addAttribute("list_sort", list_sort);
		return "reg_movie/movie_list2";
	}
	
	//0531 ��ȭ �˻� - ����
	@RequestMapping("/serch_mov")
	public String serch_mov(HttpServletRequest request, Model model) {
		System.out.println("�˻� ����=====>"+request.getParameter("serch_mov"));
		
		model.addAttribute("serch_mov",request.getParameter("serch_mov"));
		
		ArrayList<MovieDto> serched_mov = service.serch_mov(model);
		model.addAttribute("list", serched_mov);
		
		return "reg_movie/movie_list";
	}

}
