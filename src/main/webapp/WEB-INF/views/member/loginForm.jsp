<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script> 
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/member.css'/>"/>
<c:if test="${requestScope.loginResult==false}"><script>alert("로그인 실패");</script></c:if>

<script>
	$(function(){

	});
</script>
</head>
<body>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
       <h1>LogIn</h1>
    </div>

    <form action="<c:url value='/member/login'/>" method="post">
      <input type="text" name="userid" class="fadeIn second" placeholder="ID">
      <input type="password" name="userpwd" class="fadeIn second" placeholder="password">
      
      <input type="submit" class="fadeIn fourth" value="LogIn" onclick="returnMain()">
    </form>

    <div class="formFooter">	
      <a class="underlineHover" href="<c:url value='/'/>">Go to Main</a>
    </div>

  </div>
</div>

</body>
</html>