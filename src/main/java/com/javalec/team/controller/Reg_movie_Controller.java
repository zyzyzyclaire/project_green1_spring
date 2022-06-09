package com.javalec.team.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.team.dto.GoodsDto;
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
	
	public void getMove(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("������?@@@@@@@@@@@@@@");
		MovieDto movieDto = service.getMove(param);		
		model.addAttribute("movie",movieDto);
		ArrayList<MovieDto> dtoList =service.getStillCut(param);
		model.addAttribute("dtoList",dtoList);
	}

	@RequestMapping("/movieDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		getMove(param,model);
		return "reg_movie/movieDisplay";
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
		public String edit_movie(MultipartHttpServletRequest mtfRequest ,@RequestParam HashMap<String, String> param, Model model, HttpServletRequest request) {
			
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
						service.edit_movie(param);
						
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
						service.edit_movieimg(param);
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			
//			service.edit_movie(param);
			return "redirect:movie_list";	
		}
		

	//0525 ������ ��ȭ ���� - ����
	@RequestMapping(value = "/del_movie")
	public String del_movie(@RequestParam HashMap<String, String> param, Model model) {
		service.del_movie(param);
		return "redirect:movie_list";	
	}
	
	//0526 �������� ���� ùȭ��. �⺻���� order by �ֽż� - ���� - �̰� �ʿ� ������
@RequestMapping("/movie_list")
//@RequestMapping("/reg_movie/movie_list")
public String movie_list(HttpServletRequest request, Model model) {
	System.out.println("request �� ����� ����??? movie_list ===>"+request.getParameter("kind"));
	ArrayList<MovieDto> list = service.list();
	model.addAttribute("list", list);
	return "reg_movie/movie_list";
}

	@RequestMapping("/ajax")
	@ResponseBody
	public ArrayList<MovieDto> ajax(HttpServletRequest request, Model model) {
		String sort = "";
		if (request.getParameter("kind") == null) {	// ó��ȭ�� ���۽� null���̶�. ùȭ�� ��Ʈ�ѷ� ���� ���� �׷� �� ��������!
			sort = "m_date desc";
		} else {
			if (request.getParameter("kind").trim().equals("�ֽż�")) {
				sort = "m_date desc";
			} else if (request.getParameter("kind").trim().equals("�����ȼ�")) {
				sort = "m_date";
			} else if (request.getParameter("kind").trim().equals("�α��")) {
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
		return list_sort;
	}

	//0524 ������ ��ȭ db �ֱ� - ����
	@RequestMapping("/reg_movie_insert")
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
			MovieDto movieDto = service.getm_code();
			int m_code = Integer.parseInt(movieDto.getM_code()) + 1;

			param.put("m_originimg", originFileName);
			param.put("m_position", filename);
			param.put("m_pics", "");
			param.put("m_code", m_code+"");
			
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
		
		for (MultipartFile mf : m_picsfiles) {
			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			long fileSize = mf.getSize(); // ���� ������
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
		return "redirect:main_movie_list";
	}
	
	//0531 ��ȭ �˻� - ����
		@RequestMapping("/serch_mov")
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
}
