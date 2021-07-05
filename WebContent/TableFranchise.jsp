<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean,  it.unisa.model.CartItem"%>
<head>
    <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
    <script src="jquery-3.5.1.min.js"></script>
    
    <style>
    	input[type=submit] {
  	 margin:2px;
    font-weight: 500;
    font-size: 16px;
    background-color: var(--background);
    color: white;
    width : 100px;
    height: 35px;
	}
	
	input[type=submit]:hover{
    background-color: var(--hover);
    color: var(--background);
}

#buy {
  	 margin:2px;
    font-weight: 500;
    font-size: 16px;
    background-color: var(--background);
    color: white;
    width : 100px;
    height: 35px;
	}
	
	#buy:hover{
    background-color: var(--hover);
    color: var(--background);
}
    </style>
<title>Insert title here</title>
</head>
<body>
		<%
		ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) request.getSession().getAttribute("prodotti");
		%>
		
		
		<header> <%@include file="Header.jsp" %></header>
		<div class = "divbody" style = "margin-top : 100px">
		
		<%if(prodotti == null){ %>
		
		<div class="errorcontainer">
        <div class="errorpage">
            <img src="./Images/Product/sadness.jpg" alt="Sadness">
            <h1> OPSSSS SI É VERIFICATO UN PROBLEMA</h1>
            <p> Ci scusiamo per l'inconveniente creato</p>
                 </p>
            <div class = "errorbutton">
                <a href="Home.jsp" class="aerror">Home</a>
            </div>
        </div>

    </div>
    <%}else{ %>
    
    <br><br><br><br><br><br><br>
		
		<div class="c_table">

            <div class="table-container">

    <table class="table">
                    <thead>
                        <tr>
                            <th class="thimg">Immagine</th>
                            <th>Codice prodotto <a href="product?sort=code" style="display: none"></a></th>
                            <th>Nome prodotto <a href="product?sort=code" style="display: none"></a></th>
                            <th>Prezzo</th>
                            <th>Rarità</th>
                            <th>Disponibilità</th>
                            <th>Franchise</th>
                            <th>Serie</th>
                            <th>Score medio</th>
                            <th>Altro</th>
                        </tr>
                    </thead>
		
		<%
		for(int i = 0; i< prodotti.size(); i++)
			{
				ProductBean bean = prodotti.get(i);					
		%>
			<tbody>
                <tr>
                     <td data-label="Immagine"><img src= <%= bean.getImg() %> class="timg"></td>
                    <td data-label="Codice prodotto"> <%=bean.getCode()%> </td>
                    <td data-label="Nome prodotto"><%=bean.getName()%></td>
                    <td data-label="Prezzo"><%=bean.getPrice()%> &#8364</td>
                    <td data-label="Rarità"><%=bean.getRarity() %></td>
                    <%if(bean.getQuantity() == 0) 
                            {
                            %>
                            <td data-label="Disponibilità"> <span class="NDisponibile"> [ No ]</span></td>
                            <%}else{ %>
                            <td data-label="Disponibilità"> <span class="YDisponibile"> [ Si ]</span></td>
                            <%} %>
                    <td data-label="Franchise"> <%=bean.getFranchiseName() %></td>
                    <td data-label="Serie"><%=bean.getSeries() %></td>
                    <td data-label="Score medio"><%=bean.getMediumScore() %></td>
                    <td data-label="Altro">
                        <form action="Prodotto" method="post">
                            <input type="hidden" name="id" value="<%= bean.getCode() %>"> 
                            <input type="submit" value="Info">
                        </form>
							<%if(bean.getQuantity() != 0) 
                            {
                            %>
                                 <input type="button" value="Acquista" id = "buy" onClick = "addToCart(<%= bean.getCode() %>)">
                                <%}else{ %>
                                <p><i>Disponibile Prossimamente</i></p>
                                <%} %>
                    </td>
                </tr> 
                    
            </tbody>
			<%
			}}
		%>
	</table>
	</div>
	</div>
 </div>
        <footer><%@include file="Footer.html" %></footer> 
	<script type = "text/javascript">
      function addToCart(i){
          var action = "addC";
          var id = i;
          $.ajax({
              type: 'GET',
              data:{action : action, id : id},
              url: 'ProductControl',
          })
      }
      </script>
				
</body>
</html>