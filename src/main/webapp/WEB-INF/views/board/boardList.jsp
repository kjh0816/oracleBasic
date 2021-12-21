<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<style>

table {
    border-spacing: 1px;
    
    padding: 0px;
    }
td {
    border-spacing: 1px;
    
    padding: 0px;
    }

</style>
<script type="text/javascript">

function boardListAjax() {

	

	var formData = $j('form[name=checkboxForm]').serialize();
	

	$j.ajax({
		url : "/board/boardListAjax.do",
		dataType : "json",
		type : "GET",
		data : formData,
		contentType : "application/json; charset:UTF-8",
		processData: false,
        contentType: false,
		success : function(data, textStatus, jqXHR) {
			
			$j('#totalCnt').empty();
			$j('#boardTable').empty();
			
			
			$j('#totalCnt').append("<td align='right'>total : "+data.totalCnt+"</td>");
			
			$j('#boardTable').append("<tr><td width='80' align='center'>Type</td><td width='40' align='center'>No</td><td width='300' align='center'>Title</td></tr>");
			
			for(var i = 0; i < data.boardList.length; i++){
				
				$j('#boardTable').append("<tr><td align='center'>" + data.boardList[i].extra__codeName + "</td><td>" + data.boardList[i].boardNum + "</td><td><a href='/board/"+data.boardList[i].boardType+"/"+data.boardList[i].boardNum+"/boardView.do?pageNo=0'>"+data.boardList[i].boardTitle+"</a></td><tr>");
				
				
			}

		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패");
		}

	});

}
	$j(document)
			.ready(
					function() {

						$j('input[type="checkbox"]')
								.change(
										function() {

											const allCheckBoxesCheckedLength = $j('input[name="boardTypesChecked"]:checked').length;
											const allCheckBoxesLength = $j('input[name="boardTypesChecked"]').length;

											if (allCheckBoxesLength == allCheckBoxesCheckedLength) {
												$j(
														'input[type="checkbox"][name="all"]')
														.prop('checked', true);
											} else {
												$j(
														'input[type="checkbox"][name="all"]')
														.prop('checked', false);
											}

										});

						const $allCheckBoxes = $j('input[type="checkbox"][name="all"]');
						const $checkboxes = $j('input[type="checkbox"]');

						$allCheckBoxes.change(function() {

							if (!this.checked) {
								$checkboxes.prop('checked', true);
							} else {
								$checkboxes.prop('checked', false);
							}

						});

					});

	
	
	
	
	
</script>
<body>



	<table align="center">

		<%
		String userName = (String) session.getAttribute("name");
		if (userName != null) {
		%>
		<tr>
			<td align="left"><a href="/user/doLogout.do">logout</a></td>
		</tr>

		<%
		} else {
		%>
		<tr>
			<td align="left"><a href="/user/login.do">login</a> <a
				href="/user/join.do">join</a></td>
		</tr>
		<%
			}
			%>
		<tr id="totalCnt">
			<td align="right">total : ${totalCnt}</td>
		</tr>
		<tr>
			<td align="left"><%=userName != null ? userName : ""%></td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">Type</td>
						<td width="40" align="center">No</td>
						<td width="300" align="center">Title</td>
					</tr>
					
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center">${list.extra__codeName}</td>
							<td>${list.boardNum}</td>
							<td><a
								href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardWrite.do">글쓰기</a></td>
		</tr>

		<tr align="left">
			<td>
				<form name="checkboxForm" onsubmit="boardListAjax(this); return false;" method="POST">
					<input type="checkbox" name="all" id="all"> <span>전체</span>

					<c:forEach var="com" items="${comList}" begin="0" end="3" step="1"
						varStatus="status">
						<input type="checkbox" name="boardTypesChecked"
							value="${com.codeId}">
						<span>${com.codeName}</span>
					</c:forEach>
					<button>조회</button>
				</form>
			</td>
		</tr>



	</table>









</body>
</html>