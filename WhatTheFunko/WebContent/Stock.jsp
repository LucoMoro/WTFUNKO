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
		
		<%
			ArrayList<ProductBean> stock = (ArrayList<ProductBean>) request.getSession().getAttribute("prodotti");
			ProductBean bean;
		%>
	<table border="1">		
	<tr>
		<th>Code</th>
		<th>Name</th>
		<th>Price</th>
        <th>Quantity</th>
        <th>Rarity</th>
        <th>Dimension</th>
        <th>Franchise Name</th>
        <th>Series</th>
        <th>Medium score</th>
	</tr>	
	
		
		<% for(int i = 0; i<stock.size(); i++) 
		{
			bean = stock.get(i);
		%>
			<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getPrice()%></td>
			<td><%=bean.getQuantity()%></td>
			<td><%=bean.getRarity() %></td>
            <td><%=bean.getDimension() %></td>
            <td><%=bean.getFranchiseName() %></td>
            <td><%=bean.getSeries() %></td>
            <td><%=bean.getMediumScore() %></td>
		</tr>
		<%} %>
	</table>
		
</body>
</html>