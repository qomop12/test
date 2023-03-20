package spring.project.interpark.cart.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class CartDTO {
	private int cartnum;
	private int quantity;
	private String id;
	private int pronum;
}
