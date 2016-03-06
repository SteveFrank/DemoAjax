<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'validateUsername.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function createXMLHttpRequest() {
		var xmlHttp;
		try {
			return xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {
				return xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					return xmlHttp = new ActiveXObject("Micrsoft.XMLHTTP");
				} catch (e) {
					alter("无法识别您的浏览器，将会失去异步传输功能");
					throw e;
				}
			}
		}
	}

	function validate() {
		if (event.keyCode != 13 && event.keyCode != 38 && event.keyCode != 40) {
			/*获取xmlHttp对象  */
			var xmlHttp = createXMLHttpRequest();
			/*连接哪一个Servlet */
			xmlHttp.open("POST", "<c:url value='/ValidateUserName' />", true);
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			var username = document.getElementById("usernameEle");
			xmlHttp.send("username=" + username.value);
			xmlHttp.onreadystatechange = function() {
				var message = document.getElementById("msg");
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var text = xmlHttp.responseText;
					if (text == "1") {
						message.innerHTML = "<font color='red'>用户名已经被注册</font>";
					} else if (text == "2") {
						message.innerHTML = "<font color='blue'>请进行输入</font>";
					} else {
						message.innerHTML = "<font color='green'>用户名可以被注册</font>";
					}
				}
			};
		}
	}
</script>
</head>

<body>
	<h1 id="h1">Ajax用户名注册与否校验</h1>
	<form action="" method="post">
		用户名：<input type="text" id="usernameEle" onpropertychange="validate()" /><span id="msg"></span><br> 密 码：<input type="password" id="password" /><br>
		<input type="submit" value="提交" />
	</form>
</body>
</html>
