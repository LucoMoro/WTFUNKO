<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean, it.unisa.model.OrderBean "%>
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
	  
	  <%
	  	String type = (String) request.getSession().getAttribute("type");
	  	ArrayList<OrderBean> ordini = new ArrayList<OrderBean> ();
	  	OrderBean ordine;
	  	if(type.contentEquals("nominativo"))
	  	{
	  		ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("nameOrdini");
	  	}
	  	else
	  	{
	  		ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("dateOrdini");
	  	}
	  %>
	  	
	  	<table border="1">
		<tr>
			<th>ID CLIENTE</th>
			<th>ORDER CODE</th>
			<th>DATA ORDINE</th>
            <th>DATA CONSEGNA</th>
		</tr>
		
		<% for(int i = 0; i<ordini.size(); i++) 
		{
			ordine = ordini.get(i);
			
		%>
			<tr>
			<td><%=ordine.getID()%></td> 
			<td><%=ordine.getOrderCode()%></td>
			<td><%=ordine.getDataOrdine()%></td>
			<td><%=ordine.getDataConsegna()%></td>
			</tr>
		
		<% } %>
		</table>
	  
</body>
</html>