<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {

		$j("#submit").on("click", function() {
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			

			$j.ajax({
				url : "/board/boardWriteAction.do",
				dataType : "json",
				type : "GET",
				data : param,
				success : function(data, textStatus, jqXHR) {
					alert('작성 완료');

					location.href = "/board/boardList.do";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패");
				}
			});
		});
	});

	function addBoard(yee) {
		
		
		$j(yee).remove();
		
		var boardHtml = '';

		boardHtml += "<table align='center'>";
		boardHtml += "<tr><td><table border='1'><tr><td width='120' align='center'>Type</td><td width='400'><select name='boardType'><option value='a01'>일반</option><option value='a02'>Q&A</option><option value='a03'>익명</option><option value='a04'>자유</option></select></tr>";
		boardHtml += "<tr><td width='120' align='center'>Title</td><td width='400'><input name='boardTitle' type='text' size='50'></td></tr>";
		boardHtml += "<tr><td height='300' align='center'>Comment</td><td valign='top'><textarea name='boardComment' rows='20' cols='55'></textarea></td></tr>";
		boardHtml += "<tr><td align='center'>Writer</td><td></td></tr></table></td></tr>";
		boardHtml += "<tr><td id='addButton' align='right'><button onclick='addBoard(this);' type='button'>추가</button></td></tr></table>";
		
		$j('#boardWrite').append(boardHtml);
		
		
	}
</script>
<body>
	<form id="boardWrite" class="boardWrite">
		<table align="center">

			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>

			<tr>
				<td align="right"><input id="submit" type="button" value="작성">
				</td>
			</tr>

			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">Type</td>
							<td width="400"><select name="boardType">
									<c:forEach var="com" items="${comList}" begin="0" end="3"
										step="1" varStatus="status">
										<option value="${com.codeId}">${com.codeName}</option>
									</c:forEach>
							</select>
						</tr>
						<tr>
							<td width="120" align="center">Title</td>
							<td width="400"><input name="boardTitle" type="text"
								size="50" value="${board.boardTitle}"></td>
						</tr>
						<tr>
							<td height="300" align="center">Comment</td>
							<td valign="top"><textarea name="boardComment" rows="20"
									cols="55">${board.boardComment}</textarea></td>
						</tr>
						<tr>
							<td align="center">Writer</td>
							<td></td>
						</tr>

					</table>
				</td>
			</tr>

			<tr>
				<td id="addButton" align="right"><button onclick="addBoard(this);" type="button">추가</button>
			</tr>

		</table>
	</form>
</body>
</html>