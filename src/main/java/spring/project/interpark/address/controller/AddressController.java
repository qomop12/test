package spring.project.interpark.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.project.interpark.address.dto.AddressDTO;
import spring.project.interpark.address.service.AddressService;

@Controller
public class AddressController {

	@Autowired
	private AddressService addressService;

	// 배송지 뷰, 전체조회
	@RequestMapping(value = "/AddressPage", method = RequestMethod.GET)
	public String addressPage(Model model) {
		model.addAttribute("list", addressService.addressSelectAll());
		return "./address/address_page_view";
	}

	// 배송지 추가
	@RequestMapping(value = "/AddressInsert", method = RequestMethod.GET)
	public String Insert() {
		return "./address/address_insert";
	}

	// 배송지 추가
	@RequestMapping(value = "/AddressInsert", method = RequestMethod.POST)
	public String Insert(Model model, AddressDTO addressDTO) {
		addressService.addressInsert(addressDTO);
		return "./address/address_insert_view";
	}

	// 배송지 수정
	@RequestMapping(value = "/AddressUpdate", method = RequestMethod.GET)
	public String update(Model model, AddressDTO addressDTO) {
		model.addAttribute("addressDTO", addressService.addressSelect(addressDTO.getNum()));
		return "./address/address_update";
	}

	// 배송지 수정
	@RequestMapping(value = "/AddressUpdate", method = RequestMethod.POST)
	public String update(AddressDTO addressDTO) {
		addressService.addressUpdate(addressDTO);
		return "./address/address_update_view";
	}
	
	// 배송지 삭제
	@RequestMapping(value = "/AddressDelete", method = RequestMethod.POST)
	public void delete(AddressDTO addressDTO) {
		addressService.addressDelete(addressDTO.getNum());
	}
}
