package spring.project.interpark.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring.project.interpark.product.dto.ProductDTO;

@Repository
public class ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 전체조회
	public List<ProductDTO> selectAll() {
		return sqlSessionTemplate.selectList("selectAllProduct");
	}

	// 상세조회
	public ProductDTO select(int pronum) {
		return sqlSessionTemplate.selectOne("selectProduct", pronum);
	}

	// 상품등록
	@Transactional
	public void insert(ProductDTO productDTO) {
		sqlSessionTemplate.insert("insertProduct", productDTO);
	}

	// 상품수정
	public void update(ProductDTO productDTO) {
		sqlSessionTemplate.update("updateProduct", productDTO);
	}

	// 상품삭제
	public void delete(int pronum) {
		sqlSessionTemplate.delete("deleteProduct", pronum);
	}
}
