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
	
	<form action="AddProductServlet" method="post">
		<fieldset>
			<p>
				Inserici un nuovo articolo:<br>
				 id: <input type="number" name="id" value="" /><br> 
				 quantity: <input type="number" name="quantity" value="" /> <br> 
				 price: <input type="number" name="price" value="" /> <br> 
				 name: <input type="text" name="name" value="" /> <br> 
				 description  <input type="text" name="description" value="" /> <br>
				 franchise :  <input type="text" name="franchise" value="" /> <br>
				 rarity :  <input type="number" name="rarity" value="" /> <br>
				 dimension : <input type="number" name="dimension" value="" /> <br>
				 series : <input type="text" name="series" value="" /> <br>
				 <input type="submit" value="Aggiungi Articolo" /> &nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
	
	<br> <br> <br> <br>
	
	<form action="SetProductServlet" method="post">
		<fieldset>
			<p>
				Inserici l'articolo articolo con i nuovi valori:<br>
				 id: <input type="number" name="id" value="" /><br> 
				 quantity: <input type="number" name="quantity" value="" /> <br> 
				 price: <input type="number" name="price" value="" /> <br> 
				 name: <input type="text" name="name" value="" /> <br> 
				 description  <input type="text" name="description" value="" /> <br>
				 franchise :  <input type="text" name="franchise" value="" /> <br>
				 rarity :  <input type="number" name="rarity" value="" /> <br>
				 dimension : <input type="number" name="dimension" value="" /> <br>
				 series : <input type="text" name="series" value="" /> <br>
				 <input type = "hidden" name = "action" value = "change"> 
				 <input type="submit" value="Cambia Articolo" />&nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
	<br><br><br>
	<form action="SetProductServlet" method="post">
		<fieldset>
			<p>
				 Rimuovi articolo:<br>
				 id: <input type="number" name="id" value="" /><br>
				 <input type = "hidden" name = "action" value = "delete"> 
				 <input type="submit" value="Rimuovi Articolo" />&nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
</body>
</html>