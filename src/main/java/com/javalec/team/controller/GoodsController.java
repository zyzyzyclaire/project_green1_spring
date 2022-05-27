package com.javalec.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dto.CartDto;
import com.javalec.team.dto.GoodsDto;
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
	
	
	
	public void getGoods(@RequestParam HashMap<String, String> param, Model model) {
		GoodsDto goodsdto = goodsService.getGoods(param);		
		model.addAttribute("goods",goodsdto);
	}
	
	@RequestMapping("/mainview")
	public String mainview(HttpServletRequest request) {
		return "mainview";
	}
	
	@RequestMapping("goodsDisplay")
	public String goodsDisplay(@RequestParam HashMap<String, String> param,Model model) {
		//System.out.println("들어오냐?@@@@@@@@@@@@@@");
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
			return "mainview";
		}
		
		if(cart_listc_code == null) {
			int price = Integer.parseInt(param.get("g_price"))*Integer.parseInt(param.get("c_amount"));
			param.put("g_price", Integer.toString(price));
			goodsService.insertBuy(param);
		}
		return "mainview";	
	}
	
	

}
