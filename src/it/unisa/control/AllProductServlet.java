package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AllProductServlet
 */
@WebServlet("/AllProductServlet")
public class AllProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int index = 0;
		if(request.getSession().getAttribute("index")==null)
		{
			request.getSession().setAttribute("index", index);
		}
		else index = (int) request.getSession().getAttribute("index");
		
		String action = request.getParameter("action");
		int x = 0;
		if(action.contentEquals("start"))
		{
			request.getSession().setAttribute("index", x);
		}
		else if(action.contentEquals("add"))
		{
			x = index++;
			request.getSession().setAttribute("index", index++);
		}
		else if(action.contentEquals("sub"))
		{
			x = index--;
			request.getSession().setAttribute("index", index--);
		}
		else if(action.contentEquals("set"))
		{
			x = Integer.parseInt(request.getParameter("indice"));
			index = x-1;
			request.getSession().setAttribute("index", index);
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	}
}
