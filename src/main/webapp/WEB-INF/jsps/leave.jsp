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
<script>
			function setit()
			{
				document.forms[0].submit();
			}
		</script>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<form id="myForm" name="myForm" action="infoEdit.do" method="post">
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
					<div class="t">休假</div>
					<div class="pages">
						<!-- 判断一下,
						如果是普通员工,则只显示自己提交的休假申请,没有审核操作 
						如果是经理,则多出一个操作---<a>审核</a>,并且显示的是所有提交的休假申请
					-->
						<c:if test="${sessionUser.isadmin==0}">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>申请人</td>
									<td>开始时间</td>
									<td>结束时间</td>
									<td>天数</td>
									<td>审批状态</td>
									<td>原因</td>
								</tr>
								<!-- 遍历自己的休假集合 -->
								<c:forEach items="${leaveList}" var="leave">
									<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
										<td>${leave.username}</td>
										<td>${leave.begintime}</td>
										<td>${leave.endtime}</td>
										<td>${leave.day}</td>
										<c:if test="${leave.isapprove==0}">
											<td><b>未审核</b></td>
										</c:if>
										<c:if test="${leave.isapprove==1}">
											<td>已审核</td>
										</c:if>
										<td>${leave.reason}</td>
										<%-- <td><a href="javascript:void(0)"
											onclick="del(${mailrepo.mrid})">删除</a></td> --%>
									</tr>
								</c:forEach>
							</table>
							<div style="margin-top: 20px;">
								<input type="button" onclick="apply()" value="申请休假" />
							</div>
						</c:if>
						<c:if test="${sessionUser.isadmin==1}">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>申请人</td>
									<td>开始时间</td>
									<td>结束时间</td>
									<td>天数</td>
									<td>审批状态</td>
									<td>原因</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${leaveList}" var="leave">
									<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
										<td>${leave.username}</td>
										<td>${leave.begintime}</td>
										<td>${leave.endtime}</td>
										<td>${leave.day}</td>
										<c:if test="${leave.isapprove==0}">
											<td><b>未审核</b></td>
											<td>${leave.reason}</td>
										<td><a href="javascript:void(0)"
											onclick="check(${leave.leaveid})">[审核]</a></td>
										</c:if>
										<c:if test="${leave.isapprove==1}">
											<td>已审核</td>
											<td>${leave.reason}</td>
										</c:if>
										<c:if test="${leave.isapprove==2}">
											<td>审核拒绝</td>
											<td>${leave.reason}</td>
										</c:if>
										
									</tr>
								</c:forEach>
							</table>
							<div style="margin-top: 20px;">
								<input type="button" onclick="apply()" value="申请休假" />
							</div>
						</c:if>
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
	function apply(){
		location.href="${pageContext.request.contextPath}/user/toapply.do";
	}
	function check(leaveid){
		location.href="${pageContext.request.contextPath}/user/check.do/"+leaveid;
	}
</script>
</html>