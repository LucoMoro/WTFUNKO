package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.DS.ProductModelDS;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductModelDS  model = new ProductModelDS();
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name,franchise,series,description;
		int id,rarity,price, quantity;
		double dimension;
		
		RequestDispatcher out;  
		
		ProductBean bean = new ProductBean();
		
		id = Integer.parseInt(request.getParameter("id"));
		try {
			if(model.doRetrieveByKey(id).getCode() == -1)
			{
				rarity = Integer.parseInt(request.getParameter("rarity"));
				name = request.getParameter("name");
				franchise = request.getParameter("franchise");
				series = request.getParameter("series");
				description = request.getParameter("description");
				price = Integer.parseInt(request.getParameter("price"));
				dimension = Double.parseDouble(request.getParameter("dimension"));	
				quantity = Integer.parseInt(request.getParameter("quantity"));
				
				
				bean.setCode(id);
				bean.setName(name);
				bean.setRarity(rarity);
				bean.setDescription(description);
				bean.setDimension(dimension);
				bean.setFranchiseName(franchise);
				bean.setMediumScore(0);
				bean.setPrice(price);
				bean.setQuantity(quantity);
				bean.setSeries(series);
				
				try {
					model.doSave2(bean);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				out = getServletContext().getRequestDispatcher("/ProductSuccess.jsp");
				out.forward(request,response);
				return;
			}
		} catch (SQLException | ServletException | IOException e) 
		{
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("azione", "aggiunta");
		out = getServletContext().getRequestDispatcher("/ProductError.jsp");
		out.forward(request,response);
		return;
	}	
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
