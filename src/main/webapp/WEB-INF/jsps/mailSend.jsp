<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="multipart/form-data; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<style type="text/css">
label {
	clear: left;
	color: red;
	margin-top: 13px;
	width: 60px;
	font: 600 10px 宋体;
}
</style>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<form id="mailSendForm" name="mailSendForm"
		enctype="multipart/form-data">
		<div class="main">
			<div class="global-width">


				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"
	content="multipart/form-data; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<jsp:include page="left.jsp"></jsp:include>
	</div>
</body>
				</html>

				<div class="action">
					<div class="t">发送邮件</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="10px">
							<tr>
								<td align="right" width="30%">收件人：</td>
								<td align="left"><select name="receiveId"
									style="width: 110px">
										<option value="">请选择联系人
											<c:forEach items="${userList}" var="user">
												<c:if test="${user.id!=sessionUser.id}">
													<option value="${user.id}">${user.username}(${user.id})
												</c:if>
											</c:forEach>
								</select><span style="color: red;">*</span> <input type="hidden"
									name="sendId" value="${sessionUser.id}" /> <input
									type="hidden" name="sendUname" value="${sessionUser.username}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left"><input type="text" name="mailTitle"
									id="mailTitle" /> <span style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%"><div style="height: 120px">邮件内容：</div></td>
								<td align="left"><textarea rows="8" cols="50"
										name="mailContent" id="mailContent"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">上传附件：</td>
								<td align="left"><input type="file" name="mailFile"
									id="mailFile" /><span id="filetip" style="color: red;">*</span></td>
							</tr>

							<tr>
								<td align="center" colspan="2"><input type="submit"
									value="发送邮件" /></td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
<script type="text/javascript">
var max_size = 9437184;
$("#mailFile").change(function(evt) {
	var finput = $(this);
	var files = evt.target.files;
	var output = [];
	for (var i = 0, f; f = files[i]; i++) {
		if (f.size > max_size) {
			$("#filetip").html("* 上传文件不能超过9M");
			$(this).val('');
		}else{
			$("#filetip").html("");
		}
	}
});

	//表单校验
	$(function() {
		$("#mailSendForm")
				.validate(
						{
							rules : {
								receiveId : "required",
								mailTitle : "required",
								mailFile : "required"
							},
							messages : {
								receiveId : "请选择一个收件人",
								mailTitle : "标题不能为空",
								mailFile : "附件不能为空"
							},
							submitHandler : function() {
								var formdata = new FormData(document.getElementById("mailSendForm"));
								//提交Ajax
								$.ajax({
											/**
											 *必须false才会自动加上正确的Content-Type
											 */
											contentType : false,
											/**
											 * 必须false才会避开jQuery对 formdata 的默认处理
											 * XMLHttpRequest会对 formdata 进行正确的处理
											 */
											processData : false,
											data : formdata,
											dataType : "text",
											type : "post",
											url : "${pageContext.request.contextPath}/user/toSend.do",
											success : function() {
												location.href = "${pageContext.request.contextPath}/user/mailSend.do"
											}
										});
							}
						});
	})
</script>
</html>