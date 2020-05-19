package com.sesoc.csignup.dao;

import com.sesoc.csignup.vo.MemberVO;

public interface MemberMapper {
	public int signup(MemberVO vo);
	public int checkId(String userid);
	public int login(MemberVO vo);
	public int readMember(String userid);
	public int checkStNumfromStudent(int stNum);
	public int checkStNumfromMember(int stNum);
	
}
