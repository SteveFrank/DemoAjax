<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo1.jsp' starting page</title>
    
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
	
		window.onload = function() {
			var btn = document.getElementById("btn");
			btn.onclick = function() {
				//创建对象
				var xmlHttp = createXMLHttpRequest();
				//打开与服务器的连接
				xmlHttp.open("GET","<c:url value='/AServlet' />",true);
				//发送请求
				xmlHttp.send(null);
				//注册监听获取事件状态
				xmlHttp.onreadystatechange = function() {
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
						var h1 = document.getElementById("h1");
						h1.innerHTML = xmlHttp.responseText;
					}
				};
			};	
		};
	</script>
  </head>
  	<button id="btn">点击这里</button>
  	<h1 id="h1"></h1>
  <body>
  	
  </body>
</html>
