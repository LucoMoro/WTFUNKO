<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.getSession().setAttribute("Action", "buy");
%>
<!DOCTYPE html>
<html>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean,  it.unisa.model.CartItem , java.text.DecimalFormat"%>

<head>
<link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
.total-price input[type=submit] {
	background: var(- -background);
	width: 200px;
}

.total-price input[type=submit]:hover {
	background-color: var(- -hover);
	color: var(- -background);
}

.removeCart {
	background: var(--background);
	width: 120px;
	height: 30px;
	color: white;
	border-radius: 5px;
}

.removeCart:hover {
	background-color: var(--hover);
	color: var(- -background);
}

.signcart {
	background: var(--background);
	width: 30px;
	height: 30px;
	color: white;
	border-radius: 50%;
	font-size: 18px;
	font-weight: bold;
}

.signcart:hover {
	background-color: var(--hover);
	color: var(--background);
}
</style>

</head>
<body>

	<header><%@include file="Header.jsp"%></header>
	<div class = "divbody" style = "margin-top : 100px">

	<%  Cart cart = (Cart)request.getSession().getAttribute("cart");
        if((cart == null) || (cart.getProducts().size()==0)) {
			%>
	<div class="errorcontainer">
        <div class="errorpage">
            <img src="./Images/Product/sadness.jpg" alt="Sadness">
            <h1> IL TUO CARRELLO É VUOTO</h1>
            <p>Seleziona un prodotto per visualizzare il tuo carrello</p>
            <div class = "errorbutton">
                <a href="Home.jsp" class="aerror">Home</a>
            </div>
        </div>

    </div>
	<%}else{
        ArrayList<CartItem> carrello= cart.getProducts();
        int intPart = 0;
     	double doublePart = 0;
        %>

	<div class="cartcontainer">

		<div class="small-container cart-page">

			<table class="cart-table">
				<tr>
					<th>Prodotto</th>
					<th></th>
					<th>Prezzo</th>
				</tr>


				<% 
                	double somma=0;
                  	double bigSomma = 0;
                  	double tmp = 0;
                
                    ProductBean beancart;
                    
                    int quantità=0;
                    
                	for(int i=0; i<carrello.size(); i++)
                	{
                    beancart=carrello.get(i).getProduct();
                    quantità=carrello.get(i).getQuantity();
                     %>

				<tr>
					<td>
						<div class="cart-info">
							<img src=<%= beancart.getImg() %> class="cart-img">
							<div>
								<p>
									<%=beancart.getCode()%>:
									<%=beancart.getName()%>
								</p>
								<small><%=beancart.getPrice()%> &#8364 (Quantità
									Selezionata: <b><%= carrello.get(i).getQuantity()%></b> ) </small> <br>
								<td>
									<form action="ActionServlet" method="post" class="formcart">
										<input type="hidden" name="product"
											value=<%=beancart.getCode()%>>
										<button type="submit" name="action" value="add"
											class="signcart">+</button>

										<input type="number" name="quantita" value="1" min="1"
											max="10">
										<button type="submit" name="action" value="sub"
											class="signcart">-</button>
										<button type="submit" name="action" value="remove"
											class="removeCart">Rimuovi prodotto</button>
									</form>
								</td>
							</div>
						</div>

					</td>

					<td><%=carrello.get(i).getQuantity()*beancart.getPrice() %>
						&#8364</td>
				</tr>
				<% somma= somma + (beancart.getPrice()* quantità); %>
				<% } %>
			</table>

			<% 
				tmp = (somma*22/100);
				bigSomma = somma + tmp;
				DecimalFormat df = new DecimalFormat("###.##");
				%>


			<div class="total-price">

				<table>
					<tr>
						<td>Subtotal</td>
						<td><%= somma %> &#8364</td>
					</tr>

					<tr>
						<td>IVA</td>
						<td>22%</td>
					</tr>

					<tr>
						<td>Totale</td>
						<td><%= df.format(bigSomma) %>&#8364 <br></td>
					</tr>
				</table>

			</div>



			<div class="total-price">
				<%if(utente==null){
                        %>

				<form action="Login.jsp" method="post">
					<input type="submit" value="procedi all'acquisto"
						class="submitcart">
				</form>
				<%}

                    else if (utente.getIndirizzo().contentEquals("")) { %>
				<form action="Register2.jsp" method="post">
					<input type="submit" value="Completa Registrazione"
						class="submitcart">
				</form>

				<%}
                    else
                    { %>
				<form action="Checkout" method="post">
					<input type="submit" value="procedi all'acquisto"
						class="submitcart">
				</form>
				<%}}
                    
                             %>
				</div>

		</div>
	</div>
	
	      </div>
     <footer><%@include file="Footer.html" %></footer>
</body>
</html>