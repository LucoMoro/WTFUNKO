<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean,  it.unisa.model.CartItem"%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) request.getAttribute("prodotti");
		%>
		
		<table border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Price</th>
            <th>Rarity</th>
            <th>Dimension</th>
            <th>Franchise Name</th>
            <th>Series</th>
            <th>Medium score</th>
		</tr>
		
		<%
		for(int i = 0; i< prodotti.size(); i++)
			{
				ProductBean bean = prodotti.get(i);					
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getPrice()%></td>
			<td><%=bean.getRarity() %></td>
            <td><%=bean.getDimension() %></td>
            <td><%=bean.getFranchiseName() %></td>
            <td><%=bean.getSeries() %></td>
            <td><%=bean.getMediumScore() %></td>
			<%
			}
		%>
	</table>
				
</body>
</html>