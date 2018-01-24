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
	<form id="infoEditForm" name="infoEditForm" action="infoSave.do"
		method="post">
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
					<div class="t">编辑信息</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="username"
									value="${sessionUser.username}" id="nickname" /><span
									style="color: red;">*</span> <input type="hidden" name="id"
									value="${sessionUser.id}" /> <input type="hidden"
									name="isadmin" value="${sessionUser.isadmin}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="age"
									value="${sessionUser.age}" id="age" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left"><c:if test="${sessionUser.gender==0}">
										<select name="gender">
											<option value="0">女
											<option value="1">男
										</select>

									</c:if> <c:if test="${sessionUser.gender==1}">
										<select name="gender">
											<option value="1">男
											<option value="0">女
										</select>
									</c:if></td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left"><input type="text" name="phone"
									value="${sessionUser.phone}" id="u_mobile" /><span
									style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><input type="text" name="address"
									value="${sessionUser.address}" id="u_address" /></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit"
									value="保存" /> <input type="reset" value="重置" /> <input
									type="button" value="返回" onclick="javascript:history.back()" /></td>
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
	//表单校验
	$(function() {
		$("#infoEditForm").validate({
			rules : {
				username : "required",
				phone : {
					required : true,
					digits : true,
					minlength : 11,
					maxlength : 11
				}
			},
			messages : {
				username : "姓名不能为空",
				phone : {
					required : "手机号不能为空",
					digits : "请输入正确的手机号",
					minlength : "请输入正确的手机号",
					maxlength : "请输入正确的手机号"
				}
			}
		});
	})
</script>
</html>