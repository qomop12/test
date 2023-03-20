package spring.project.interpark.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.project.interpark.product.dto.ProductDTO;
import spring.project.interpark.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	//상품 카테고리별 전체목록
	@RequestMapping(value = "/ProductSelect", method = RequestMethod.GET)
	public String selectList(Model model, @RequestParam("category") String category) {
		model.addAttribute("list", productService.productSelectAll());
		model.addAttribute("category", category);
		return "./product/product_select";
	}
	
	//상품 상세조회
	@RequestMapping(value = "/ProductSelectDetail", method = RequestMethod.GET)
	public String selectdetail(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO", productService.productSelect(productDTO.getPronum()));
		return "./product/product_select_detail";
	}
	
	//상품 추가
	@RequestMapping(value = "/ProductInsert", method = RequestMethod.GET)
	public String insert(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO", productDTO);
		return "./product/product_insert";
	}
	
	//상품 추가
	@RequestMapping(value = "/ProductInsert", method = RequestMethod.POST)
	public String insert(ProductDTO productDTO) {
		productService.productInsert(productDTO);
		return "./product/product_insert_view";
	}
	
	//상품 수정
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.GET)
	public String update(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO", productService.productSelect(productDTO.getPronum()));
		return "./product/product_update";
	}
	
	//상품 수정
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.POST)
	public String update(ProductDTO productDTO) {
		productService.productUpdate(productDTO);
		return "./product/product_update_view";
	}
	
	//상품 삭제
	@RequestMapping(value = "/ProductDelete", method = RequestMethod.GET)
	public String delete(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO", productService.productSelect(productDTO.getPronum()));
		return "./product/product_delete";
	}
	
	//상품 삭제
	@RequestMapping(value = "/ProductDelete", method = RequestMethod.POST)
	public String delete(ProductDTO productDTO) {
		productService.productDelete(productDTO.getPronum());
		return "./product/product_delete_view";
	}
}
