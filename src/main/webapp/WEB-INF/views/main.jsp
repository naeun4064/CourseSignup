<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert "title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="resources/js/jquery-3.4.1.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='resources/css/main.css'/>" />

<c:if test="${requestScope.signupResult==true}">
	<script>alert("가입성공");</script>
</c:if>
<c:if test="${requestScope.loginResult==true}">
	<script>alert("로그인 성공");</script>
</c:if>

<script type="text/javascript">
	$(function(){
	    	$(".card > ul").click(function(){
	    		$(this).toggleClass("active");
				$(".tab-content").toggleClass("active");
	        });
	
	        $(".col-sm-3 > ul").click(function(){
	            $(this).toggleClass("active");
	        })
	        $('#searchBtn').click(function(){
				var searchItem = $('#searchItem').val();
				var searchKeyword = $('#searchKeyword').val();

				$.ajax({
					url: 'course/courseListTemp',
					type: 'get',
					data : {
						searchItem : searchItem,
						searchKeyword : searchKeyword
						},
					success: function (data){
						output(data);
						},
					error: function() {}
					});
				
		    });
	})
	
	function output(data){
		var str ='';
		$.each(data, function(index, item){
			str += '<tr><td>' + item.courseNum + '</td>';
			str += '<td>' + item.courseName + '</td>';
			str += '<td>' + item.grade + '</td>';
			str += '<td>' + item.professor + '</td></tr>';
			})
			$('#tbody').html(str);
	}
</script>

</head>
<body>

<!-- 로그인 후 화면  -->
	<c:if test="${sessionScope.voSt.stNum!=null}">
		<div class="container row">

			<%@ include file="menu.jsp"%>

			<div class="col-sm-9">

				<div class="card">

					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
						<li role="presentation"><a href="#timeTable"
							aria-controls="timeTable" role="tab" data-toggle="tab">강의목록</a></li>
					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">
							<p>두번째 탭 ↑↑↑↑↑에 강의목록 있음.</p>
							<p>수강 신청 먼저 눌러서 수업 신청하고 수강목록 확인하면 됩니다.</p>
						</div>

						<div role="tabpanel" class="tab-pane" id="timeTable"
							align="center">
							
							
							<select name="searchItem" class="form-control" id="searchItem">
								<option value="courseNum">학수번호</option>
								<option value="courseName">수업명</option>
								<option value="grade">대상학년</option>
								<option value="professor">교수명</option>
							</select> 
							
							<input type="text" name="searchKeyword" class="form-control" id="searchKeyword"> 
							<input type="button" value="검색" class="btn btn-default" id="searchBtn"> <br>
							
							<table class="table table-bordered table-hover" id="table_id">
								<thead>
									<tr>
										<th>학수번호</th>
										<th>수업명</th>
										<th>대상학년</th>
										<th>교수명</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach items="${courseList}" var="co">
										<tr>
											<td>${co.courseNum}</td>
											<td>${co.courseName}</td>
											<td>${co.grade}</td>
											<td>${co.professor}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>


<!-- 로그인 전 화면 -->
	<c:if test="${sessionScope.voSt.stNum==null}">
		<div class="container">
			<div class="row">
				<h1 align="center" style="color:gray" >수강 신청 프로그램</h1>
				<br>

				<div class="col-sm-9">

					<div class="row">

						<div class="col-lg-3" align="right">
							<div class="panel panel-info">
								<a href="<c:url value='/member/signupForm'/>">
									<div class="panel-footer announcement-bottom">
										<div class="row">
											<div class="col-xs-6">Signup</div>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-lg-3" align="right">
							<div class="panel panel-success">
								<a href="<c:url value='/member/loginForm'/>">
									<div class="panel-footer announcement-bottom">
										<div class="row">
											<div class="col-xs-6">Login</div>
										</div>
									</div>
								</a>
							</div>
						</div>

					</div>

					<div class="card">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
						</ul>


						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<section class="comment-list">
									<article class="row">
										<div class="col-md-10 col-sm-10">
											<div class="panel panel-default arrow left">
												<div class="panel-body comment-post">
													<p>회원 가입 가능한 학번 : 105508 105509</p>
													<br>
													<p>이미 가입할 때 쓴 학번으로 가입하면 '이미 등록된 학번 입니다' 뜸</p>
												</div>
											</div>
										</div>
									</article>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>






</body>
</html>