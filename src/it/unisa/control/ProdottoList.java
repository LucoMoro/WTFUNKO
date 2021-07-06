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
		ArrayList<ProductBean> prodotti1 = new ArrayList<ProductBean>();
		ArrayList<ProductBean> prodotti2 = new ArrayList<ProductBean>();
		
		prodotti1 = (ArrayList<ProductBean>) request.getSession().getAttribute("products");
		
		for(int i = 0; i< prodotti1.size(); i++)
		{
			if(prodotti1.get(i).getFranchiseName().contentEquals(franchise))	prodotti2.add(prodotti1.get(i));
		}
		
		
		request.getSession().setAttribute("prodotti", prodotti2);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/TableFranchise.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
