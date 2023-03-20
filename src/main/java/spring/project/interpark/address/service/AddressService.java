package spring.project.interpark.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import spring.project.interpark.address.dao.AddressDAO;
import spring.project.interpark.address.dto.AddressDTO;

@Service
public class AddressService {

	@Autowired
	private AddressDAO addressDAO;

	// 전체조회
	public List<AddressDTO> addressSelectAll() {
		return addressDAO.selectAll();
	}

	// 상세조회
	public AddressDTO addressSelect(int num) {
		return addressDAO.select(num);
	}

	// 배송지 추가
	// 데이터의 무결성 제약조건에 대한 예외를 처리
	public void addressInsert(AddressDTO addressDTO) {
		try {
			addressDAO.insert(addressDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}

	// 배송지 수정
	public void addressUpdate(AddressDTO addressDTO) {
		addressDAO.update(addressDTO);
	}

	// 배송지 삭제
	public void addressDelete(int num) {
		addressDAO.delete(num);
	}
}
