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
		
		$j('#loginId').on("input change keyup paste", function(){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				
				var inputVal = $j(this).val();
				var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
				
				if(check.test(inputVal)){ 
					$j(this).val(inputVal.slice(0, inputVal.length - 1)); 
					
				} 
			} 
		});
		
		
		$j('#loginPw , #loginPwConfirm').on("input change keyup paste", function(){
			
			

			
			if(($j('#loginPw').val() == $j('#loginPwConfirm').val())  && ($j('#loginPw').val().length >= 6 && $j('#loginPw').val().length <= 12)){
				
				
				var wording = '비밀번호가 일치합니다.';
				$j('#pwResult').remove()
				$j('#pwPart').append("<td id='pwResult' width='120' align='right'>"+wording+"</td>")
				
				$j("#pwResult").css("color", "green");
				
			}else if(($j('#loginPw').val().length != 0 && loginPwConfirm.length != 0) && ($j('#loginPw').val() != $j('#loginPwConfirm').val())){
				
				
				var wording = '비밀번호가 일치하지 않습니다.';
				$j('#pwResult').remove();
				$j('#pwPart').append("<td id='pwResult' width='120' align='right'>"+wording+"</td>");
				
				$j("#pwResult").css("color", "red");
				
				
			}else if($j('#loginPw').val().length > 12 || $j('#loginPw').val().length < 6){
				
				
				var wording = '6~12자리만 가능합니다.';
				$j('#pwResult').remove();
				$j('#pwPart').append("<td id='pwResult' width='120' align='right'>"+wording+"</td>");
				
				$j("#pwResult").css("color", "red");
				
			}else if($j('#loginPw').val().length == 0 && $j('#loginPwConfirm').val().length){
				
				$j('#pwResult').remove()
				$j('#pwPart').append("<td id='pwResult' width='120' align='right'></td>")
				
			}
			
			
		});
		
		$j('#name').on("input change keyup paste", function(){
			var name = $j(this).val(); 
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/; 
			if(!check.test(name)){ 
				$j(this).val($j(this).val().slice(0, $j(this).val().length - 1)); 
			}
			
			if(name.length == 6){
				$j('#name').val($j('#name').val().substr(0, 5));
			}
			
		});
		
		var cell = /^[0-9]+$/;
		var cellphoneNoRegex = /^[0-9]{4}$/;
		
		$j('#cellphoneNo_2, #cellphoneNo_3').on("input change keyup paste", function(){
			if(!cell.test($j('#cellphoneNo_2').val())){
				
				$j('#cellphoneNo_2').val($j('#cellphoneNo_2').val().slice(0, $j('#cellphoneNo_2').val().length - 1));
				
			}
			if(!cell.test($j('#cellphoneNo_3').val())){
				
				$j('#cellphoneNo_3').val($j('#cellphoneNo_3').val().slice(0, $j('#cellphoneNo_3').val().length - 1));
				
			}
		});
		
		$j('#cellphoneNo_2').on("change", function(){
			if(!cellphoneNoRegex.test($j('#cellphoneNo_2').val())){
				
				var wording = '4자리씩 입력해주십시오.';
				$j('#phoneResult').remove();
				$j('#phonePart').append("<td id='phoneResult' width='120' align='right'>"+wording+"</td>");
				
				$j("#phoneResult").css("color", "red");
				
				$j('#cellphoneNo_2').focus();
				
			}else{
				
				$j('#phoneResult').remove();
				$j('#phonePart').append("<td id='phoneResult' width='120' align='right'></td>");
				
			}
		});
		
		$j('#cellphoneNo_3').on("change", function(){
			
			if(!cellphoneNoRegex.test($j('#cellphoneNo_3').val())){
				
				var wording = '4자리씩 입력해주십시오.';
				$j('#phoneResult').remove();
				$j('#phonePart').append("<td id='phoneResult' width='120' align='right'>"+wording+"</td>");
				
				$j("#phoneResult").css("color", "red");
				
				$j('#cellphoneNo_3').focus();
				
			}else{
				
				$j('#phoneResult').remove();
				$j('#phonePart').append("<td id='phoneResult' width='120' align='right'></td>");
				
			}
		});
		
		
	$j('#postNo').on("input change keyup paste", function(){
			
			var postNo = $j('#postNo').val();
			
			var postNoRegex = /^[0-9]{6}$/;
			var postNoRegex2 = /^[0-9]+$/;
			var postNoRegex3 = /^[0-9]{3}[-]+[0-9]{3}$/;
			
			if(postNoRegex3.test($j('#postNo').val())){
				console.log('실행됨 1')
				return false;
			}
			
			if(!postNoRegex2.test(postNo)){
				console.log('실행됨 2')
				
				$j('#postNo').val( $j('#postNo').val().slice(0, $j('#postNo').val().length -1) );
			}
			
			if(postNoRegex.test(postNo)){
				console.log('실행됨 3')
				
				$j('#postNo').val($j('#postNo').val().substr(0, 3) + '-' + $j('#postNo').val().substr(3,7));
				
			}
			
			
			
			
		});
		
		

	});
		
		
		
		
		
		
	let isUsableId = false;
	let usableId = '';
	
	
	
	
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
					
						isUsableId = true;
						usableId = loginId;
						console.log('usableId: ' + usableId);
						console.log('loginId: ' + loginId);
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
		
		console.log('usableId: ' + usableId);
		console.log('loginId: ' + $j('#loginId').val());
		
		if(!isUsableId || $j('#loginId').val() != usableId){
			alert('아이디 중복을 확인해주세요.');
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
		
		var nameRegex = /^[가-힣]{2,5}$/;
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
			alert('비밀번호가 일치하지 않습니다.');
			document.getElementById('loginPwConfirm').focus();
			return false;
		}
		
		
		var cellphoneNoRegex = /^[0-9]{4}$/;
		
		if(!cellphoneNoRegex.test(cellphoneNo_2)){
			alert('핸드폰 xxxx-xxxx 형식으로 입력해주세요.');
			document.getElementById('cellphoneNo_2').focus();
			return false;
		}
		
		if(!cellphoneNoRegex.test(cellphoneNo_3)){
			alert('핸드폰 xxxx-xxxx 형식으로 입력해주세요.');
			document.getElementById('cellphoneNo_3').focus();
			return false;
		}
		
		var postNoRegex = /^[0-9]{3}[-]+[0-9]{3}$/;
		var postNoRegex2 = /^\d{6}$/;
		
		if(postNo.length != 0 && !postNoRegex.test(postNo)){
			alert('우편번호는 6자리를 입력해주세요.');
			document.getElementById('postNo').focus();
			return false;
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

#pwResult, #postNoResult, #nameResult, #phoneResult{
	font-size: 5px;
}

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
								name="loginPw" id="loginPw" maxlength="16"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr id="pwPart">
							<td width="80" align="center">pw check</td>
							<td width="100" align="left"><input type="password"
								name="loginPwConfirm" id="loginPwConfirm" maxlength="16"></td>
							<td id="pwResult" width="120" align="right"></td>
						</tr>
						<tr id="namePart">
							<td width="80" align="center">name</td>
							<td width="100" align="left"><input type="text" name="name"
								id="name" maxlength="5"></td>
							<td id="nameResult" width="120" align="right"></td>
						</tr>
						<tr id="phonePart">
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
							<td id="phoneResult" width="120" align="right"></td>
						</tr>
						<tr id="postNoPart">
							<td width="80" align="center">postNo</td>
							<td width="100" align="left"><input type="text"
								name="postNo" id="postNo" maxlength="7"></td>
							<td id="postNoResult" width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">address</td>
							<td width="100" align="left"><input type="text"
								name="address" id="address" maxlength="50"></td>
							<td width="120" align="right"></td>
						</tr>
						<tr>
							<td width="80" align="center">company</td>
							<td width="100" align="left"><input type="text"
								name="company" id="company" maxlength="20"></td>
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