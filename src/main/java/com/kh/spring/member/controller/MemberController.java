package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller // 해당 class bean으로 등록 
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	   private BCryptPasswordEncoder bcryptPasswordEncoder;
	// parameter(요청 시 전달값)를 전송받는 방법 = 요청 시 전달되는 값들 처리방법
	/*
	 *  1. HttpServletRequest를 통해 전송받기 (기존의 jsp/servlet 방식)
	 *     : 해당 메소드의 매개변수로 HttpServletRequest를 작성하면
	 *       내부적으로 메소드 실행 시 스프링 컨테이너가 자동으로 해당 객체를 인자로 주입해줌
	 *  
	 */
	
//	@RequestMapping("login.me") // @RequestMapping Annotation을 붙여줌으로써 HandlerMapping
//	public void loginMember(HttpServletRequest request) {
//		String userId = request.getParameter("id");
//		String userPwd = request.getParameter("pwd");
//		System.out.println(userId);
//		System.out.println(userPwd);
//	}
	
//	@RequestMapping("login.me")
//	public void loginMember(@RequestParam(value="id", defaultValue="aaaa") String userId, 
//							@RequestParam("pwd") String userPwd) {
//		System.out.println(userId);
//		System.out.println(userPwd);
//	}
	
//	@RequestMapping("login.me")
//	public void loginMember(String userId, String userPwd) {
//		System.out.println(userId);
//		System.out.println(userPwd);
//	}
	
//	@RequestMapping("login.me")
//	public void loginMember(@ModelAttribute Member m) {
//		System.out.println(m.getUserId());
//		System.out.println(m.getUserPwd());
//	}
	
//	@RequestMapping("login.me")
//	public String loginMember(Member m, HttpSession session) {
//		
//		Member loginUser = mService.loginMember(m);
//		if(loginUser == null) {
//			return "common/errorPage";
//			// servlet-context.xml 문서의 ViewResolver에 prefix + result + suffix로 forwarding
//		}else {
//			session.setAttribute("loginUser", loginUser);
//			return "redirect:/";
//		}
//	}
	
	/*
	 * 	요청 처리 후 응답페이지에 응답할 데이터가 있을 경우에 대한 방법
	 *  1. Model 이라는 객체를 사용하는 방
	 * 
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		if(loginUser == null) {
			model.addAttribute("errorMsg","로그인 실패했습니다.");
			return "common/errorPage";
		}else {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}
		
	}
	* 2. ModelAndView 객체를 사용하는 방법 
	* 
	* 위의 Model은 응답할 데이터를 맵 형식 (Key-Value)로 담을 수 있는 공간이라면
	* View는 RequestDispatcher처럼 포워딩할 뷰 페이지 정보를 담을 수 있는 공간
	* 
	* ModelAndView : 위 두 가지를 합쳐놓은 객체 (응답 데이터 + 응답 뷰 페이지)
	* 
	*/
	
	
//	@RequestMapping("login.me")
//	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
//		
//		Member loginUser = mService.loginMember(m);
//		if(loginUser == null) {
//			mv.addObject("errorMsg", "로그인 실패");
//			mv.setViewName("common/errorPage");
//		}else {
//			session.setAttribute("loginUser", loginUser);
//			session.setAttribute("alertMsg", loginUser.getUserName() + "님 HI~");
//			mv.setViewName("redirect:/");
//		}
//		return mv;
//	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String enrollMember(HttpSession session, Member m, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg","회원가입 성공");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName() + "님 hi~");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","로그인 실패!!");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		int result = mService.updateMember(m);
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "정보변경 성공!!");
			return "redirect:myPage.me";
		}else {
			model.addAttribute("errorMsg","정보변경 실패!!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String userPwd, HttpSession session, Model model) {
		
		// userPwd : 비밀번호(평문)
		// session 안에 loginUser userPwd : 비밀번호(암호문)
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bcryptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			int result = mService.deleteMember(loginUser.getUserId());
			if(result>0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "회원탈퇴 성공!!");
				return "redirect:/";
			} else {
				model.addAttribute("errorMsg","회원탈퇴 실패!!");
				return "common/errorPage";
			}
		}else {
			session.setAttribute("alertMsg", "회원탈퇴 실패!!");
			return "redirect:myPage.me";
		}
		
	}
	
}





