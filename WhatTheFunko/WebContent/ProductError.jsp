<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean "%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Style.css" rel="stylesheet" type="text/css">
<title>WHAT THE FUNKO</title>
</head>
<body>
		<% UserBean user = (UserBean) request.getSession().getAttribute("utente") ;
		if(user==null){%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }
	  
	   if(user.isAdmin() == false)
	   {%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }%>
		
		<% String check = (String) request.getSession().getAttribute("azione"); %>
		<h3><em>OOOPSSS!!!!</em></h3>
		<% 
			if(check.contentEquals("aggiunta"))
			{
				%>
				<p>	Si è verificato un errore nell'aggiunta di un prodotto, ricontrolla i parametri</p>
				 <%	}
					else
					{
					%>
				<p>	Si è verificato un errore nella modifica di un prodotto, ricontrolla i parametri</p>
				<%} %>
		<p>Premi <a href = "ProductChange.jsp"> qui </a> per ritornare alla pagina per reinserire i parametri.</p>
</body>
</html>