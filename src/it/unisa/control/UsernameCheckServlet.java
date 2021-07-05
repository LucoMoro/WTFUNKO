package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.UserBean;
import it.unisa.model.DS.UserModelDS;
import it.unisa.model.Model.UserModel;

/**
 * Servlet implementation class UsernameCheckServlet
 */
@WebServlet("/UsernameCheckServlet")
public class UsernameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserModel model= new UserModelDS();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user;
        String username = request.getParameter("username");

        try {
            user = model.doRetrieveByKey(username);
            if(user!=null && (user.getID().contentEquals("") == false))
            {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Username già presente <br>");
            }
        } catch (SQLException e) {
            System.out.println("Errore UsernameCheck: "+e.getMessage());
        }
	}
}
