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
	<form id="userAddForm" name="userAddForm">
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
					<div class="t">添加用户</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">工号：</td>
								<td align="left"><input type="text" name="id" value="${newId}" readonly="readonly"/><span style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">密码：</td>
								<td align="left"><input type="password" name="password" /><span
									style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="username" /><span
									style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="age" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left"><select name="gender">
										<option value="1">男
										<option value="0">女
								</select></td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left"><input type="text" name="phone" /><span
									style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><input type="text" name="address" /></td>
							</tr>
							<c:if test="${sessionUser.isadmin==2}">
								<tr>
									<td align="right" width="30%">权限：</td>
									<td align="left"><input type="checkbox" name="isadmin"
										value="1" /></td>
								</tr>
							</c:if>
							<tr>
								<td align="center" colspan="2"><input type="submit"
									value="保存数据" /> <input type="button" value="返回"
									onclick="javascript:history.back()" /></td>
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
	function vailPhone(phone){
		var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!myreg.test(phone)){
            document.getElementById("sp1").innerHTML="请输入正确的手机号";
        }
	}
	//表单校验
	$(function() {
		$("#userAddForm").validate({
			rules : {
				id : "required",
				username : "required",
				password : "required",
				phone : {
					required : true,
					digits : true,
					minlength : 11,
					maxlength : 11
				}
			},
			messages : {
				id : "工号不能为空",
				username : "姓名不能为空",
				password : "密码不能为空",
				phone : {
					required : "手机号不能为空",
					digits : "请输入正确的手机号",
					minlength : "请输入正确的手机号",
					maxlength : "请输入正确的手机号"
				}
			},
			submitHandler : function() {
				//提交Ajax
				 $.ajax({
							data : $("#userAddForm").serialize(),
							dataType : "text",
							type : "post",
							url : "${pageContext.request.contextPath}/user/userAccountSave.do",
							success : function() {
								location.href = "${pageContext.request.contextPath}/user/manageAccount.do"
							}
						}); 
			}
			
		});
	})
	
</script>
</html>