package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.DS.ProductModelDS;
import it.unisa.model.Model.ProductModel;

/**
 * Servlet implementation class ProductCheckServlet
 */
@WebServlet("/ProductCheckServlet")
public class ProductCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductModel model = new ProductModelDS();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int ID = Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		
		
		if(action.contentEquals("add"))
		{
			try {
				if(model.doRetrieveByKey(ID).getCode() != -1)
				{
					response.setContentType("text/html");
		            PrintWriter out = response.getWriter();
		            out.print("Product code già presente <br>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(action.contentEquals("set"))
		{
			try {
				if(model.doRetrieveByKey(ID).getCode() == -1)
				{
					response.setContentType("text/html");
		            PrintWriter out = response.getWriter();
		            out.print("Product code inesistente <br>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
