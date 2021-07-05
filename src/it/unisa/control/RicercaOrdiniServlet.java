package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
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

import it.unisa.model.OrderBean;
import it.unisa.model.DS.OrderModelDS;

/**
 * Servlet implementation class RicercaOrdiniServlet
 */
@WebServlet("/RicercaOrdiniServlet")
public class RicercaOrdiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OrderModelDS model = new OrderModelDS();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String type = request.getParameter("type");
		
		ArrayList<OrderBean> nameOrders = new ArrayList<OrderBean> ();
		
		if(type.contentEquals("type2"))
		{
			String nominativo = request.getParameter("nominativo");
			try {
				nameOrders = model.doRetrieveAll(nominativo);
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
			request.getSession().setAttribute("type", "nominativo");
			request.getSession().setAttribute("nameOrdini", nameOrders);
		}
		
		else
			{
				Date date1 = Date.valueOf(request.getParameter("data1"));
				Date date2 = Date.valueOf(request.getParameter("data2"));
			
			
			ArrayList<OrderBean> allOrders= new ArrayList<OrderBean> ();
			ArrayList<OrderBean> dateOrders = new ArrayList<OrderBean> ();
			
			
			OrderBean order = null;
			Date orderDate;
			
			{
				try {
					allOrders = model.doRetrieveAll();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				for(int i = 0; i<allOrders.size(); i++)
				{
					order = allOrders.get(i);
					orderDate = (Date) order.getDataOrdine().clone();
					
					if(orderDate.after(date1) && orderDate.before(date2))
					{
						dateOrders.add(order);
					}
				}
				
				request.getSession().setAttribute("type", "data");
				request.getSession().setAttribute("dateOrdini", dateOrders);
			}
		}
	
		RequestDispatcher out = getServletContext().getRequestDispatcher("/OrdersDisplay.jsp");
		out.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
