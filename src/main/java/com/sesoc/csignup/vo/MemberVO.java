package com.sesoc.csignup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberVO {
	private String userid;
	private String userpwd;
	private int stNum;
	private String stName;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
