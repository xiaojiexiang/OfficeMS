<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
      <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/upload">
            <label for="name">文件名称<input type="text" id="name" name="name" /></label>
            <input type="file" name="file" />
            <button>提交</button>
      </form>
  </center>
</body>
</html>