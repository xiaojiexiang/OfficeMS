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

</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<form id="" name="">
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
					<div class="t">账户管理列表</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>工号</td>
								<td>姓名</td>
								<td>手机</td>
								<td>地址</td>
							</tr>
							<c:forEach items="${userList}" var="aUser">
								<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
									<td>${aUser.id}</td>
									<td>${aUser.username}</td>

									<td>${aUser.phone}</td>
									<td>${aUser.address}</td>
								</tr>
							</c:forEach>
						</table>
						<div style="margin-top: 20px;">
							<input type="button" onclick="addAccount()" value="添加数据" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
<script type="text/javascript">
	function mouseOut(obj) {
		obj.style.backgroundColor = "white";
	}
	function mouseOver(obj) {
		obj.style.backgroundColor = "#e8e8e8";
	}
	
	function addAccount(){
		location.href="${pageContext.request.contextPath}/user/addAccount.do";
	}
</script>
</html>