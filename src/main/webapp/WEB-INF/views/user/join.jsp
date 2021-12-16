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
</script>
<style>
	tbody tr:nth-child(5) > td > input {
		width: 30px;
	}
	
	tbody tr:nth-child(5) > td > select {
		width: 50px;
	}
</style>
<body>
	<table align="center">
		<tr>
			<td align="left"><a href="/board/boardList.do">List</a></td>
		</tr>
		<tr>
			<td>
				<table id="joinTable" border="1">
					<form>
					<tr>
						<td width="80" align="center">id</td>
						<td width="80" align="left">
							<input type="text" name="loginId">
						</td>
						<td>
							<button type="button">중복 확인</button>
						</td>
					</tr>
					<tr>
						<td width="80" align="center">pw</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					<tr>
						<td width="80" align="center">pw check</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					<tr>
						<td width="80" align="center">name</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					<tr>
						<td width="80" align="center">phone</td>
						<td width="100">
							<select>
								<option>예시1)</option>
								<option>예시2)</option>
							</select>
							-&nbsp;<input type="text" name="" width="30">
							-&nbsp;<input type="text" name="" width="30">
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td width="80" align="center">postNo</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					<tr>
						<td width="80" align="center">address</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					<tr>
						<td width="80" align="center">company</td>
						<td width="100" align="left">
							<input type="text" name="loginId">
						</td>
						<td width="120" align="right"></td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/doLogin.do">join</a></td>
		</tr>


	</table>
</body>
</html>