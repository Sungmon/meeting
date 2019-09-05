package com.bit.silence;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.Criteria;
import com.bit.domain.PageDTO;
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
	public void list(Criteria cri, Model model) {
		
		log.info("list()" + cri);
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
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
	public void get(@RequestParam("seq") Long seq, @ModelAttribute("cri")Criteria cri, Model model) {
		
		log.info("modify()");
		model.addAttribute("user", service.get(seq));
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute("cri") Criteria cri, UserVO user, RedirectAttributes rttr) {
		
		log.info("modify :" + user + cri);
		
		if(service.modify(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/user/list";
	}
	
	@PostMapping("/remove")
	public String remove(@ModelAttribute("cri") Criteria cri,@RequestParam("seq") Long seq, RedirectAttributes rttr) {
		
		log.info("remove..." + seq + cri);
		
		if(service.remove(seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/user/list";
	}
}
