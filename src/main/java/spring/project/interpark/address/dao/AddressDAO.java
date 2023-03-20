package spring.project.interpark.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring.project.interpark.address.dto.AddressDTO;

@Repository
public class AddressDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 전체조회
	public List<AddressDTO> selectAll() {
		return sqlSessionTemplate.selectList("selectAllAddress");
	}

	// 상세조회
	public AddressDTO select(int num) {
		return sqlSessionTemplate.selectOne("selectAddress", num);
	}

	// 배송지 추가
	@Transactional
	public void insert(AddressDTO addressDTO) {
		sqlSessionTemplate.insert("insertAddress", addressDTO);
	}

	// 배송지 수정
	public void update(AddressDTO addressDTO) {
		sqlSessionTemplate.update("updateAddress", addressDTO);
	}

	// 배송지 삭제
	public void delete(int num) {
		sqlSessionTemplate.delete("deleteAddress", num);
	}
}
