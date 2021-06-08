package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Cart;
import it.unisa.model.CartItem;
import it.unisa.model.OrderBean;
import it.unisa.model.OrderItem;
import it.unisa.model.ProductBean;
import it.unisa.model.UserBean;
import it.unisa.model.DS.OrderItemModelDS;
import it.unisa.model.DS.OrderModelDS;
import it.unisa.model.DS.ProductModelDS;
import it.unisa.model.Model.OrderItemModel;
import it.unisa.model.Model.OrderModel;


@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static OrderModelDS model = new OrderModelDS();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gg, mm, yy;
		
		Cart cart= (Cart) request.getSession().getAttribute("cart");
		
		ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		OrderItem item;
		
		for(int i=0; i<cart.size(); i++) {
			item = new OrderItem(cart.get(i));
			orderItems.add(item);
		}
		
		OrderBean orderBean = new OrderBean();
		
		orderBean.setList(orderItems);
		
		UserBean user= (UserBean) request.getSession().getAttribute("utente");
		orderBean.setID(user.getID());
		
		GregorianCalendar data= new GregorianCalendar();
		
		gg=data.get(Calendar.DATE);
		mm=data.get(Calendar.MONTH)+1;
		yy=data.get(Calendar.YEAR);
		
		orderBean.setDataOrdine("" + gg + "/" + mm + "/" + yy);
		
		orderBean.setDataConsegna("" + gg + "/" + mm + "/" + yy);
		
		cart.deleteAll();
		request.getSession().removeAttribute("cart");
		
		try {
			model.doSave(orderBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<OrderBean> orders = new ArrayList <OrderBean>();
		
		try {
			 orders = model.doRetrieveAll(user.getID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		request.getSession().setAttribute("ordini", orders);
		
		RequestDispatcher Out= getServletContext().getRequestDispatcher("/Checkout.jsp");
		Out.forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		doGet(request, response);
	}

}
