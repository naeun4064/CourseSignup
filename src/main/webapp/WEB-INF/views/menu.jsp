<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div class="col-sm-3">	
        <a href="<c:url value='/course/courseSignupForm'/>" class="btn btn-danger btn-block btn-compose-email">수강 신청</a>

        <ul class="nav nav-pills nav-stacked nav-email shadow mb-20">
            <li class="active">
                <a href="">
                	<i class="fa fa-inbox"></i> 학생이름 : ${sessionScope.voSt.stName}
                </a>
            </li>
            <li>
                <a href="<c:url value='/'/>">	
                	<i class="fa fa-file-text-o"></i> 메인화면
                </a>
            </li>
            <li>
                <a href="<c:url value='/course/enrollList'/>">	
                	<i class="fa fa-envelope-o"></i> 수강목록 확인 
                </a>
            </li>
            <li>
                <a href="<c:url value='/student/studentMain'/>">
                	<i class="fa fa-certificate"></i> 개인정보 수정
                </a>	
            </li>
            <li>
            	<a href="<c:url value='/member/logout'/>"> 
            		<i class="fa fa-trash-o"></i> 로그아웃
            	</a>
            </li>
        </ul>
    </div>
    
    <br>