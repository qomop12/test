package spring.project.interpark.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring.project.interpark.cart.dto.CartDTO;

@Repository
public class CartDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 장바구니 전체조회
	public List<CartDTO> selectAll() {
		return sqlSessionTemplate.selectList("selectAllCart");
	}

	// 장바구니 상세조회
	public CartDTO select(int carnum) {
		return sqlSessionTemplate.selectOne("selectCart", carnum);
	}

	// 장바구니 추가
	@Transactional
	public void insert(CartDTO cartDTO) {
		sqlSessionTemplate.insert("insertCart", cartDTO);
	}

	// 장바구니 수정
	public void update(CartDTO cartDTO) {
		sqlSessionTemplate.insert("updateCart", cartDTO);
	}

	// 장바구니 삭제
	public void delete(int cartnum) {
		sqlSessionTemplate.insert("deleteCart", cartnum);
	}
}
