package com.redriver.studentDetails.controllers;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.redriver.studentDetails.model.Student;
import com.redriver.studentDetails.services.StudentService;

@Controller
public class MainController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/home")
	public String homePage(){
		return "home";
	}
	
	@GetMapping("/students")
	public String init(HttpServletRequest httpServletRequest,@Param("keyword") String keyword,Integer pageNumber){
		return viewPage(httpServletRequest, 1, keyword);
	}

	@GetMapping("/updateStudent")
	public String update(HttpServletRequest httpServletRequest,@RequestParam long id){
		httpServletRequest.setAttribute("student", studentService.findOneStudent(id));
		httpServletRequest.setAttribute("mode", "STUDENT_EDIT");
		return "students";
	}
	
	
	@PostMapping("/save")
	public String save(@ModelAttribute Student student,HttpServletRequest httpServletRequest,@Param("keyword") String keyword,Integer pageNumber){		
		studentService.save(student);		
		return viewPage(httpServletRequest, 1, keyword);
	}
	
	@GetMapping("/page")
	public String viewPage(HttpServletRequest httpServletRequest,@RequestParam(name="num") Integer pageNum,@RequestParam String keyword){
		Page<Student> page=studentService.findAllStudents(keyword, pageNum);
		List<Student> studList=page.getContent();
		httpServletRequest.setAttribute("students", studList);
		httpServletRequest.setAttribute("currentPage", pageNum);
		httpServletRequest.setAttribute("totalPages", page.getTotalPages());
		httpServletRequest.setAttribute("totalItems", page.getTotalElements());
		httpServletRequest.setAttribute("mode", "STUDENT_VIEW");
		httpServletRequest.setAttribute("keyword", keyword);
		
		return "students";
	}
	
	@RequestMapping("/createData")
	public String saveTest(){		
		Student s1 =new Student("Harry","Potter",15);
		Student s2 =new Student("Hermoine","Granger",18);
		Student s3 =new Student("Ron","Weasley",18);
		Student s4 =new Student("Luna","Lovegood",17);
		Student s5 =new Student("Ginny","Weasley",17);
		Student s6 =new Student("Potter","Quil",12);
		Student s7 =new Student("Fred","Weasley",12);
		Student s8 =new Student("Weasley","George",11);
		Student s9 =new Student("James","Potter",17);
		Student s10 =new Student("Lily","Potter",16);
		Student s11 =new Student("Bill","Weasley",17);
		Student s12 =new Student("Weasley","Percy",18);
		Student s13 =new Student("Molly","Weasley",18);
		Student s14 =new Student("Arthur","Weasley",18);
		Student s15 =new Student("Weasley","Charlie",16);
		Student s16 =new Student("Albus","Dumbledoore",17);
		Student s17 =new Student("Aberforth","Dumbledoore",17);
		Student s18 =new Student("Dumbledoore","Ariana",16);
		List<Student> stdList = new LinkedList<>();
		stdList.add(s1);
		stdList.add(s2);
		stdList.add(s3);
		stdList.add(s4);
		stdList.add(s5);
		stdList.add(s6);
		stdList.add(s7);
		stdList.add(s8);
		stdList.add(s9);
		stdList.add(s10);
		stdList.add(s11);
		stdList.add(s12);
		stdList.add(s13);
		stdList.add(s14);
		stdList.add(s15);
		stdList.add(s16);
		stdList.add(s17);
		stdList.add(s18);
		try{
			studentService.saveAll(stdList);
		}catch(Exception e){
			e.printStackTrace();			
		}
		return "home";
	}
	
}
