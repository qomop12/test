package spring.project.interpark.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.member.service.MemberService;
import spring.project.interpark.page.Criteria;
import spring.project.interpark.page.PageMaker;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 회원 전체조회, 페이징 (관리자만)
	@RequestMapping(value = "/MemberSelect", method = RequestMethod.GET)
	public String selectList(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		model.addAttribute("list", memberService.memberSelectAll(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.MemberCount());
		model.addAttribute("pageMaker", pageMaker);
		return "./member/member_select";
	}

	// 회원 상세조회
	@RequestMapping(value = "/MemberSelectDetail", method = RequestMethod.GET)
	public String selectDetail(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		return "./member/member_select_detail";
	}

	// 회원가입
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.GET)
	public String insert() {
		return "./member/member_insert";
	}

	// 회원가입
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.POST)
	public String insert(Model model, MemberDTO memberDTO, Criteria cri) throws Exception {
		model.addAttribute("list", memberService.memberSelectAll(cri));
		memberService.memberInsert(memberDTO);
		return "./member/member_insert_view";
	}

	// 회원수정
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	public String update(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		return "./member/member_update";
	}

	// 회원수정
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)
	public String update(MemberDTO memberDTO) {
		memberService.memberUpdate(memberDTO);
		return "./member/member_update_view";
	}

	// 회원삭제
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
	public String delete(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getId()));
		return "./member/member_delete";
	}

	// 회원삭제
	// 관리자가 아닌 개인이 회원 탈퇴시 자동으로 로그아웃
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.POST)
	public String delete(MemberDTO memberDTO, HttpSession session, @RequestParam("adminCheck") String adminCheck) {
		System.out.println("qweqweqweqwe" + " " + adminCheck);
		if (adminCheck.equals("admin")) {
			memberService.memberDelete(memberDTO.getId());
		} else {
			memberService.memberDelete(memberDTO.getId());
			session.invalidate();
		}
		return "./member/member_delete_view";
	}

	// 마이 페이지
	@RequestMapping(value = "/MypageView", method = RequestMethod.GET)
	public String mypage() {
		return "./mypage/mypage_view";
	}

	// 회원가입 아이디 중복 검사
	@RequestMapping(value = "/MemberIdCheck", method = RequestMethod.POST)
	// 뷰 페이지가 아닌 반환값 그대로 전송
	@ResponseBody
	public String idCheck(MemberDTO memberDTO) throws Exception {
		int idCheck = memberService.idCheck(memberDTO);
		logger.info("아이디", idCheck);
		System.out.println("아이디" + idCheck);
		if (idCheck == 0) {
			return "Yes";
		} else {
			return "No";
		}
	}

	// 로그인
	@RequestMapping(value = "/MemberLogin", method = RequestMethod.GET)
	public String login() {
		return "./member/member_login";
	}

	// 로그인
	@RequestMapping(value = "/MemberLogin", method = RequestMethod.POST)
	// 뷰 페이지가 아닌 반환값 그대로 전송
	@ResponseBody
	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
		int loginCheck = memberService.loginCheck(memberDTO);
		logger.info("아이디qwe", loginCheck);
		System.out.println("아이디qwe" + loginCheck);
		// 세션에 저장과 입력한 아이디, 비밀번호가 있으면 1 없으면 0
		if (loginCheck == 1) {
			session.setAttribute("sessionList", memberService.memberSelect(memberDTO.getId()));
			return "Yes";
		} else {
			return "No";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/MemberLogOut", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "./member/member_logout_view";
	}
}
