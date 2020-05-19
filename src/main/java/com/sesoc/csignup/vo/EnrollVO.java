package com.sesoc.csignup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EnrollVO {
	private int stNum;
	private String stName;
	private int courseNum;
	private String courseName;
	public EnrollVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
