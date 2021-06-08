<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean, 
	it.unisa.model.OrderBean, it.unisa.model.DS.OrderModelDS, it.unisa.model.CartItem, it.unisa.model.OrderItem, it.unisa.model.DS.ProductModelDS"%>

<head>
<meta charset="ISO-8859-1">
<title>WHAT THE FUNKO</title>
</head>

<body>
	<h2>Questi sono gli ordini che hai effettuato</h2>
	
	<% 
	ArrayList<OrderBean> ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("ordini");
	ArrayList<OrderItem> items;
	int orderCode = 0;
	ProductModelDS model = new ProductModelDS();
	ProductBean bean = null;
	int quantità;
	double somma=0;
	double bigSomma=0;
	double bigIVA;
	int code = 0;
	
	for(int i = 0; i<ordini.size(); i++)
	{
		items = ordini.get(i).getOrderItems();
		orderCode = ordini.get(i).getOrderCode();
		somma = 0;
		bigSomma = 0;	
	%>
	
	<table border="1">
			<tr>
				<th>Order Code</th>
				<th>Code</th>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
				<th>Action</th>
				<th>Date</th>
			</tr>
		<%
			for(int j = 0; j<items.size(); j++)
			{
				code = items.get(j).getProductCode();
				bean = model.doRetrieveByKey(code);
				quantità = items.get(j).getOrderQuantity();
				somma = bean.getPrice()* quantità;
				bigSomma = bigSomma+ somma;
		%>
		<tr>
			<td><%= orderCode %></td>
			<td><%=bean.getCode()%></td> 
			<td><%=bean.getName()%></td>
			<td><%=bean.getPrice()%></td>
			<td><%=quantità%></td>
			<td><%= somma %>
			<td>
			<form action="Prodotto" method="post">
					<input type="hidden" name="id" value="<%= bean.getCode() %>">
					<input type="submit" value="Dettagli">
			</form>
			</td>
			<td><%= ordini.get(i).getDataConsegna() %></td>
				<%
				 }
				bigIVA=(bigSomma*22)/100; 
				bigSomma = bigSomma + bigIVA;
				%>
			</tr>
			</table>
			<p>Il totale per l'ordine <%= orderCode %> è <%= bigSomma %></p>
	<% } %>

</body>

</html>