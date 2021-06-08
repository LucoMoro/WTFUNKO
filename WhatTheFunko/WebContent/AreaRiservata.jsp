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
	  
	  <p> Benvenuto FunkoAdmin, qui puoi decidere cosa fare</p> <br><br>
	  <p> Premi <a href = "ProductView.jsp"> qui</a> per visualizzare il catalogo <p> <br><br>
	  <p> Premi <a href = "ProductChange.jsp"> qui</a> per operare sui prodotti </p> <br><br>
	  <p> Premi <a href = "StockServlet"> qui</a> per visualizzare le quantità dei prodotti in magazzino </p> <br><br>
	  <p> Premi <a href = "AdminOrders.jsp"> qui</a> per visualizzare gli ordini dei clienti </p> <br><br>
</body>
</html>