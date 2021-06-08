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
		
		request.setAttribute("prodotti", prodotti);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Prova2.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
