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
	  <p>
	  <fieldset>
	  	<form action = "RicercaOrdiniServlet" method = "post">
	  	Inserisci da quale data cercare gli ordini <br>
	  	<input type = "date" name = "data1" required>
	  	A quale data cercarli<br>
	  	<input type = "date" name = "data2" required>
	  	<input type = "hidden"  name = "type" value = "type1">
	  	<input type = "submit" value = "ricerca">
	  	</form>
	  </fieldset> 
	  
	  <br><br>
	  
	  <fieldset>
	  	<form action = "RicercaOrdiniServlet" method = "post">
	  	Inserisci nominativo cliente per cercare ordini <input type = "text" name = "nominativo"><br>
	  	<input type = "hidden"  name = "type" value = "type2">
	  	<input type = "submit" value = "ricerca">
	  	</form>
	  </fieldset>
	  
	  <p> Premi <a href = "AreaRiservata.jsp"> qui </a>per tornare indietro</p>
</body>
</html>