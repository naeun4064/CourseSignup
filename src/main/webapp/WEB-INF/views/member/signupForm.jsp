<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/member.css'/>"/>


<c:if test="${requestScope.signupResult==false}"><script>alert("가입실패");</script></c:if>

<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
<script type="text/javascript">		
	$(function(){
		$("#userid").hide();
		$("#userpwd").hide();
		
		$("#stNum").blur(function(){
			var stNum = $("#stNum").val();
			
			$.ajax({
				url : 'stNumCheckSignup',
				type : 'get',
				data : {
					stNum : stNum
					},
				success : function(data) {
							$("#stNumCheck").css("color", "red");
							$("#SignupSubmit").attr("disabled", true);
							if (data == 0) {
								$("#stNumCheck").text("");
								$("#userid").show();
							} else if (data == 1) {
								$("#stNumCheck").text("이미 등록된 학번 입니다.");
							} else if (data == 2) {
								$("#stNumCheck").text("일치하는 학번이 없습니다.");
							} else if(stNum == ""){
								$('#stNumCheck').text('학번을 입력해주세요.');			
							}
					},
				error : function() {
						console.log("실패");
					}
			});
		});

		
		$("#userid").blur(function(){
			var userid = $("#userid").val();
			var userpwd = $("#userpwd").val();
		
			$.ajax({
				url : 'idCheckSignup',
				type : 'get',
				data : {
					userid : userid
					},
				success : function(data) {
							$("#idCheck").css("color", "red");
							$("#pwdCheck").css("color","red");
							$("#SignupSubmit").attr("disabled", true);
							if (data == 1) {
									$("#idCheck").text("사용중인 아이디입니다.");
								} else if(userid == ""){
									$('#idCheck').text('아이디를 입력해주세요.');			
								} else if(userid.length > 10 || userid.length < 1){
									$('#idCheck').text("아이디는 1~10자리만 가능합니다.");
								} else if(userid.length <= 10 && userid.length >= 1){
									$('#idCheck').text("");
									$("#userpwd").show();

									$('#userpwd').on("keyup",function(){
									
										if($('#userpwd').val().length > 10 || $('#userpwd').val().length < 1) {
											$("#pwdCheck").text("1~10자리 사이로 비밀번호를 입력해주세요.");
											$("#SignupSubmit").val("가입(아직불가)");
											$("#SignupSubmit").attr("disabled", "disalbed");
										}else {
											$("#pwdCheck").text("");
											$("#SignupSubmit").val("가입");
											$("#SignupSubmit").removeAttr("disabled");
										}
									});
									
								}
					},
				error : function() {
						console.log("실패");
					}
			});
		});
	});
</script>

</head>
<body>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
       <h1>SignUp</h1>
    </div>

    <form action="<c:url value='/member/signup'/>" method="post">
    	<input type="text" id="stNum" name="stNum" class="fadeIn second" placeholder="학번">
    		<div id="stNumCheck"></div>
	    <input type="text" id="userid" name="userid" class="fadeIn second" placeholder="ID">
	    		<div id="idCheck"></div>
		<input type="password" id="userpwd" name="userpwd" class="fadeIn second" placeholder="password">
				<div id="pwdCheck"></div>
		<input type="submit" value="가입(아직불가)" id="SignupSubmit" disabled="disabled" class="fadeIn fourth">
    </form>

    <div class="formFooter">	
      <a class="underlineHover" href="<c:url value='/'/>">Go to Main</a>
    </div>

  </div>
</div>

</body>
</html>