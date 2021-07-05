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
import it.unisa.model.ProductBean;
import it.unisa.model.DS.ProductModelDS;


@WebServlet("/SetProductServlet")
public class SetProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductModelDS  model = new ProductModelDS();

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name,franchise,series,description;
		int id,rarity,price, quantity;
		double dimension;
		
		RequestDispatcher out;  
		boolean result = true;
		
		ArrayList<ProductBean> newProducts = null;
		ProductBean bean = new ProductBean();
		
		////////////////////////////////////////
		id = Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("action").contentEquals("delete"))	
			{
				try {
					model.doDelete(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					newProducts = model.doRetrieveAll();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("products", newProducts);
			}
		else
		{
			name = request.getParameter("name");
			rarity = Integer.parseInt(request.getParameter("rarity"));
			description = request.getParameter("description");
			franchise = request.getParameter("franchise");
			dimension = Double.parseDouble(request.getParameter("dimension"));	
			price = Integer.parseInt(request.getParameter("price"));
			series = request.getParameter("series");
			quantity = Integer.parseInt(request.getParameter("quantity"));
			
			try {
				model.doDelete(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			bean.setCode(id);
			bean.setQuantity(quantity);
			bean.setName(name);
			bean.setRarity(rarity);
			bean.setDescription(description);
			bean.setFranchiseName(franchise);
			bean.setDimension(dimension);
			bean.setPrice(price);
			bean.setSeries(series);
			try {
				model.doSave2(bean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		out = getServletContext().getRequestDispatcher("/ProductSuccess.jsp");
		out.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
