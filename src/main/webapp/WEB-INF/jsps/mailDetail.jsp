<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<form id="mailSendForm" name="mailSendForm">
		<input type="hidden" name="u.id" value="26" /> <input type="hidden"
			name="u.sex" value="2" id="u_sex" /> <input type="hidden"
			name="u.supper" value="0" id="u_supper" />
		<div class="main">
			<div class="global-width">


				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
					<div class="t">邮件信息详情</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="10px">
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left">
								<input type="text" name="mailTitle" readonly="readonly" value="${mail.mailtitle}" id="mailTitle" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">
								<div style="height: 120px">邮件内容：</div></td>
								<td align="left">
								<textarea rows="8" cols="50" readonly="readonly"  name="mailContent" id="mailContent">${mail.mailcontent}</textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">发送时间：</td>
								<td align="left"><span >${mail.mailtime}</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">
								来自：</td>
								<td align="left">
								<input type="text" name="mailsource" readonly="readonly" value="${mail.mailsource}" id="mailsource" />
							</tr>
							<tr>
								<td align="right" width="30%">
								附件：</td>
								<td align="left">
								<c:if test="${mail.mailfile==null}">
									<p>无附件</p>
								</c:if>
								<c:if test="${mail.mailfile!=null}">
									<a href="${pageContext.request.contextPath}/user/mailDownload.do/${mail.mrid}" >附件下载</a>
								</c:if>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="button" value="返回" onclick="goback(${sessionUser.id})"/>
								</td>
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
	function goback(id){
		document.location.href="${pageContext.request.contextPath}/user/mailReceive.do/"+id;
	}
	function downloadAttach(mrid){
	$.ajax({
		dataType : "text",
		type : "post",
		url : "${pageContext.request.contextPath}/user/mailDownload.do/"+mrid,
		/* success : function() {
			location.reload();
		} */
	});
	}
</script>
</html>