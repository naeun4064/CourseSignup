<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/main.css'/>"/>

<c:if test="${requestScope.updateResult==true}"><script>alert("수정 성공")</script></c:if>
<c:if test="${requestScope.updateResult==false}"><script>alert("수정 실패")</script></c:if>
</head>

<body>

<div class="container row">
    
    <%@ include file="../menu.jsp" %>

    <div class="col-sm-9">

        <div class="card">
    		<div class="tab-content">
	            <div align="center">
	            	<h2>개인정보</h2>
	            	<table class="table table-bordered table-hover">
                    	<tr>
                    		<th>학번</th><td>${requestScope.vo.stNum}</td>
                    	</tr>
                    	<tr>
                    		<th>이름</th><td>${requestScope.vo.stName}</td>
                    	</tr>
                    	<tr>
                    		<th>영문이름</th><td>${requestScope.vo.stNameEng}</td>
                    	</tr>
                    	<tr>
                    		<th>전공</th><td>${requestScope.vo.major}</td>
                    	</tr>
                    	<tr>
                    		<th>학년</th><td>${requestScope.vo.grade}</td>
                    	</tr>
                    </table>	
                    	<a href="<c:url value='/student/studentUpdateForm'/>">	
                    		<input type="button" value="수정" class="btn btn-default">
                    	</a>	
                </div>
    	   </div>
       </div>           
   </div>  
</div>
</body>
</html>