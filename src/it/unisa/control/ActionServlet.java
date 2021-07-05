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

import it.unisa.model.Cart;
import it.unisa.model.CartItem;
import it.unisa.model.ProductBean;
import it.unisa.model.DS.ProductModelDS;

/**
 * Servlet implementation class ProductAddServlet
 */

@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductModelDS model = new ProductModelDS();
      
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String x = request.getParameter("quantita");
		int q = Integer.parseInt(x);
		request.getSession().setAttribute("result", "yes");
		
		int  code  = Integer.parseInt(request.getParameter("product"));
		
		ProductBean bean = null;
		try {
			bean = model.doRetrieveByKey(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		
		ArrayList<CartItem> products = cart.getProducts();
		
		for(int i = 0; i<products.size(); i++)
		{
			if(products.get(i).getProduct().getCode() == code)
			{
				bean = 	products.get(i).getProduct();
			}
		}
		
		/*if(action.contentEquals("add")) {
			if(cart.addQuantity(bean,q)==false) 
			{
				request.getSession().setAttribute("stock", true);
				RequestDispatcher out = getServletContext().getRequestDispatcher("/Carrello.jsp");
				out.forward(request, response);
				}
			}*/
		
		if(action.contentEquals("add")) 
			{
				String result;
				if(cart.addQuantity(bean, q) == true) result = "yes";
				else result = "no";
				request.getSession().setAttribute("result", result);
			}
		
		else if(action.contentEquals("sub")) cart.removeQuantity(bean,q);
		else cart.removeProduct(bean);
		
		request.getSession().setAttribute("cart", cart);
		
		RequestDispatcher out = getServletContext().getRequestDispatcher("/CartTmp.jsp");
		out.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
