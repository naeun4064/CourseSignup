<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="resources/js/jquery-3.4.1.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/main.css'/>"/>
</head>
<body>
	<div class="col-lg-3">
		<div class="panel panel-info" align="center">
			<h1>문제가 발생했습니다</h1>
			<h1>${msg}</h1>
			<h1><a href="<c:url value='/' />">메인으로</a></h1>	
		</div>
	</div>
</body>
</html>