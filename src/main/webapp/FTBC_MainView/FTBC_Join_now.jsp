<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="FTBC_Join_now.css?17">
<script type="text/javascript">
$(document).ready(function(){
		$("#email_confirm").hide();
		$("#emailTrue").hide();
		$("#emailFalse").hide();
})
	function delogin(){//이미 회원일경우 로그인페이지로 돌아가기
		var url = "../FTBC_MainView/FTBC_Login.jsp";
		$("#Login_page").load(url);
	}
	function join() {//가입처리하기
		var check_pw = document.getElementById('pw_check').innerHTML;
		if(check_pw=="<h6>비밀번호가 일치합니다</h6>"){
			$.post("/member/join", $("#join_all_form").serialize(),function(data){
				location.href=data;
			});
			}
		else{
			alert("비밀번호를 확인해 주세요.");
		}
	}

	$(function() {//비밀번호 실시간 체크
		$("#join_now_pw_check").keyup(function(e){
			var cpw = $(this).val();
			var npw = $("#join_now_pw").val();
			if(cpw!=npw){
				$("#pw_check").html('<h6>비밀번호가 일치하지 않습니다</h6>');
			}
			else if(cpw.length>1){
				if(cpw==npw){
					$("#pw_check").html('<h6>비밀번호가 일치합니다</h6>');
				}else{
					$("#pw_check").html('<h6>비밀번호가 일치하지 않습니다</h6>');
				}
			}
		});
		$("#join_now_pw_check").keyup();
		$("#join_now_pw").keyup(function(e){
			var cpw = $(this).val();
			var npw = $("#join_now_pw_check").val();
			if(cpw!=npw){
				$("#pw_check").html('<h6>비밀번호가 일치하지 않습니다</h6>');
			}
			else if(cpw.length>1){
				if(cpw==npw){
					$("#pw_check").html('<h6>비밀번호가 일치합니다</h6>');
				}else{
					$("#pw_check").html('<h6>비밀번호가 일치하지 않습니다</h6>');
				}
			}
		});
		$("#join_now_pw").keyup();
	});

	function mailCheck(){//이메일 중복검사
		var email = $('#join_now_email').val();
		$.ajax({
			method:'get'
			,url:'/member/emailCheck?email='+email
			,success: function(data) {
				if(data==1){
						$("#emailTrue").show();
						$("#join_email_send").removeAttr("disabled");
						$("#emailFalse").hide();
					}else if(data==0){
						$("#emailFalse").show();
						$("#emailTrue").hide();
					}
			}
		});
	}
	var keyCode = null;
	function mailSend(){//인증하기 버튼 눌렀을때
		alert("메일을 전송하였습니다. 이메일을 확인하여 인증번호를 입력해 주십시오.");
		$("#email_confirm").show();
		var email = $('#join_now_email').val();
		$.ajax({
			method:'get'
			,url:'/member/emailSend?email='+email
			,success: function(data) { //여기 데이터는 keyCode
				keyCode = data;
			}//success
		}//out ajax
		)};
	function mailConfirm(){//메일 인증확인버튼 눌렀을때
		if($("#keyCodeInput").val()==keyCode){
			alert("인증되었습니다.");
			$("#join_next").removeAttr("disabled");
		}else{
			alert("인증번호를 다시 확인해주세요");
		}
	}
	
	
</script>
</head>
<body>
<form id="join_all_form" name="join_all_form" onsubmit="return false;" >
<div id="join_now_bow">
	<div>
		<button id="join_now_face">F 페이스북으로 가입하기</button>
		<button id="join_now_naver">N 네이버으로 가입하기</button>
	</div>
	<div id="hr_one">
		<div class="line">또 는</div>
	</div>
	<div class="join_div">
		<div style="text-align:left;margin-left:40px;">이름</div>
		<input id="join_now_name" name="join_now_name" type="text" placeholder="이름을 입력해 주세요"><br>
	</div>
	<div class="join_div">
		<div style="text-align:left;margin-left:40px;">이메일 주소</div>
		<div id="email_send">
				<input id="join_now_email" name="join_now_email" type="text" placeholder="이메일 주소를 입력해 주세요">
				<button id="join_email_check" name="join_email_check" onclick="mailCheck()" style="width:20%;height:45px;font-size: 12px;">중복확인</button>
				<button id="join_email_send" name="join_email_send" onclick="mailSend()" style="width:20%;height:45px;font-size: 12px;" disabled>인증하기</button>
			
		</div>
	</div>
		<div id="emailTrue" >
			<p>사용 가능한 이메일입니다.</p>
		</div>
		<div id="emailFalse">
			<p>중복된 이메일입니다. 다시 입력해주시길 바랍니다.</p>
		</div>
	<div id="email_confirm">
        <input id="keyCodeInput" name="keyCodeInput" type="text" placeholder="인증번호를 입력해주세요" >
        <Button id="keyCodeConfirm" name="keyCodeConfirm" style="width:30%;height:25px;" onClick="mailConfirm()">확인</Button>
    </div>	
	<div class="join_div">
		<div style="text-align:left;margin-left:40px;">비밀번호</div>
			<input id="join_now_pw" name="join_now_pw" type="password" placeholder="비밀번호를 입력해 주세요">
			<input id="join_now_pw_check" name="join_now_pw_check" type="password" placeholder="비밀번호를 확인합니다">
		<div id="pw_check"><h6>비밀번호가 일치하지 않습니다</h6></div>
	</div>	
	<div id="log_join">
		<button id="join_next" onclick="join()" disabled>다음</button>
	</div>
	<div>
		<hr/>
	</div>
	<div id="join_log">
		<span>이미 계정이 있으신가요? </span>
	</div>
	<div>
	</div>
	<div id="join_login">
		<a href="javascript:delogin()">기존계정으로 로그인하기</a>
	</div>
</div>
</form>      
</body>
</html>