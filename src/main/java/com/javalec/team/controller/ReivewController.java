package com.javalec.team.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.pageMakerDto;
import com.javalec.team.service.ReviewService;

@Controller
public class ReivewController {

	@Autowired
	HttpSession session;
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping("review/list")
	public String list(Model model, Criteria cri) {
		System.out.println("@@@### ReivewController list() start");
		
		model.addAttribute("list", service.list(cri));
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### ReivewController list() end");
		
		return "/review/list";
	}
	
	@RequestMapping("/write_view") //�����ؾ��ҵ� �������������� �Ѿ�´�
	public String write_view() {
		System.out.println("@@@### write_view()");
		
		return "redirect:write";
	}
	
	@RequestMapping("/review/write")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController write() start");
		
		service.write(param);
		
		ReviewDto dto = service.getMcode(param); //���� ���̺��� ��ȭ �ڵ� ������
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_code", Integer.toString(dto.getM_code())); //��ȭ�ڵ� map�� ����
		ReviewDto rateDto = service.getRateAvg(map);  //��ȭ�ڵ� �������� �ش翵ȭ�� ���� ��ճ�
		map.put("r_rate", Integer.toString(rateDto.getR_rate())); //���� map�� ����
		
		service.insertRate(map); //��ȭ ���̺� ���� ������Ʈ��
		
		System.out.println("@@@### ReivewController write() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/review/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### ReivewController delete() end");
		
		return "redirect:list";
	}
	
	@RequestMapping("/review/modify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		ReviewDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/review/modify";
	}
	
	@RequestMapping(value = "/review/modify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### ReivewController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### ReivewController modify() end");
		
		return "redirect:list";
	}
}
