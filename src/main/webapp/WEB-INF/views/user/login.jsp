<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
		
		
		$j('#loginId').on("input change keyup paste", function(){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				
				var inputVal = $j(this).val();
				var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
				
				if(check.test(inputVal)){ 
					$j(this).val(inputVal.slice(0, inputVal.length - 1)); 
					
				} 
			} 
		});
		
	});
	
	function doLogin(form){
		
		var loginId = form.loginId.value;
		var loginPw = form.loginPw.value;
		
		if(loginId.length == 0){
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return false;
		}
		
		if(loginPw.length == 0){
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return false;
		}
		
		if(loginPw.lenth <= 6 || loginPw.lenth >= 11){
			alert('6자~12자의 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return false;
		}
		
		
		$j.ajax({
	        type: 'POST',
	        url: '/user/actionLogin.do',
	        dataType: 'json',
	        data: {
	        loginId:loginId,
	        loginPw:loginPw
	        },
	        success: function(data, textStatus, jqXHR){
	        	if(data.msg == '0'){
	        		alert("일치하는 회원이 존재하지 않습니다.");
	        	}
	        	else{
	        		alert("환영합니다.");	
	        		window.location.href = "/board/boardList.do";
	        	}
	        }
		
		
		
		
		});
	}	
</script>
<style>
tr>td>input {
	width: 100px;
}

span {
	cursor: pointer;
}
</style>
<body>
	<form class="login" onsubmit="doLogin(this); return false;">
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">id</td>
							<td width="200"><input  name="loginId" type="text" size="50" autofocus="autofocus" maxlength="15"></td>
						</tr>
						<tr>
							<td width="120" align="center">pw</td>
							<td width="200"><input name="loginPw" type="password" size="50" maxlength="16"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><button>login</button></td>
			</tr>
		</table>
	</form>
</body>
</html>