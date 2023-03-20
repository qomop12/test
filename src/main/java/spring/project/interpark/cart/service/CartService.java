package spring.project.interpark.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import spring.project.interpark.cart.dao.CartDAO;
import spring.project.interpark.cart.dto.CartDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;

	// 전체조회
	public List<CartDTO> cartSelectAll() {
		return cartDAO.selectAll();
	}

	// 상세조회
	public CartDTO cartSelect(int cartnum) {
		return cartDAO.select(cartnum);
	}

	// 장바구니 추가
	// 데이터의 무결성 제약조건에 대한 예외를 처리
	public void cartInsert(CartDTO cartDTO) {
		try {
			cartDAO.insert(cartDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}

	// 장바구니 수정
	public void cartUpdate(CartDTO cartDTO) {
		cartDAO.update(cartDTO);
	}

	// 장바구니 삭제
	public void cartDelete(int cartnum) {
		cartDAO.delete(cartnum);
	}
}
