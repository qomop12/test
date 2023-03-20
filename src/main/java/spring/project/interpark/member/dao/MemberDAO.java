package spring.project.interpark.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.page.Criteria;

@Repository
public class MemberDAO {
//	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 전체조회, 페이징 (관리자만)
	public List<MemberDTO> selectAll(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectList("selectAllMember", cri);
	}
	// 회원수
	public int MemberCount() {
		return sqlSessionTemplate.selectOne("memberCount");
	}

	// 상세조회
	public MemberDTO select(String id) {
		return sqlSessionTemplate.selectOne("selectMember", id);
	}

	// 회원가입
	// 모든 작업들이 성공적으로 완료되어야 작업 묶음의 결과를 적용하고
	// 어떤 작업에서 오류가 발생했을 때는 이전에 있던 모든 작업들이
	// 성공적이었더라도 없었던 일처럼 완전히 되돌리는 것이 트랜잭션의 개념이다.
	@Transactional
	public void insert(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("insertMember", memberDTO);
	}

	// 회원수정
	public void update(MemberDTO memberDTO) {
		sqlSessionTemplate.update("updateMember", memberDTO);
	}

	// 회원탈퇴
	public void delete(String id) {
		sqlSessionTemplate.delete("deleteMember", id);
	}

	// 아이디 중복검사
	public int idCheck(MemberDTO memberDTO) throws Exception {
		int idCheck = sqlSessionTemplate.selectOne("idCheck", memberDTO);
		return idCheck;
	}

	// 로그인
	public int loginCheck(MemberDTO memberDTO) throws Exception {
		int loginCheck = sqlSessionTemplate.selectOne("loginCheck", memberDTO);
		return loginCheck;
	}
}
