package cn.itcast.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

public class CityServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charset=UTF-8");
		/*
		 * 1、获取省份的名称
		 * 2、使用省份的名称，并且对于区域进行查找
		 * 3、转换成字符串进行发送！
		 */
		try{
			SAXReader reader = new SAXReader();//解析器
			InputStream input = this.getClass().getResourceAsStream("/china.xml");
			org.dom4j.Document doc = reader.read(input);
			/*
			 * 获取参数
			 */
			String pname = request.getParameter("pname");
			Element proEle = (Element) doc.selectSingleNode("//province[@name='"+pname+"']");
			String xmlStr = proEle.asXML();
			response.getWriter().print(xmlStr);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
}
