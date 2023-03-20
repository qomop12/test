package spring.project.interpark.product.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class ProductDTO {
	private int pronum;
	private String productname;
	private String price;
	private String category;
	private String id;
}
