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

/**
 * Servlet implementation class ProdottoList
 */
@WebServlet("/ProdottoList")
public class ProdottoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ProductModelDS model = new ProductModelDS();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String franchise = request.getParameter("franchise");
		ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
		
		try {
			prodotti = model.doRetrieveByFranchise(franchise);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(prodotti == null)
		{
			System.out.println("okay");
		}
		
		for(int i = 0; i<prodotti.size();i++)
		{
			System.out.println(i);
		}
		
		request.getSession().setAttribute("prodotti", prodotti);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/TableFranchise.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
