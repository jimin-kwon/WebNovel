package com.webnovel.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webnovel.member.domain.MemberVO;
import com.webnovel.member.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Override
	@GetMapping("/loginForm")
	public String loginForm(String error, String logout, Model model) {
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		return "/loginForm";
	}
	
	@Override
	@PostMapping("/logout")
	public void logout() {
		log.info("post custom logout");
	}
	
	// 회원가입
	@Override
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/joinForm";
	}
	
	@Override
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		String password = pwencoder.encode(memberVO.getPassword());
		memberVO.setPassword(password);
		System.out.println(memberVO.getPassword());
		memberService.join(memberVO);
		return "redirect:/member/loginForm";
	}

	//아이디 중복체크
	@Override
	@PostMapping("/idCK")
	public ResponseEntity<String> idCK(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity<String> resEntity = null;
		String result = memberService.idCK(id);
		resEntity = new ResponseEntity<String>(result, HttpStatus.OK);
		return resEntity;
	}
	
	// 아이디 찾기
	@Override
	@GetMapping("/idF_Form")
	public String idF_Form() {
		return "/idF_Form";
	}
	
	@PostMapping("/findEmail")
	@ResponseBody
	public Map<String, Object> findEmail(MemberVO memberVO, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = "";
		try {
			id = memberService.findEmail(memberVO);
			if(id==null || "".equals(id)) {				
				map.put("code", "N");
				map.put("msg", "아이디를 찾을 수가 없습니다.");
			} else {
				map.put("code", "Y");
				map.put("msg", "아이디는 "+id+" 입니다.");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return map;
	}

	@Override
	@PostMapping("/idF")
	@ResponseBody
	public String idF(@RequestParam("mail") Map mail, Model model) throws Exception {
		log.info("idF");
		log.info("mail>>>>> "+ mail);
		
		String id = memberService.idF(mail);
		log.info("id>>>>> "+ id);
		
		return id;
	}
	
	// 비밀번호 찾기
	@Override
	@GetMapping("/pwdF")
	public String pwdF() {
		log.info("password 찾기");
		return "/pwdF";
	}

	@Override
	@PostMapping("/findPasswordAction")
	public String findPasswordAction(MemberVO memberVO, Model model) {
		String user = memberService.pwdF(memberVO);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
//			md.addAttribute("updateid", user.getid());
		}

		return "/pwdF";
	}

	
	// 회원 정보 수정
	@Override
	@GetMapping("/mypage/memberUpdateView")
	public String memberUpdateView(Model model, HttpServletRequest request) throws Exception {
		log.info("회원정보수정-1");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		MemberVO memberInfo = memberService.memberInfo(id);
		model.addAttribute("memberInfo", memberInfo);

		return "/mypage/memberUpdateView";
	}

	@Override
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberVO memberVO, HttpSession session, Model model) throws Exception {
		String password = pwencoder.encode(memberVO.getPassword());
		memberVO.setPassword(password);
		
		memberService.memberUpdate(memberVO);
		session.invalidate();
		log.info("회원정보수정");
		model.addAttribute("memberInfo", memberVO);
		return "/mypage/mypageMain";
	}

	
	// 회원 탈퇴
	@Override
	@GetMapping("/mypage/memberDeleteView")
	public String memberDeleteView(Model model) throws Exception {
		log.info("회원정보 삭제 GET");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id = authentication.getName();
		
		MemberVO memberInfo = memberService.memberInfo(id);
		model.addAttribute("memberInfo", memberInfo);
		
		
//		  if(id == null) { return "redirect:/member/mail"; }
		 
		return "/mypage/memberDeleteView";
	}

	@Override
	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO memberVO, HttpSession session, Model model) throws Exception {
		log.info("Post");
		memberService.memberDelete(memberVO);
		session.invalidate();
		log.info("회원정보수정");
		model.addAttribute("memberInfo", memberVO);
		session.invalidate();
		return "redirect:/member/main";
	}
	
	// 비밀번호 체크
	@PostMapping("/passChk")
	@ResponseBody
	public boolean passChk(MemberVO memberVO) throws Exception {
//		MemberVO login = memberService.login(memberVO);
//		boolean pwdChk = pwencoder.matches(memberVO.getPassword(), login.getPassword());
//		return pwdChk;
		return false;
	}

	@Override
	@GetMapping("/mypage/mypageMain")
	public String mypageMain(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "mypage");
		
		String id = (String) session.getAttribute("id");
		
		MemberVO memberInfo=memberService.memberInfo(id);
		model.addAttribute("memberInfo", memberInfo);
		return "/mypage/mypageMain";
	}
}
