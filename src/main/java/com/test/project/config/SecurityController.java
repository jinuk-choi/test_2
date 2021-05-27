package com.test.project.config;



import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.project.domain.User;

@Controller
public class SecurityController {
	
	@GetMapping("/username") 
	@ResponseBody 
	public String currentUserName(Authentication authentication) {
		User user = (User)authentication.getPrincipal();
		
		return user.getuName();
	}

	

}
