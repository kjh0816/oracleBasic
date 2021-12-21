<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
		$j('#postNo').blur(function(){
			
			var postNo = $j('#postNo').val();
			
			var postNoRegex = /^[0-9]{3}[-]+[0-9]{3}$/;
			var postNoRegex2 = /^[0-9]{6}$/;
			
			
			if(postNo.lenth != 0){
				if(!postNoRegex.test(postNo) && !postNoRegex2.test(postNo)){
					
					alert('우편번호는 xxx-xxx 형식으로 입력해주세요.');
					return false;
				}	
			}
			
			
			if(postNoRegex2.test(postNo)){
				$j('#postNo').val(postNo.substr(0, 3) + '-' + postNo.substr(3,7));
			}
			
			
		});

	});
	
	
	function idCheck(isJoin) {
		
		var loginId = $j('#loginId').val();
		
		
		if(loginId.length == 0){
			alert('아이디를 입력해주세요.');
			document.getElementById('loginId').focus();
			return false;
		}
		
		
		var loginIdRegex = /^[a-z0-9]*$/;
		if(!loginIdRegex.test(loginId)){
			alert('아이디는 영소문자, 숫자만 입력할 수 있습니다.');
			document.getElementById('loginId').focus();
			return false;	
		}
		
		$j.ajax({
			
			url : "/user/loginIdCheck.do",
			dataType : "json",
			type : "POST",
			data : {
				loginId:loginId
				},
			success : function(data, textStatus, jqXHR) {
				if(!isJoin){
				if(data.msg == '0'){
					alert('사용할 수 없는 아이디입니다.');
					document.getElementById('loginId').focus();
				}else{
					
						alert('사용할 수 있는 아이디입니다.');	
					}
					
					
					
				}
			}
		});
		
		
		
	}
	
	var once = true;

	function join(form) {
		
		var loginId = form.loginId.value;
		var loginPw = form.loginPw.value;
		var loginPwConfirm = form.loginPwConfirm.value;
		var name = form.name.value;
		
		var cellphoneNo_1 = form.cellphoneNo_1.value;
		var cellphoneNo_2 = form.cellphoneNo_2.value;
		var cellphoneNo_3 = form.cellphoneNo_3.value;
		
		var postNo = form.postNo.value;
		var address = form.address.value;
		var company = form.company.value;
		
		
		var isJoin = true;
		
		if(idCheck(isJoin)){
			return false;
		}
		
		if(loginPw.length == 0){
			alert('비밀번호를 입력해주세요.');
			document.getElementById('loginPw').focus();
			return false;
		}
		if(loginPwConfirm.length == 0){
			alert('비밀번호 확인을 입력해주세요.');
			document.getElementById('loginPwConfirm').focus();
			return false;
		}
		if(name.length == 0){
			alert('성함을 입력해주세요.');
			document.getElementById('name').focus();
			return false;
		}
		
		var nameRegex = /^[가-힣]{2,10}$/;
		if(!nameRegex.test(name)){
			alert('성함은 한글만 입력할 수 있습니다.');
			document.getElementById('name').focus();
			return false;
		}
		
		if(loginPw.lenth <= 6 || loginPw.lenth >= 11){
			alert('6자~12자의 비밀번호를 입력해주세요.');
			document.getElementById('loginPw').focus();
			return false;
		}
		
		
		if(loginPw != loginPwConfirm){
			alert('입력하신 두 비밀번호가 일치하지 않습니다.');
			document.getElementById('loginPw').focus();
			return false;
		}
		
		
		var cellphoneNoRegex = /^[0-9]{4}$/;
		
		if(!cellphoneNoRegex.test(cellphoneNo_2) || !cellphoneNoRegex.test(cellphoneNo_3)){
			alert('핸드폰 번호가 올바른지 확인해주세요.');
			document.getElementById('cellphoneNo_2').focus();
			return false;
		}
		
		var postNoRegex = /^[0-9]{3}[-]+[0-9]{3}$/;
		var postNoRegex2 = /^\d{6}$/;
		
		
		if(postNo != null){
			if(!postNoRegex.test(postNo) && !postNoRegex2.test(postNo)){
				alert('우편번호는 xxx-xxx 형식으로 입력해주세요.');
				return false;
			}	
		}
		
		
		
		if(once){
		$j.ajax({
	        type: 'POST',
	        url: '/user/actionJoin.do',
	        dataType: 'json',
	        data: {
	        loginId:loginId,
	        loginPw:loginPw,
	        name:name,
	        cellphoneNo_1:cellphoneNo_1,
	        cellphoneNo_2:cellphoneNo_2,
	        cellphoneNo_3:cellphoneNo_3,
	        postNo:postNo,
	        address:address,
	        company:company
	        },
	        success: function(data, textStatus, jqXHR){
	        	
	        	if(data.msg == '0'){
	        		alert('사용할 수 없는 아이디입니다.');
	        	}else{
	        		
	        		once = false;
		        	
		        	alert('회원가입이 완료되었습니다.');
		        	
		        	window.location.href = "/user/login.do";	
	        	}
	        	
	        }

	    });
		}

	}
</script>
<style>
tbody tr:nth-child(5)>td>input {
	width: 30px;
}

tbody tr:nth-child(5)>td>select {
	width: 50px;
}

.submit {
	
}
</style>
<body>
	<form method="POST" onsubmit="join(this); return false;">
		<table align="center">
			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table id="joinTable" border="1">

						<tr>
							<td width="80" align="center">id</td>
							<td width="80" align="left"><input type="text"
								name="loginId" id="loginId" maxlength="15"></td>
							<td>
								<button id="loginIdCheck" type="button" onclick="idCheck();">중복
									확인</button>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td width="100" align="left"><input type="password"
								name="loginPw" id="loginPw" maxlength="12"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">pw check</td>
							<td width="100" align="left"><input type="password"
								name="loginPwConfirm" id="loginPwConfirm" maxlength="12"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">name</td>
							<td width="100" align="left"><input type="text" name="name"
								id="name" maxlength="10"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">phone</td>
							<td width="100"><select name="cellphoneNo_1">
									<c:forEach var="p" items="${phoneNumList}" begin="0" end="3"
										step="1" varStatus="status">
										<option value="${p.codeName}">${p.codeName}</option>
									</c:forEach>
							</select> -&nbsp;<input type="text" name="cellphoneNo_2"
								id="cellphoneNo_2" width="30" maxlength="4"> -&nbsp;<input
								type="text" name="cellphoneNo_3" id="cellphoneNo_3" width="30"
								maxlength="4"></td>
							<td></td>
						</tr>
						<tr>
							<td width="80" align="center">postNo</td>
							<td width="100" align="left"><input type="text"
								name="postNo" id="postNo"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">address</td>
							<td width="100" align="left"><input type="text"
								name="address" id="address"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">company</td>
							<td width="100" align="left"><input type="text"
								name="company" id="company"></td>
							<td width="120" align="right"></td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><input class="submit" type="submit"
					value="join" /></td>
			</tr>


		</table>
	</form>
</body>
</html>