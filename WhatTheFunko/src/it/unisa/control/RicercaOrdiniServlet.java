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
			int gg1 = Integer.parseInt(request.getParameter("gg1"));
			int gg2 = Integer.parseInt(request.getParameter("gg2"));
			
			int mm1 = Integer.parseInt(request.getParameter("mm1"));
			int mm2 = Integer.parseInt(request.getParameter("mm2"));
			
			int yy1 = Integer.parseInt(request.getParameter("yy1"));
			int yy2 = Integer.parseInt(request.getParameter("yy2"));
			
			GregorianCalendar date1 = new GregorianCalendar();
			GregorianCalendar date2 = new GregorianCalendar();
			GregorianCalendar orderDate = new GregorianCalendar();
			
			date1.set(Calendar.DATE, gg1);
			date1.set(Calendar.MONTH, mm1 - 1);
			date1.set(Calendar.YEAR, yy1);
			
			date2.set(Calendar.DATE, gg2);
			date2.set(Calendar.MONTH, mm2 - 1);
			date2.set(Calendar.YEAR, yy2);
			
			
			ArrayList<OrderBean> allOrders= new ArrayList<OrderBean> ();
			ArrayList<OrderBean> dateOrders = new ArrayList<OrderBean> ();
			
			
			OrderBean order = null;
			String tmp = "";
			int gg,mm,yy;
			
			{
				try {
					allOrders = model.doRetrieveAll();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				for(int i = 0; i<allOrders.size(); i++)
				{
					order = allOrders.get(i);
					tmp = order.getDataOrdine();
					gg = Integer.parseInt(tmp.substring(0,tmp.indexOf("/")));
					mm = Integer.parseInt(tmp.substring(tmp.indexOf("/") + 1,tmp.lastIndexOf("/")));
					yy = Integer.parseInt(tmp.substring(tmp.lastIndexOf("/")+1));
					
					orderDate.set(Calendar.DATE, gg);
					orderDate.set(Calendar.MONTH, mm - 1);
					orderDate.set(Calendar.YEAR, yy);
					
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
