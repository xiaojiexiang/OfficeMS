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
	src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
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
<script type="text/javascript">
	//返回休假列表
	function goback(id){
		location.href="${pageContext.request.contextPath}/user/leave.do/"+id;
	}
	//表单校验
	$(function() {
		$("#applyForm").validate({
			rules : {
				begintime : "required",
				endtime : "required",
				day : "required"
			},
			messages : {
				begintime : "不能为空",
				endtime : "不能为空",
				day : "不能为空"
			},
			submitHandler : function() {
				//提交Ajax
				$.ajax({
							data : $("#applyForm").serialize(),
							dataType : "text",
							type : "post",
							url : "${pageContext.request.contextPath}/user/applySubmit.do",
							success : function() {
									location.href = "${pageContext.request.contextPath}/user/toapply.do"
							}
						});
			}
		});
	})
	function  Apply_Days(){  
		var begin = document.getElementById("begintime").value;
		var end = document.getElementById("endtime").value;
		if(begin!=null&&begin!=""&&end!=null&&end!=""){
			document.getElementById("applyday").value = DateDiff(begin,end);
		}
	   }  

	   //计算天数差的函数，通用  
	   function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式  
	       var  aDate,  oDate1,  oDate2,  iDays  
	       aDate  =  sDate1.split("-")  
	       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2002格式  
	       aDate  =  sDate2.split("-")  
	       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
	       iDays  =  parseInt(Math.abs(oDate1 - oDate2)/1000/60/60/24)    //把相差的毫秒数转换为天数  
	       return  iDays  
	}
</script>
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
									value="${sessionUser.username}" id="username" readonly="readonly"/> <input
									type="hidden" name="uid" value="${sessionUser.id}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">开始时间：</td>
								<td align="left"><input type="text" name="begintime" id="begintime"
									style="width: 171px;" class="Wdate" onClick="WdatePicker()" onblur="Apply_Days()" />
									<span style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left"><input type="text" name="endtime" id="endtime"
									style="width: 171px;" class="Wdate" onClick="WdatePicker()"  onblur="Apply_Days()" />
									<span style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td><input type="text" name="day" id="applyday" readonly="readonly" /> <span
									style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">
									<div style="height: 120px">请假原因：</div>
								</td>
								<td align="left"><textarea rows="8" cols="50" name="reason"
										id="reason"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">审批人：</td>
								<td align="left"><select name="auditer">
										<c:forEach items="${adminUserList}" var="adminUser">
											<option value="${adminUser.id}">${adminUser.username}
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit"
									value="提交申请" /> 
									<input type="button" value="返回"
									onclick="goback(${sessionUser.id})" />
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

</html>