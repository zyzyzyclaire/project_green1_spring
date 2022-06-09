package com.javalec.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.team.dto.FaqDto;
import com.javalec.team.dto.GoodsDto;
import com.javalec.team.dto.NoticeDto;
import com.javalec.team.dto.QnaDto;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.UserDto;
import com.javalec.team.service.MailSendService;
import com.javalec.team.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping("login")
	public String login() {
		System.out.println("@@@### login()");
		
		return "user/login";
	}
	@RequestMapping("userPage")
	public String userpage(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println(param.get("u_id"));
		/* ArrayList<ReviewDto> myReviewList = service.getMyReviewList(param); */
		ArrayList<FaqDto> myFaqList =  service.getMyFaqList(param);
		ArrayList<NoticeDto> myNotice_tList = service.getMyNotice_tList(param);
		ArrayList<QnaDto> myQnaList = service.getMyQnaList(param);
		ArrayList<GoodsDto> mygoodsList = service.getMygoodsList(param);
		/* model.addAttribute("myReviewList",myReviewList); */
		model.addAttribute("myFaqList",myFaqList);
		model.addAttribute("myNotice_tList",myNotice_tList);
		model.addAttribute("myQnaList",myQnaList);
		model.addAttribute("mygoodsList",mygoodsList);
		return "user/userPage";
	}
	
	@RequestMapping("login_yn")
	public String login_yn(@RequestParam HashMap<String, String> param, Model model, HttpServletResponse response) throws IOException {
		ArrayList<UserDto> dtos = service.loginYn(param);
		model.addAttribute("dtos", dtos);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		if (dtos.isEmpty()) {
			out.println("<script>alert('鈺곕똻�삺占쎈릭筌욑옙 占쎈륫占쎈뮉 占쎌돳占쎌뜚占쎌뿯占쎈빍占쎈뼄.'); self.close();</script>");
			out.flush();
			return "user/login";
		} else {
			if (param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
				session.setAttribute("u_id", param.get("u_id"));
				session.setAttribute("u_auth", dtos.get(0).getU_auth());
				System.out.println(param.get("u_id"));
				System.out.println(dtos.get(0).getU_auth());
				return "redirect:/";
			} else {
				out.println("<script>alert('占쎈툡占쎌뵠占쎈탵 占쎌굢占쎈뮉 �뜮袁⑨옙甕곕뜇�깈揶쏉옙 占쎈뼄�뵳�굝�빍占쎈뼄.'); self.close();</script>");
				out.flush();
				return "user/login";
			}
		}
		
	}
	
	
	@RequestMapping("register")
	public String register() {
			
		return "/user/register";
	}
	
	@RequestMapping("registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
//		System.out.println("@@@### userController.registerOk() start");
		
		UserDto dto =  service.confirmUserId(param);
		
		if (dto != null) {
			return "user/register";
		} else {
			try {
				service.write(param);
				return "redirect:login";
			} catch (Exception e) {
				return "user/register";
			}
		}
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam HashMap<String, String> param) throws IOException {
		
		UserDto result =  service.checkId(param);
		int check = result.getUidcheck();
		
		
		if(check != 0) {
			return "fail";	// 餓λ쵎�궗 占쎈툡占쎌뵠占쎈탵揶쏉옙 鈺곕똻�삺
		} else {
			return "success";	// 餓λ쵎�궗 占쎈툡占쎌뵠占쎈탵 x
		}	
	}
	
	@RequestMapping("editUser")
	public String editUser(@RequestParam HashMap<String, String> param, Model model) {
		UserDto dto =  service.confirmUserId(param);
		model.addAttribute("dto",dto);
		
		return "/user/editUser";
	}
	
	@RequestMapping("editUserOk")
	public String editUserOk(@RequestParam HashMap<String, String> param, Model model, HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
			try {
				service.editUser(param);
				out.println("<script>alert('정보가 수정되었습니다.'); location.href='login';</script>");
				out.flush();
				return "redirect:index";
			} catch (Exception e) {
				return "/user/editUser";
			}
		
	}
	
	//占쎌뵠筌롫뗄�뵬 占쎌뵥筌앾옙
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	
	@RequestMapping(value = "delete")
	public void delete(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		service.outUser(param);
	}
	
	@RequestMapping("findId")
	public String findId() {
		
		return "user/findId";
	}
	
	@RequestMapping("findIdOk")
	public void findIdOk(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		
		UserDto dto = service.tryToFindId(param);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if (dto == null) {
			out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='findId';</script>");
			out.flush();
		} else {
			out.println("<script>alert('회원님의 아이디는 "+dto.getU_id()+" 입니다.'); location.href='login';</script>");
			out.flush();
		}
		
	}

	
	@RequestMapping("findPwd")
	public String findPwd() {
		
		return "user/findPwd";
	}
	
	@RequestMapping("logOut")
	public String logout() {
		System.out.println("@@@### logOut()");
		
		return "user/logOut";
	}
	
	@RequestMapping("findPwdOk")
	public void findPwd(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		
		UserDto dto = service.tryToFinPwd(param);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if (dto == null) {
			out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='findPwd';</script>");
			out.flush();
		} else {
			out.println("<script>alert('회원님의 패스워드는 "+dto.getU_pwd()+" 입니다.'); location.href='login';</script>");
			out.flush();
		}
		
	}
	
}
	
