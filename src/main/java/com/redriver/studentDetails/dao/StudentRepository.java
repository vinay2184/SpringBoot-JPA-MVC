package com.redriver.studentDetails.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.redriver.studentDetails.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long>{
	
	@Query("select s from students s where CONCAT(s.firstName, ' ',s.lastName) LIKE %?1%")			
	public Page<Student> findAll(String keyword,Pageable pageable);
}
