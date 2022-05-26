package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javalec.team.dao.Reg_movie_Dao;
import com.javalec.team.dto.MovieDto;


@Service("Reg_movie_Service")
public class Reg_movie_Service_impl implements Reg_movie_Service {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg_movie(HashMap<String, String> param) {
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		dao.reg_movie(param);
	}

	@Override
	public ArrayList<MovieDto> list() {
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		ArrayList<MovieDto> list = dao.list();
		
		return list;

	}

	@Override
	public void edit_movie(HashMap<String, String> param) {
		System.out.println("@@@### ���񽺴� edit �̱����� ������....?");
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		dao.edit_movie(param);
		
	}

	@Override
	public void del_movie(HashMap<String, String> param) {
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		dao.del_movie(param);
		
	}

	@Override
	public MovieDto show(HashMap<String, String> param) {
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		MovieDto show = dao.show(param);
		
		return show;
	}

	@Override
	public ArrayList<MovieDto> list_sort(Model model) {
		Reg_movie_Dao dao = sqlSession.getMapper(Reg_movie_Dao.class);
		ArrayList<MovieDto> list_sort = dao.list_sort(model);
		
		return list_sort;
	}
	
}