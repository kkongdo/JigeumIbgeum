package kb04.ditto.jgig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class guideController {
	@GetMapping("/jgig/guide")
	public String pratcice() {
		
		return "guide/guide";
	}
}
