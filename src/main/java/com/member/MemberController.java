package com.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.util.FindUtil;
import com.member.util.MailUtil;

import blockchain.util.StringUtil;
import vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	public MemberLogic memberLogic = null;
	@Autowired
	public MemberVO mVO = null;

	@GetMapping("emailCheck")
	public @ResponseBody String emailCheck(@RequestParam Map<String,Object> pMap) {
		logger.info("emailCheck Controller 호출");
		mVO.setMem_email(pMap.get("email").toString()); 
		logger.info("######## : "+mVO.getMem_email());
		String result = memberLogic.emailCheck(mVO);
		return result;
	}	
	@GetMapping("emailSend")
	public @ResponseBody String emailSend(@RequestParam Map<String, Object> pMap, HttpSession session) {
		logger.info("emailSend Controller 호출");
		String keyCode = null;
		try {
			keyCode = FindUtil.createKey();
			//랜덤돌려진 난수.(임시비밀번호)
			//비번찾기 폼에서 location.href 태워보낸 파라미터(user 이메일)
			String mem_email = pMap.get("email").toString();
			System.out.println("mem_email: =============="+mem_email);
			//session.setAttribute("keyCode", keyCode); 
			//세션에 담아버리면 ajax가 페이지를 갱신하지 않기때문에 세션을 로드해오지못함.
			String subject = "[FTBC] 이메일 인증 안내";
			String msg = "";
			//아래 메일 메시지 창은 뭐 디자인 바꾸고싶으면 바꾸면 됨.그대로 가져다쓴거임.
			msg +="<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg +="<h3 style='color: blue;'>인증 코드가 발급되었습니다.</h3>";
			msg +="<div style='font-size: 130%'>";
			msg +="발급된 인증번호는 <strong>"+keyCode+"</string>이며,<br>";
			msg +="인증번호를 입력하셔서, 본인확인을 완료해주시기를 바랍니다.</div><br>";
			MailUtil.sendMail(mem_email, subject, msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return keyCode;
	}
	@PostMapping("join")
	public String join(@RequestParam Map<String, Object> pMap) {
		int result = 0;
		logger.info("MemberController join 호출 성공");
		logger.info("이메일============:"+pMap.get("join_now_email").toString());
		logger.info("이름============:"+pMap.get("join_now_name").toString());
		logger.info("비밀번호============:"+pMap.get("join_now_pw_check").toString());
		mVO.setMem_email(pMap.get("join_now_email").toString());
		mVO.setMem_name(pMap.get("join_now_name").toString());
		String password = pMap.get("join_now_pw_check").toString();
		logger.info("비밀번호sha256통과============:"+StringUtil.applySha256(password));
		mVO.setMem_pw(StringUtil.applySha256(password));
		result = memberLogic.join(mVO);
		/*
		 * if(result==1) {
		 * 
		 * }else{
		 * 
		 * }
		 */
		return "/FTBC_MainView/FTBC_Login.jsp";
	}
	@PostMapping("login")
	public String login(@RequestParam Map<String,Object> pMap) {
		int result = 0;
		logger.info("MemberController login 호출 성공");
		logger.info("이메일============:"+pMap.get("log_id").toString());
		logger.info("비밀번호============:"+pMap.get("log_pw").toString());
		String password = pMap.get("log_pw").toString();
		mVO.setMem_email(pMap.get("log_id").toString());
		mVO.setMem_email(StringUtil.applySha256(password));
		result = memberLogic.login(mVO);
		
		return "";
	}
	

}
