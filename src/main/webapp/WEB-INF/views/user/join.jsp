<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {

	});
	
	$j("#loginIdCheck").on("click", function() {
		
		var loginId = $j('#loginId').val();
		
		if(loginId.length == 0){
			alert('아이디를 입력해주세요.');
			return false;
		}
		
		$j.ajax({
			
			url : "/user/loginIdCheck.do",
			dataType : "json",
			type : "POST",
			data : loginId:loginId
			success : function(data, textStatus, jqXHR) {
				
			}
		});
		
	});

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
		
		
		if(loginId.length == 0){
			alert('아이디를 입력해주세요.');
			return false;
		}
		if(loginPw.length == 0){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if(loginPwConfirm.length == 0){
			alert('비밀번호 확인을 입력해주세요.');
			return false;
		}
		if(name.length == 0){
			alert('성함을 입력해주세요.');
			return false;
		}
		
		if(loginPw.lenth <= 6 || loginPw.lenth >= 11){
			alert('6자~12자의 비밀번호를 입력해주세요.');
			return false;
		}
		
		
		if(loginPw != loginPwConfirm){
			alert('입력하신 두 비밀번호가 일치하지 않습니다.');
			return false;
		}
		
		
		var cellphoneNoRegex = /^[0-9]{4}$/;
		
		if(!cellphoneNoRegex.test(cellphoneNo_2) || !cellphoneNoRegex.test(cellphoneNo_3)){
			alert('핸드폰 번호가 올바른지 확인해주세요.');
			return false;
		}
		
		var postNoRegex = /^[0-9]{3}[-]+[0-9]{3}$/;
		
		if(!postNoRegex.test(postNo)){
			alert('우편번호가 올바른지 확인해주세요.');
			return false;
		}
		
		

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
	        	alert('회원가입이 완료되었습니다.');   
	        }

	    });
		

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
								name="loginId" id="loginId"></td>
							<td>
								<button id="loginIdCheck" type="button">중복 확인</button>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td width="100" align="left"><input type="password"
								name="loginPw"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">pw check</td>
							<td width="100" align="left"><input type="password"
								name="loginPwConfirm"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">name</td>
							<td width="100" align="left"><input type="text" name="name">
							</td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">phone</td>
							<td width="100"><select name="cellphoneNo_1">
									<c:forEach var="p" items="${phoneNumList}" begin="0" end="3"
										step="1" varStatus="status">
										<option value="${p.codeName}">${p.codeName}</option>
									</c:forEach>
							</select> -&nbsp;<input type="text" name="cellphoneNo_2" width="30">
								-&nbsp;<input type="text" name="cellphoneNo_3" width="30">
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="80" align="center">postNo</td>
							<td width="100" align="left"><input type="text"
								name="postNo"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">address</td>
							<td width="100" align="left"><input type="text"
								name="address"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">company</td>
							<td width="100" align="left"><input type="text"
								name="company"></td>
							<td width="120" align="right"></td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><input class="submit" type="submit" value="join"/></td>
			</tr>


		</table>
	</form>
</body>
</html>