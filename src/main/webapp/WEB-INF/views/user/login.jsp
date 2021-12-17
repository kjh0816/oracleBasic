<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
	});
</script>
<style>
	tr > td > input {
		width: 100px;
	}
</style>
<body>
	<form class="login">
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">id</td>
							<td width="200"><input name="boardTitle" type="text"
								size="50" value="${board.boardTitle}"></td>
						</tr>
						<tr>
							<td width="120" align="center">pw</td>
							<td width="200"><input name="boardTitle" type="text"
								size="50" value="${board.boardTitle}"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="/user/actionLogin.do">login</a></td>
			</tr>
		</table>
	</form>
</body>
</html>