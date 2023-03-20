package spring.project.interpark.cart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.project.interpark.cart.dto.CartDTO;
import spring.project.interpark.cart.service.CartService;
import spring.project.interpark.product.dto.ProductDTO;
import spring.project.interpark.product.service.ProductService;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	// 장바구니 전체조회
	@RequestMapping(value = "/CartSelect", method = RequestMethod.GET)
	public String selectList(Model model, ProductDTO productDTO) {
		model.addAttribute("cartList", cartService.cartSelectAll());
		model.addAttribute("productList", productService.productSelectAll());
		logger.info("qweqweqwe", productService.productSelect(productDTO.getPronum()));
		//다음 jsp에서 +,-버튼의 value로 사용
		int plus = -2;
		int minus = -1;
		model.addAttribute("plus", plus);
		model.addAttribute("minus", minus);
		return "./cart/cart_select";
	}

	// 장바구니 추가
	@RequestMapping(value = "/CartInsert", method = RequestMethod.POST)
	public void insert(Model model, CartDTO cartDTO) {
		cartService.cartInsert(cartDTO);
	}

	// 장바구니 수정
	@RequestMapping(value = "/CartUpdate", method = RequestMethod.POST)
	public void update(CartDTO cartDTO) {
		cartService.cartUpdate(cartDTO);
	}

	// 장바구니 삭제
	@RequestMapping(value = "/CartDelete", method = RequestMethod.POST)
	public void delete(CartDTO cartDTO) {
		cartService.cartDelete(cartDTO.getCartnum());
	}
}
