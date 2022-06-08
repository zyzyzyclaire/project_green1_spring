package com.javalec.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javalec.team.dto.CartDto;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.service.CartService;
import com.javalec.team.service.GoodsService;




@Controller
public class GoodsController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CartController cartController;
	

	
	@RequestMapping(value = "addGoods", method = RequestMethod.GET)
	public String upload2(Locale locale, Model model) {
		
		return "goods/addGoods";
	}
	
	@RequestMapping(value = "goodsList", method = RequestMethod.GET)
	public String goodsList(Locale locale, Model model) {
		
		return "goods/goodsList";
	}

	@RequestMapping(value = "/upload")
	public String requestupload2(MultipartHttpServletRequest mtfRequest, HttpServletRequest request ,@RequestParam HashMap<String, String> param) throws IllegalStateException, IOException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		System.out.println("src value : " + param.get("g_name"));
		System.out.println("src value : " + param.get("g_price"));

		//String path = "C:\\test\\";
		 ServletContext servletContext = request.getSession().getServletContext();
		 String path = servletContext.getRealPath("/");
		 path += "resources\\";
		 System.out.println("path@@@@"+path);
		GoodsDto dto = goodsService.getGoodsGcode();	
		int g_code = dto.getG_code();			
		param.put("g_code", Integer.toString(g_code));
		int count = 0;
		
		for (MultipartFile mf : fileList) {
			count ++;
			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			long fileSize = mf.getSize(); // ���� ������

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			
			String filename = System.currentTimeMillis() + originFileName;
			String safeFile = path +filename;
			
			param.put("img_origin", originFileName);
			
			if(count == 1) {
				mf.transferTo(new File(safeFile));
				param.put("img_1", filename);
				goodsService.insertGoods(param);
			
			}else {
				mf.transferTo(new File(safeFile));
				
				param.put("img_2", filename);
				
					goodsService.insertGoodsImg(param);
			}
			
		}

		return "goods/goodsList";
	}
	
	

	
	
	
	
	@RequestMapping("goodsajax")
	@ResponseBody
	public ArrayList<GoodsDto> ajax(@RequestParam HashMap<String, String> param, Model model) {
	
		System.out.println("request �� ����� ����??? ajax ===>"+param.get("kind"));
		
		String sort = "";
		
		
		if (param.get("kind").trim() == null) {	// ó��ȭ�� ���۽� null���̶�. ùȭ�� ��Ʈ�ѷ� ���� ���� �׷� �� ��������!
			sort = "g_code desc";
			
		} else {
			
			if (param.get("kind").trim().equals("�ֽż�")) {
				System.out.println("ddd");
				sort = "g_code desc";
			} else if (param.get("kind").trim().equals("�����ȼ�")) {
				
				sort = "g_code";
			}
		}
	
		// ���ļ� dao�� ������ ���� ����
		param.put("sort", sort);
		ArrayList<GoodsDto> list_sort = goodsService.list_sort(param);
		
		
		 System.out.println(list_sort.get(0).getG_code());
		 System.out.println(list_sort.get(0).getG_name());
		 
		
		
		//model.addAttribute("list_sort", list_sort);
		return list_sort;
	}
	
	
	
	
	
	public void getGoods(@RequestParam HashMap<String, String> param, Model model) {
		GoodsDto goodsdto = goodsService.getGoods(param);		
		model.addAttribute("goods",goodsdto);
	}
	

	
	@RequestMapping("goodsDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("������?@@@@@@@@@@@@@@");
		getGoods(param,model);
		return "goods/goodsDisplay";
	}
	
	
	@RequestMapping("/buy")
	public String buy(@RequestParam HashMap<String, String> param,HttpServletRequest request,Model model) {
		String[] cart_listc_code = null;
		
		if(request.getParameterValues("cart_listc_code") != null) {
			ArrayList<CartDto> cartlist = new ArrayList<CartDto>();
			cart_listc_code = request.getParameterValues("cart_listc_code");
			ArrayList<CartDto> buylist = cartController.cartlistbuy(cart_listc_code);
			for (int i = 0; i < cart_listc_code.length; i++) {
				int price = buylist.get(i).getG_price()*buylist.get(i).getC_amount();
				buylist.get(i).setG_price(price);
				param.put("c_code", cart_listc_code[i]);
				param.put("g_code",Integer.toString( buylist.get(i).getC_amount()));
				param.put("c_amount", Integer.toString(buylist.get(i).getC_amount()));
				param.put("g_price", Integer.toString(price));
				//System.out.println(param.get("c_code"));
				cartController.deleteCart(param, null);
				goodsService.insertBuy(param);
			}
			model.addAttribute("cartlist",buylist);
			return "main/index";
		}
		
	
		
		
		if(cart_listc_code == null) {
			int price = Integer.parseInt(param.get("g_price"))*Integer.parseInt(param.get("c_amount"));
			param.put("g_price", Integer.toString(price));
		
			goodsService.insertBuy(param);
		}
		return "main/index";	
	}
	
	
	
	
	
	
	

}
