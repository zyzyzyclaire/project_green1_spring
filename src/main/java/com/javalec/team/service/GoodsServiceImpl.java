package com.javalec.team.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.team.dao.CartDao;
import com.javalec.team.dao.GoodsDao;
import com.javalec.team.dto.GoodsDto;




@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private SqlSession sqlSession;
	//CartDao dao = sqlSession.getMapper(CartDao.class);
	@Override
	public GoodsDto getGoods(HashMap<String, String> param) {
//		System.out.println("GoodsServiceImplΩ√¿€");
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		GoodsDto  dto = dao.getGoods(param);
//		System.out.println("GoodsServiceImpl≥°");
		return  dto;
	}
	
	@Override
	public void insertBuy(HashMap<String, String> param) {
		GoodsDao dao = sqlSession.getMapper(GoodsDao.class);
		dao.insertBuy(param);
		
	}
	

	
}
