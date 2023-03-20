package spring.project.interpark.member.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	
}
