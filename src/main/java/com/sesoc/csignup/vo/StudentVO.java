package com.sesoc.csignup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StudentVO {
	private int stNum;
	private String stName;
	private String stNameEng;
	private String major;
	private int grade;
	public StudentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
