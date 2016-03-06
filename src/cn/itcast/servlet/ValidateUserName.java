package cn.itcast.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidateUserName extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String username = request.getParameter("username");
		if(username.equalsIgnoreCase("南京大学") || username.equalsIgnoreCase("admin")){
			response.getWriter().print("1");
		}else if(username.equalsIgnoreCase("") ){
			response.getWriter().print("2");
		}
	}

}
