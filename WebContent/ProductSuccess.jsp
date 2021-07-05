<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean "%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Style.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
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
		
		<p>L'azione è stata eseguita con successo! <br>
		Premi <a href = "ProductChange.jsp"> qui </a> per ritornare alla pagina per reinserire i parametri.
		Premi <a href = "AreaRiservata.jsp"> qui </a> per ritornare alla pagina riservata.
		</p>
</body>
</html>