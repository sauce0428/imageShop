package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.CodeGroup;
import com.project.service.CodeGroupService;

@Controller
@RequestMapping("/codegroup")
public class CodeGroupController {
	@Autowired
	private CodeGroupService service;
	
	// 등록 페이지 
	@GetMapping("/register") 
	public void registerForm(Model model) throws Exception { 
	CodeGroup codeGroup = new CodeGroup(); 
	model.addAttribute(codeGroup);
	//return "codeGroup/register";
	}
}