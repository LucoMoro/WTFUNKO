package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.UserBean;
import it.unisa.model.DS.UserModelDS;
import it.unisa.model.Model.UserModel;

/**
 * Servlet implementation class AccountCheckServlet
 */
@WebServlet("/AccountCheckServlet")
public class AccountCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserModel model = new UserModelDS();
     
	
	private static boolean exists(String ID, String password) {
		UserBean user= new UserBean();
		try {
			user = model.doRetrieveByKey(ID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
	        
			if (ID.contentEquals(user.getID()) && password.contentEquals(user.getPassword()))
			{
				return true;
			}
			else
			{
				return false;
			}		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if(username.contentEquals("") || password.contentEquals(""))
        {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.print("  ");
        }
        else if(exists(username,password) == false)
        {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.print("Combinazione Username e Password inesistente <br>");
        }
        
	}

}
