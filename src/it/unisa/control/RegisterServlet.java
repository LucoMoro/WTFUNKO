package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.UserBean;
import it.unisa.model.DS.UserModelDS;
import it.unisa.model.Model.UserModel;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static boolean isDataSource = true;

	static UserModel model= new UserModelDS();


	public RegisterServlet() 
	{

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String tipo = request.getParameter("tipo");

		UserBean user= new UserBean();
		RequestDispatcher out;
		if(tipo.contentEquals("base"))
		{
			String ID= request.getParameter("usrname");
			String password= request.getParameter("psw");
			String email=request.getParameter("email");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String numero = request.getParameter("telefono");

			user.setID(ID);
			user.setPassword(password);
			user.setEmail(email);
			user.setNome(nome);
			user.setCognome(cognome);
			user.setTelefono(numero);
			try {
				model.doSave(user);
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
			request.getSession().setAttribute("utente", user);
			out =getServletContext().getRequestDispatcher("/Home.jsp");
			out.forward(request, response);
		}
	else
	{
		user = (UserBean) request.getSession().getAttribute("utente");


		String indirizzo = request.getParameter("indirizzo");
		user.setIndirizzo(indirizzo);
		String provincia = request.getParameter("provincia");
		user.setProvincia(provincia);
		String città = request.getParameter("città");
		user.setCittà(città);
		int CVV = Integer.parseInt(request.getParameter("CVV"));
		user.setCVV(CVV);
		String codiceCarta = request.getParameter("codiceCarta");
		user.setCodiceCarta(codiceCarta);

		try {
			model.saveData(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("utente", user);
		out =getServletContext().getRequestDispatcher("/Home.jsp");
		out.forward(request, response);
	}

}


private static boolean exists(String ID, String email) {
	ArrayList <UserBean>  users= null;
	UserBean user= new UserBean();
	try {
		users = model.doRetrieveAll();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	for (int i=0; i<users.size(); i++) {
		user= users.get(i);

		if (ID.contentEquals(user.getID()) && email.contentEquals(user.getEmail())){
			return true;
		}
	}

	return false;
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
	doGet(request,response);
}

}
