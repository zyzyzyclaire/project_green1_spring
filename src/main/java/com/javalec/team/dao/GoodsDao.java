package com.javalec.team.dao;

import java.util.HashMap;

import com.javalec.team.dto.GoodsDto;

public interface GoodsDao {
	public GoodsDto getGoods(HashMap<String, String> param);
	public void insertBuy(HashMap<String, String> param);
}
