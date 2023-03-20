package spring.project.interpark.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import spring.project.interpark.member.dao.MemberDAO;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.page.Criteria;

@Service
public class MemberService {
//	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired
	private MemberDAO memberDAO;

	// 전체 조회, 페이징(관리자만)
	public List<MemberDTO> memberSelectAll(Criteria cri) throws Exception {
		return memberDAO.selectAll(cri);
	}
	// 회원수
	public int MemberCount() {
		return memberDAO.MemberCount();
	}

	// 상세조회
	public MemberDTO memberSelect(String id) {
		return memberDAO.select(id);
	}

	// 회원가입
	// 데이터의 무결성 제약조건에 대한 예외를 처리
	public void memberInsert(MemberDTO memberDTO) {
		try {
			memberDAO.insert(memberDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}

	// 회원수정
	public void memberUpdate(MemberDTO memberDTO) {
		memberDAO.update(memberDTO);
	}

	// 회원탈퇴
	public void memberDelete(String id) {
		memberDAO.delete(id);
	}

	// 아이디 중복검사
	public int idCheck(MemberDTO memberDTO) throws Exception {
		int idCheck = memberDAO.idCheck(memberDTO);
		return idCheck;
	}

	// 로그인
	public int loginCheck(MemberDTO memberDTO) throws Exception {
		int loginCheck = memberDAO.loginCheck(memberDTO);
		return loginCheck;
	}
}
