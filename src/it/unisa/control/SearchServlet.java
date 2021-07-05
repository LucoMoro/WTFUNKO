package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.DS.ProductModelDS;
import it.unisa.model.Model.ProductModel;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductModel model = new ProductModelDS();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String src = request.getParameter("search");
		
		
		src = "" + src.toLowerCase();
		
		ArrayList<ProductBean> prodotti = null;
		ArrayList<ProductBean> prodotti2 = new ArrayList<ProductBean>();
		ProductBean product = null;
		
		try {
			prodotti = model.doRetrieveAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0; i<prodotti.size(); i++)
		{
			product = prodotti.get(i);
			if(product.getName().toLowerCase().contains(src)|| product.getSeries().toLowerCase().contains(src) || product.getFranchiseName().toLowerCase().contains(src))
			{
				prodotti2.add(product);
			}
		}
		
		request.getSession().setAttribute("ricerca", prodotti2);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SearchTable.jsp");
		dispatcher.forward(request, response);
	}

}
