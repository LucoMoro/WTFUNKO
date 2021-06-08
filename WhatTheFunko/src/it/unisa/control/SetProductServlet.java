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
		
		////////////////////////////////////////
		
		// controllo che l'id è presente altrimenti vado alla pagina di errore
		id = Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("action").contentEquals("delete"))	
			{
				try {
					if(model.doDelete(id) == false)
					{
						request.getSession().setAttribute("azione", "modifica");
						out = getServletContext().getRequestDispatcher("/ProductError.jsp");
						out.forward(request,response);
						return;
					}
					else
					{
						out = getServletContext().getRequestDispatcher("/ProductSuccess.jsp");
						out.forward(request,response);
						return;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		try {
			if(model.doRetrieveByKey(id).getCode() == -1)
			{
				request.getSession().setAttribute("azione", "modifica");
				out = getServletContext().getRequestDispatcher("/ProductError.jsp");
				out.forward(request,response);
				return;
			}
		}
		catch (SQLException | ServletException | IOException e) 
		{
			e.printStackTrace();
		}
		
		
		//mi salvo il ProductBean per cambiarne i valori
		ProductBean bean = null;	
		try {
			 bean = model.doRetrieveByKey(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//elimino la vecchia versione del ProductBean
		try {
			result = model.doDelete(id);
			if(result == false)
			{
				request.getSession().setAttribute("azione", "modifica");
				out = getServletContext().getRequestDispatcher("/ProductError.jsp");
				out.forward(request,response);
				return;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		quantity = Integer.parseInt(request.getParameter("quantity"));
		
		//se la quantità è inferiore a zero, l'oggetto scompare dallo stock e non si devono fare ulteriori operazioni
		if(quantity >= 0)
		{
			
			
			name = request.getParameter("name");
			rarity = Integer.parseInt(request.getParameter("rarity"));
			description = request.getParameter("description");
			franchise = request.getParameter("franchise");
			dimension = Double.parseDouble(request.getParameter("dimension"));	
			price = Integer.parseInt(request.getParameter("price"));
			series = request.getParameter("series");
	
			//non serve cambiare l'id e non si deve cambiare il medium score
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
