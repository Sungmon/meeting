package com.bit.silence;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.UserVO;
import com.bit.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserBoardController {

	UserService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info(model);
		
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {
		
		log.info("register....:" + user);
		
		service.register(user);
		
		rttr.addFlashAttribute("result", user.getSeq());
		
		return "redirect:/user/list";
	}
	
	@GetMapping("/modify")
	public void get(@RequestParam("seq") Long seq, Model model) {
		
		log.info("/modify");
		model.addAttribute("seq", service.get(seq));
	}
	
	@PostMapping("/modify")
	public String modify(UserVO user, RedirectAttributes rttr) {
		
		log.info("modify :" + user);
		
		if(service.modify(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/user/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("seq") Long seq, RedirectAttributes rttr) {
		
		log.info("remove..." + seq);
		
		if(service.remove(seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/user/list";
	}
}
