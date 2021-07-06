package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.DS.ProductModelDS;
import it.unisa.model.Model.ProductModel;
import it.unisa.model.Cart;
import it.unisa.model.CartItem;
import it.unisa.model.ProductBean;


@WebServlet("/ProductControl")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static boolean isDataSource = true;
	
	static ProductModel model= new ProductModelDS();

	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession Sessione = request.getSession(true);
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");
		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(model.doRetrieveByKey(id));					
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("add2")) {
					int id = Integer.parseInt(request.getParameter("id"));
					int qt = Integer.parseInt(request.getParameter("qt"));
					CartItem x = new CartItem(model.doRetrieveByKey(id));
					x.setQuantity(qt);
					int k = 0;
					for(int i = 0; i<cart.size();i++)
					{
						if(x.getProduct().getCode() == cart.get(i).getProduct().getCode())
						{
							cart.get(i).setQuantity(cart.get(i).getQuantity() + x.getQuantity());
							k = 1;
						}
					}
					if(k == 0) cart.addItem(x);
					request.getSession().setAttribute("cart", cart);
				} 
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);		

		try {
			request.getSession().removeAttribute("products");
			request.getSession().setAttribute("products", model.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String Action = (String) request.getSession().getAttribute("Action");
		if(Action!= null && Action.contentEquals("view"))
		{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
