package com.javalec.team.service;

import java.util.HashMap;

import com.javalec.team.dto.GoodsDto;

public interface GoodsService {
	public GoodsDto getGoods(HashMap<String, String> param);
	public void insertBuy(HashMap<String, String> param);
}
