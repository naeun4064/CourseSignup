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


<script type="text/javascript">

</script>

</head>

<body>

<div class="container row">
    
    <%@ include file="../menu.jsp" %>

    <div class="col-sm-9">

        <div class="card">
    		<div class="tab-content">
	            <div align="center">
	            	<h3 align="center">${sessionScope.voSt.stName}님이 신청하신 수업들입니다.</h3>
	            	<br>
	            	<table class="table table-bordered table-hover" id="table_id">
                           <tr>
                           	   <th></th>
                               <th>학수번호</th>
                               <th>수업명</th>
                           </tr>
                           
						<c:forEach items="${requestScope.EnrollVO}" var="co">
							<tr>
								<td>
									<form action="cancelCourse" method="post">
										<input type="submit" class="btn btn-default" value="삭제">
										<input type="hidden" name="courseNum" value="${co.courseNum}">
										<input type="hidden" name="courseName" value="${co.courseName}">
									</form>
								</td>
								<td>${co.courseNum}</td>
                                <td>${co.courseName}</td>
                            </tr>
						</c:forEach>
                    </table>
                </div>
    	   </div>
       </div>           
   </div>  
</div>
</body>
</html>