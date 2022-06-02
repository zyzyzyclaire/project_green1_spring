package com.javalec.team.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.Reg_movie_Service;

@Controller
public class Reg_movie_Controller {
	@Autowired
	private Reg_movie_Service service;
	
	//0524 ������ ��ȭ �ֱ� - ����
//	@RequestMapping("/reg_movie")
	@RequestMapping("/reg_movie/reg_movie")
	public String reg_movie(Model model) {
		System.out.println("@@@### reg_movie()");
		
		return "reg_movie/reg_movie";
	}
	
	//0524 ������ ��ȭ db �ֱ� - ����
	@RequestMapping("/reg_movie/reg_movie_insert")
	public String reg_movie_insert(MultipartHttpServletRequest mtfRequest ,@RequestParam HashMap<String, String> param, Model model , HttpServletRequest request) {
		List<MultipartFile> m_positionfiles = mtfRequest.getFiles("m_position");
		List<MultipartFile> m_picsfiles = mtfRequest.getFiles("m_pics");
		 //String path = "C:\\test\\"; 

		
		 ServletContext servletContext = request.getSession().getServletContext();
		 String path = servletContext.getRealPath("/");
		 path += "resources\\";
		 System.out.println("path@@@@"+path);
		for (MultipartFile mf : m_positionfiles) {
			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			long fileSize = mf.getSize(); // ���� ������

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			
			String filename = System.currentTimeMillis() + originFileName;
			String safeFile = path +filename;
			
			param.put("m_originimg", originFileName);
			param.put("m_position", filename);
			param.put("m_pics", "");
			
			try {
				mf.transferTo(new File(safeFile));
				service.reg_movie(param);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	    MovieDto movieDto = service.getm_code();
		for (MultipartFile mf : m_picsfiles) {
			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			long fileSize = mf.getSize(); // ���� ������
			param.put("m_code", movieDto.getM_code());
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			
			 
			
			String filename = System.currentTimeMillis() + originFileName;
			String safeFile = path +filename;
			
			param.put("m_originimg", originFileName);
			param.put("m_pics", filename);
			
			try {
				mf.transferTo(new File(safeFile));
				service.reg_movieimg(param);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/*
		 * System.out.println("@@@### reg_movie_insert() start");
		 * System.out.println("@@@### ��ȭ���� �信�� ��Ʈ�ѷ��� �ѱ۱�����?===>"+param.get("m_title"));
		 * System.out.println(param.get("m_pics"));
		 */
		
		
		return "redirect:movie_list";
	}
	

	//�������� ��� �� �ʿ���� �� - �ٽ� �ʿ���
	//0525 ������ ��ȭ ����Ʈ ���� - ����
	@RequestMapping("/reg_movie/movie_list")
	public String movie_list(Model model) {
		System.out.println("@@@### reg_movie()");
		
		ArrayList<MovieDto> list = service.list();
		model.addAttribute("list", list);
		
		return "reg_movie/movie_list";
	}
	
	
	//0525 ������ ��ȭ ���� - ����
	@RequestMapping("/reg_movie/edit")
	public String edit(@RequestParam HashMap<String, String> param, Model model) {
		service.show(param);
		
		MovieDto dto = service.show(param);
		model.addAttribute("dto", dto);
		
		return "reg_movie/edit_movie";	
	}
	
	//0525 ������ ��ȭ db ���� - ����	
//	@RequestMapping("/edit_movie")
	@RequestMapping("/reg_movie/edit_movie")
	public String edit_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.edit_movie(param);
		
		return "redirect:movie_list";	
	}
	
	//0525 ������ ��ȭ ���� - ����
//	@RequestMapping(value = "/del_movie")
	@RequestMapping(value = "/reg_movie/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.del_movie(param);
		
		return "redirect:movie_list";	
	}
	
//	//0526 �������� ���� ùȭ��. �⺻���� order by �ֽż� - ���� - �̰� �ʿ� ������
////	@RequestMapping("/movie_list")
//	@RequestMapping("/reg_movie/movie_list")
//	public String movie_list(HttpServletRequest request, Model model) {
//		System.out.println("request �� ����� ����??? movie_list ===>"+request.getParameter("kind"));
//		
//		return "reg_movie/movie_list";
//	}	
	
	
	//0526 ���� �������� üũ - ����
	/* @RequestMapping("ajax") */
	@RequestMapping("/reg_movie/ajax")
	@ResponseBody
	public ArrayList<MovieDto> ajax(HttpServletRequest request, Model model) {
	
		System.out.println("request �� ����� ����??? ajax ===>"+request.getParameter("kind"));
		
		String sort = "";
		
		
		if (request.getParameter("kind") == null) {	// ó��ȭ�� ���۽� null���̶�. ùȭ�� ��Ʈ�ѷ� ���� ���� �׷� �� ��������
			sort = "m_code desc";
			
		} else {
			
			if (request.getParameter("kind").trim().equals("�ֽż�")) {
				
				sort = "m_code desc";
			} else if (request.getParameter("kind").trim().equals("�����ȼ�")) {
				
				sort = "m_code";
			} else if (request.getParameter("kind").trim().equals("�α��")) {	// �ϴ� ���������� �ӽü���
				
				sort = "m_rate desc";
			}
		}
	
		// ���ļ� dao�� ������ ���� ����
		model.addAttribute("sort", sort);
		ArrayList<MovieDto> list_sort = service.list_sort(model);
		
		for (int i = 0; i < list_sort.size(); i++) {
			String str = String.valueOf(list_sort.get(i).getM_date());
			str = str.substring(0, 10);
			list_sort.get(i).setM_date2(str);
		}
		
		/*
		 * System.out.println(list_sort.get(0).getM_date());
		 * System.out.println(list_sort.get(0).getM_period());
		 */
		
		
		//model.addAttribute("list_sort", list_sort);
		
		return list_sort;
	}
	
	//0531 ��ȭ �˻� - ����
	@RequestMapping("/reg_movie/serch_mov")
	@ResponseBody
	public ArrayList<MovieDto> serch_mov(HttpServletRequest request, Model model) {
		System.out.println("�˻� ����=====>"+request.getParameter("kind").trim());
		
		model.addAttribute("serch_mov",request.getParameter("kind").trim());	
		ArrayList<MovieDto> list_sort = service.serch_mov(model);
		
		for (int i = 0; i < list_sort.size(); i++) {
			String str = String.valueOf(list_sort.get(i).getM_date());
			str = str.substring(0, 10);
			list_sort.get(i).setM_date2(str);
		}
		
		return list_sort;
	}

	
	public void getMove(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("������?@@@@@@@@@@@@@@");
		MovieDto movieDto = service.getMove(param);		
		model.addAttribute("movie",movieDto);
		//return "goods/goodsDisplay";
	}
	

	@RequestMapping("movieDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("������?@@@@@@@@@@@@@@");
		getMove(param,model);
		return "reg_movie/movieDisplay";
	}
}
