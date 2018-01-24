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
	<form id="applyForm" name="applyForm">
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
					<div class="t">休假申请</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="username"
									value="${leave.username}" readonly="readonly" /> <input
									type="hidden" name="uid" value="${leave.uid}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间：</td>
								<td align="left">
									<span >${leave.begintime}</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left">
									<span>${leave.endtime}</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td>
									<input type="text" value="${leave.day}" readonly="readonly" name="day" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">
									<div style="height: 120px">请假原因：</div>
								</td>
								<td align="left"><textarea rows="8" cols="50" name="reason"
										readonly="readonly">${leave.reason}</textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">申请人：</td>
								<td align="left"><input type="text" name="username"
									value="${leave.username}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="button" value="审核通过" onclick="approve(${leave.leaveid},${sessionUser.id})" /> 
									<input type="button" value="审核不通过" onclick="refuse(${leave.leaveid},${sessionUser.id})" />
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
	//返回休假列表
	function goback(id){
		location.href="${pageContext.request.contextPath}/user/leave.do/"+id;
	}
	function approve(leaveid,uid){
		//提交Ajax
		$.ajax({
					dataType : "text",
					type : "post",
					url : "${pageContext.request.contextPath}/user/approve.do/"+leaveid,
					success : function() {
							location.href = "${pageContext.request.contextPath}/user/leave.do/"+uid;
					}
				});
	}
	function refuse(leaveid,uid){
		//提交Ajax
		$.ajax({
					dataType : "text",
					type : "post",
					url : "${pageContext.request.contextPath}/user/refuse.do/"+leaveid,
					success : function() {
						location.href = "${pageContext.request.contextPath}/user/leave.do/"+uid;
					}
				});
	}
	
				
			
</script>
</html>