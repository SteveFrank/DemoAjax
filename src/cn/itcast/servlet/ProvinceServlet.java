package cn.itcast.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.io.SAXReader;
import org.junit.Test;

public class ProvinceServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charset=UTF-8");
		/*
		 * 1、Doument对象
		 *   *创建解析器对象
		 *   *调用解析器的读方法，传递一个流对象，得到Document
		 */
		try{
			SAXReader reader = new SAXReader();//解析器
			InputStream input = this.getClass().getResourceAsStream("/china.xml");
			org.dom4j.Document doc = reader.read(input);
			System.out.println(doc);
			
			/*
			 * 查询所有的province的name属性，得到一堆的属性对象
			 */
			
			List<Attribute> arrList = doc.selectNodes("//province/@name");//@表示属性
			System.out.println(arrList);
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < arrList.size() ; i++) {
				sb.append(arrList.get(i).getValue());
				if (i < arrList.size() - 1) {
					sb.append(",");
				}
			}
			response.getWriter().print(sb);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	@Test
	public void demo() throws Exception {
		SAXReader reader = new SAXReader();//解析器
		InputStream input = this.getClass().getResourceAsStream("/china.xml");
		Document doc = reader.read(input);
		System.out.println(doc);
	}

}
