<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% UserBean utente= (UserBean) request.getSession().getAttribute("utente"); 
	request.getSession().setAttribute("Action", "buy");
%>

<!DOCTYPE html>

<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean,  it.unisa.model.CartItem"%>

<head>
<meta charset="ISO-8859-1">
<title>WHAT THE FUNKO</title>
</head>

<body>
	<h1>Questo è il tuo carrello</h1>
	
	

	<%
	if (utente!=null){ %>
		<p> Benvenuto <%= utente.getID() %> </p>
	<%}
	
	Cart cart = (Cart)request.getSession().getAttribute("cart");
	double somma=0;
	String result = (String) request.getSession().getAttribute("result");
	
	if((cart == null) || (cart.getProducts().size()==0)) {
			%>
	<p>Il tuo carrello è vuoto</p>
	<a href="ProductView.jsp"> Ritorna al sito</a>
	<a href="Orders.jsp"> Vedi i tuoi ordini</a>
	<%}
		
		else { %>
	<table border="1">
		<tr>
			<th>Code </th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Aggiungi/Sottrai</th>
		</tr>
		<%
			ArrayList<CartItem> carrello= cart.getProducts();
		
			ProductBean beancart;
			
			int quantità=0;
			
		for(int i=0; i<carrello.size(); i++){
			beancart=carrello.get(i).getProduct();
			quantità=carrello.get(i).getQuantity();
			 %>
		<tr>
			<td><%=beancart.getCode()%></td>
			<td><%=beancart.getName()%></td>
			<td><%=beancart.getPrice()%></td>
			<td><%=quantità%></td>
			<td><form action = "ActionServlet"  method = "post">
				<input type = "hidden" name = "product" value = <%=beancart.getCode()%>>
				<button type = "submit" name = "action" value = "add"> <img src =  "data:image/png;base64,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" 
				height = "15"  width = "15"> 
				</button>
				<input type = "number"   name = "quantita" value = "1" min = "1" max = "10">
				<button type = "submit" name = "action" value = "sub"> <img src =  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEX///8AAACWlpavr6/5+fnj4+Pw8PC+vr7r6+vc3NyDg4PR0dG7u7s5OTkpKSnk5ORRUVGoqKhtbW3IyMicnJwzMzNwcHCioqJISEhhYWFVVVVnZ2cuLi7X19f09PSHh4eQkJAdHR0+Pj4LCwvNzc13d3dFRUUUFBQjIyMbGxtNF04eAAAJfUlEQVR4nOVd2WLiOgwtJCSEHRL2srfQ+f8fvJPJpQSQbCnxhjmPpcQWsaUjWZI/PnQjjLq9cdZZj/qDw+nUaDROp8OgP1p3snFvE4Xax9eJdtLbrfsNMfrrTrBp255qBXSDyfkkEa6E4yTo2p4yA5v5iC5bCedsY3vqBETBpJJ0V0yCyLYIIrTGq1riFVjNW7YFgbENqq1NCIvx1rY4T0jXysQrsExti1RGlH0qli/HoOmKEdl8axCvwLcLyrWrbvdBWHxZli+VUZb6ONrckOlCu3w5zrZk3KgwfjSsbOzHdj3uwsXENNUJm0bly5EZdbTSgXEB/9pHc9sxnFmQL8fEEJfrWZIvR8+AfNHSooB/6ap2Jpf+sSpgo3GJ9QrYqTat/iybB3E3Gba34bY9TLpxMM9mFflQR6N8LbYKna72cSJ4YhI3l1PuQz+1echMFbPqpEPSc4fpjkmPNCmcPWMKp07MIyFRujswnr/XIF9I95IGWbVl1Mrou2CknOEMf4hD95t1WHLSpKqfA20HkNG90MZd12dWX0RKf1LqG8e0QTM1DkCU0YZTqG/mlPGmgboBPwLSYp2rGo7iKR1VU434SBg1UzPWTj7SQIeBiglUYK9iIAJRG6sYB0AgH1oBhZMLuNPnfIfy9VNbROkQK73HKC0pn9vXG0CqZFQqUBjSpVpL3cjMxNJEWGEr87lrGA2Zodf/AgvIXmNlS9UVP3dh7iBzKAmuV8wBaIszDXZqhZBArPEulWh4KPYmTES9yhDvmEMVhSD0B6fmj9pbQooz4j9Q6NEvbKQyiX3wPfdxwpjMt/rpkyA8bGZum5boWU098ydA6DjyNo4oYKKLZ1MwFszrk/MgEd02ZeZhiIw/g4SLNLNpK8GZG5nbRIKwk20BhTrwQo0TCZiu3SVaQLBQl7QnCH4km0rmBoG6IS2xEP++osBPbQiMBoWK4AFZW4b+Gbjpn8m/nKJfrkD9tAEncNKge4ja+k+X0upDlIZLp4kHZtxK3MVppYRTttEvaj4+ZwO3/OJcBjTT16xHTwHq9U9E30IjMwtT82YAjd2IDjBRFeXWJiwwxCa7wr+DWgoXyNozUPqGWwzsvRPpnnFgBBrdU+grdK/4ocCW+xKxc1c312gObJ0e4X/HFKlg41oHdjIFB8ExReqiHr0CozbgW9kg/+yerS8Ds/tQMh3mkbhEuJ+BebOAp4cxUjfcehyYw/8cskGcClYQ0gqQorLneATiF9qPrcmAhJUGj/+HWHvEsDgFJLXo0eojbpNrXiEExFNc3/8Xwn+mdubMBBLRuOeaCP1xl6+VQZo84lVYmjIX8OTvYoMI+XElAiwDEiEu000kM8jp4v8SInj6ZbICU3RhSMcpwHH6Ev1GfgOnKuKFQKz5bQ3CyqhvccpcwAbjpk3hl2wvIYEPmFXfjmngdyyqV3INiHMr/th9r6IM2HG4xoZhc/IqxrAALMM18xQmNC6HZ54Bc5YrrQE/vFidMB9w/kjxGRxFdDsA9Qw4yamIKsLW8HXMfQHY6BcWEbaGr8JJr4B5WUE8z9BHLge6YYDc+px/AocRX20bIrHhU37kDdv7V9uG2EbMiRmsaBTXoBoAbBFzVQO+3dcIQd0D9C/y3QbGEV9P0SCqJo8pgueir+Q5XQFWF/Sxw5tXiAQ/Ao4Mh4ilrOAbbr/GTVUYf1VIHUhASSKElbIfn6pujDVh2yt4NW6QoxvmwxMdjfdG3IUEPqUHnzAyg1CEiuRKYJ7OgjpzDDvHhEzbEjhNT3jYs+YBNujKYL+KFcEgdVyoCFYBLBhw68AGn/NgLIdDDTiNUsCfeg1n0XBO1fQ2p+NE/EB1MIK3J8Pg6+7exkgkAE1+H34FjMph3Q0+Gbm7oGkffBygP9MtkbBQUQnoUU2Q1Bw+wIJtuneoyxTeQF+m4K99gSWkt+6r2KKOAXpVIRiPOcFUh8579fdppbMPOKEElpCeradfQvpJNEy93+Ad+r8P/delB+jPXtlD/zmN/7zUf9/Ccf+QE6tB/EO3fXxWpAbx8f2P07gca2Mm8CKxNjXxUh0XQawUxUv9j3mrO7foKjy36Co8t/D/7Mn/88M3OAP2/xzf/1wM//Np/M+J8j+v7Q1yE/3PL/U/R9j/PG+kmYJPufr+11vANv+p3NtpiGtm/K978qB2DQ6G3QJq/tcf+l9D6n8dMNYC5VW4KaGW2/96fP97KrxBXwz/e5u8cn8a5BT6oT/NG/QY8r9PFKZx3a/KJ/f6QqymR/3a/O+551nfRDDH36fel3D/+FfsX4q9FSRtDbsX013uxuxB+wZ9hL3pBY3f4uB/P2+08bCT+hRN3hWpRjTP8Gxs3nRU6qsPJ7/lUHArrWKgOfTiy2Iwduqek4HfbyGJn+HX8LgV5Mcz6GXhsxBxRvy5Z8b/u4IEysaX+55Ed3a5chpV884u/+9de4O7897g/kP/77B8g3tI0SDkP3hxl+wb3Afs/53Ob3Avt3t3qyci3VAp5Bn+iJ5o3GqIrESj8VNpUbXBMu9fmPX6xVXxF3p5/R3Q2xALnM2t1KGknppRmX0P8cowZxll9Y01zuJFBjbH0kQ0fCvwBP6B1S7rEdIaX/0cTlqgWjOvSVrju9K7G1vS6tR93SHkrT06+sx/iF4Yexu9/iiE7iW6NI5MDagRUHTN8y8GOux/T0hiCuzVDCVk9P+jr1rGGDuvLUNZ8iSpa8JUpVoN0IhvGQp3h8z0X39SNSm3EWXRNBQn3XUFwaky1vVzw7+Ilf2XylQNRlvsadwwbXLaVT4i2WNX9j7ipyLZxiH2P+8wyKqxgFZG73Wz0mGEOS1MTp2YtyejdPeH8fy9Bvk+yPrm92fupLR32Up3zM4h2tzvFsEG32O62scJvqDCJG4uSYahjE+dVLhiA7r+rDkP4m7Sam/DbbuVdONg3pxRlcoDNAcXUs5u0YGL9tTzCMl5N4S1iToe3R3aRDAU4Qvxg3C9mJgLRKdspaoAn0arBUOC06gYmemThLbZpTqzUSm40dHCDMaqDpuvg1THtRbPWNgs100psYZ6ONouR97IItL1sPiyLF+ORF+35G9b++8RUabDPg6aTlVaK++bqCDioxrbQJ1mXQSOlni0xipM5GruYmXAL6JePa4zC5zafAg282qvcpG5ojop6AaTszjT4Q7HSaA4wGsE7aS3W8uCMf11J9goj+4aRRhteuOssx71B4dT/lpPp8OgP1p3snFvs9XvEv0HnvePw8dYAFAAAAAASUVORK5CYII=" 
				height = "15"  width = "15"></button>
				<button type = "submit" name = "action" value = "remove"> Rimuovi il prodotto</button>
				</form>
			</td>
		</tr>
		<% somma= somma + (beancart.getPrice()* quantità); %>
		<% } %>
		</table>
		<p>
		il totale è <%= somma %>
	</p>

		<% if(result != null && result.contentEquals("no"))
		{
			
		%>
		<h3>Non è possibile aggiungere il numero di prodotto indicato dalla richiesta, non sono presenti tali quantità in magazzino</h3>
	<%} if(utente==null){
		%>
	
	<form action="Login.jsp" method="post">
		<input type="submit" value="procedi all'acquisto">
	</form>
	<%}

else { %>
	<form action="Checkout" method="post">
		<input type="submit" value="procedi all'acquisto">
	</form>

	<%}

		} %>
<form action="ProductView.jsp" method="post">
		<input type="submit" value="Torna alla home">
	</form>
		
</body>
</html>