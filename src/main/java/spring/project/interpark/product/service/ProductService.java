package spring.project.interpark.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import spring.project.interpark.product.dao.ProductDAO;
import spring.project.interpark.product.dto.ProductDTO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;

	// 전체조회
	public List<ProductDTO> productSelectAll() {
		return productDAO.selectAll();
	}

	// 상세조회
	public ProductDTO productSelect(int pronum) {
		return productDAO.select(pronum);
	}

	// 상품 추가
	// 데이터의 무결성 제약조건에 대한 예외를 처리
	public void productInsert(ProductDTO productDTO) {
		try {
			productDAO.insert(productDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}

	// 상품 수정
	public void productUpdate(ProductDTO productDTO) {
		productDAO.update(productDTO);
	}

	// 상품 삭제
	public void productDelete(int pronum) {
		productDAO.delete(pronum);
	}
}
