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
    
    <title>My JSP 'demo3.jsp' starting page</title>
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
			var xmlHttp = createXMLHttpRequest();
			xmlHttp.open("get","<c:url value='/ProvinceServlet'/>",true);
			xmlHttp.send(null);
			xmlHttp.onreadystatechange = function() {
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
					var text = xmlHttp.responseText;
					
					var arr = text.split(",");
					for(var i = 0;i < arr.length;i++){
						//创建指定名称的元素
						var option = document.createElement("option");
						option.value = arr[i];//设置实际的值
						var textNode = document.createTextNode(arr[i]);//创建文本节点
						option.appendChild(textNode);//添加文本子节点
						document.getElementById("p").appendChild(option);
					}
				}
			};
		};
		
		function selectCity(){
			var xmlHttp = createXMLHttpRequest();
			xmlHttp.open("POST","<c:url value='/CityServlet'/>",true);
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			var pname = document.getElementById("p").value;
			xmlHttp.send("pname="+pname);
			xmlHttp.onreadystatechange = function() {
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
					var citySelect = document.getElementById("c");
					var optionEleList = citySelect.getElementsByTagName("option");
					while(optionEleList.length > 1){
						citySelect.removeChild(optionEleList[1]);//总是删除第一个下标，因为删除1了下面的会顶上来
					}
					var doc = xmlHttp.responseXML;
					var cityElementList = doc.getElementsByTagName("city");
					for(var i=0;i<cityElementList.length;i++){
						var cityElement = cityElementList[i];
						var cityName;
						if(window.addEventListener) {
							cityName = cityElement.textContent;//支持火狐等浏览器
						} else{
							cityName = cityElement.text;//支持IE
						}
						
						var option = document.createElement("option");
						option.value = cityName;
						var textNode = document.createTextNode(cityName);
						option.appendChild(textNode);
						//定义在之前：var citySelect = document.getElementById("c");
						citySelect.appendChild(option);
					}
				}
			};
		}
		
	</script>
  </head>
  
  <body>
    <h1 id="h1"></h1>
    <h1>省市联动</h1>
    <select name="province" id="p" onchange="selectCity()">
    	<option>===请选择省===</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <select name="city" id="c">
    	<option>===请选择市===</option>
    </select>
  </body>
</html>
