package com.redriver.studentDetails.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.redriver.studentDetails.dao.StudentRepository;
import com.redriver.studentDetails.model.Student;

@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;	
	
	public Page<Student> findAllStudents(String keyword,Integer pageNumber){		
		int pageSize=5;
		Pageable pageable = PageRequest.of(pageNumber-1,pageSize);
		if(keyword != null){
			return studentRepository.findAll(keyword,pageable);
		}
		return studentRepository.findAll(pageable);
	}
	
	public Student findOneStudent(long id){
		return studentRepository.findById(id).get();
	}
	
	public void save(Student student){
		studentRepository.save(student);
	}
	
	public void saveAll(List<Student> studentList){
		studentRepository.saveAll(studentList);
	}

}
