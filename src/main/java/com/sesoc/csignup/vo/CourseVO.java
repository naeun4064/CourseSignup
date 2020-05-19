package com.sesoc.csignup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CourseVO {
	private int courseNum;
	private String courseName;
	private int grade;
	private int capacity;
	private String professor;
	public CourseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
