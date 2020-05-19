package com.sesoc.csignup.dao;

import com.sesoc.csignup.vo.StudentVO;

public interface StudentMapper {
	
	public StudentVO studentRead(int stNum);
	public int studentUpdate(StudentVO vo);
	
}
