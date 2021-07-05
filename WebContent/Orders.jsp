<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean, 
	it.unisa.model.OrderBean, it.unisa.model.DS.OrderModelDS, it.unisa.model.CartItem, it.unisa.model.OrderItem, it.unisa.model.DS.ProductModelDS"%>

<head>
<link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
</head>

<body>

	<header><%@include file="Header.jsp"%></header>
	
	<div class = "divbody" style = "margin-top : 200px; margin-bottom : 200px">

	<% 
	ArrayList<OrderBean> ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("ordini");
	if(ordini == null)
	{%>
	<div class="errorcontainer">
        <div class="errorpage">
            <img src="./Images/Product/sadness.jpg" alt="Sadness">
            <h1> NON HAI EFFETTUATO ALCUN ORDINE</h1>
            <p>Per effettuare un ordine clicca su "<i>procedi all' acquisto</i>" nel carrello</p>
            <div class = "errorbutton">
                <a href="Home.jsp" class="aerror">Home</a>
            </div>
        </div>

    </div>
	<%}else{
	
	ArrayList<OrderItem> items;
	int orderCode = 0;
	int quantità;
	double somma=0;
	double bigSomma=0;
	double bigIVA;
	int code = 0;
	String nome;%>
	
	 <div class="c_table">

	<div class="table-container">
	
	<%
	for(int i = 0; i<ordini.size(); i++)
	{
		items = ordini.get(i).getOrderItems();
		orderCode = ordini.get(i).getOrderCode();
		somma = 0;
		bigSomma = 0;
		String data = "" + ordini.get(i).getDataOrdine().toString();
	%>

	

			<table class="table">
				<thead>
					<tr>
						<th>Codice ordine</th>
						<th>Codice prodotto</th>
						<th>Nome prodotto</th>
						<th>Prezzo</th>
						<th>Quantità</th>
						<th>Totale</th>
						<th>Data</th>
					</tr>
				</thead>

				<%
			for(int j = 0; j<items.size(); j++)
			{
				code = items.get(j).getProductCode();
				nome = items.get(j).getName();
				quantità = items.get(j).getOrderQuantity();
				somma = items.get(j).getOrderPrice()* quantità;
				bigSomma = bigSomma+ somma;
		%>

				<tbody>
					<tr>
						<td data-label="Codice ordine"><%= orderCode %></td>
						<td data-label="Codice prodotto"><%=code%></td>
						<td data-label="Nome prodotto"><%=nome%></td>
						<td data-label="Prezzo"><%=items.get(j).getOrderPrice()%></td>
						<td data-label="Quantità"><%=quantità%></td>
						<td data-label="Totale"><%= somma %></td>
						<td data-label="Data"><%= data %></td>
						<%
				                }
                            bigIVA=(bigSomma*22)/100; 
                            bigSomma = bigSomma + bigIVA;
                            %>
					</tr>

				</tbody>

			</table>

			<p>
				Il totale per l'ordine
				<%= orderCode %>
				è
				<%= bigSomma %></p>
			<% }}%>
		</div>



	</div>
</div>
        <footer><%@include file="Footer.html" %></footer>   
</body>

</html>