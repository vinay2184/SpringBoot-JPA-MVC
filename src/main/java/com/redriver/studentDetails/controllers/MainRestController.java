package com.redriver.studentDetails.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.redriver.studentDetails.model.Student;
import com.redriver.studentDetails.services.StudentService;

@RestController
public class MainRestController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/")
	public String hello(){
		return "Hello World!";
	}
	
	@GetMapping("/findAllStudents")
	public Page<Student> getAllStudents(@Param("keyword") String keyword,int pageNumber){		
		return studentService.findAllStudents(keyword,pageNumber);
	}

}
