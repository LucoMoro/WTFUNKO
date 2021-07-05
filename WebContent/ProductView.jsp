<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
ArrayList<ProductBean> products = (ArrayList<ProductBean>) request.getSession().getAttribute("products");
if(products == null) {
    response.sendRedirect("./product");	
    return;
}

int index = (int)request.getSession().getAttribute("index");

ProductBean product = (ProductBean) request.getAttribute("product"); //definisce una varibile di tipo ProductBean e preleva i valori

Cart cart = (Cart) request.getAttribute("cart"); //definisce una variabile di tipo Cart e preleva i valori

request.getSession().setAttribute("Action", "view"); //definisce la variabile @action= view
%>

<!DOCTYPE html>
<html>
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean "%>
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
    </head>

    <body>
	
	<header> <%@include file="Header.jsp" %></header>
    
    <div class = "divbody" style = "margin-top : 200px">
        
        <div class="c_table">

            <div class="table-container">

                <table class="table">
                    <thead>
                        <tr>
                            <th class="thimg"></th>
                            <th>Codice prodotto <a href="product?sort=code" style = "diplay : none"></a></th>
                            <th>Nome prodotto <a href="product?sort=code" style = "diplay : none"></a></th>
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
        if (products != null && products.size() != 0) {
            for(int i = 0 + index*10; i< index*10+10; i++) //1) index = 0; -> i = 0 ; i< 10 ; i++  2) index = 1; -> i = 10; i<20 ; i++
            {
                if(i == products.size()) break;
                ProductBean bean = products.get(i);
                if(bean != null){
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
                                <input type="button" value="Acquista"  id = "buy" onClick = "addToCart(<%= bean.getCode() %>)">
                                <%}else{ %>
                                <p><i>Disponibile Prossimamente</i></p>
                                <%} %>
                            </td>
                        </tr> 
                            
                    </tbody>

                    <%
                                    }}
                        } else {
                    %>
                    
                    <tr>
                        <td colspan="6">No products available</td>
                    </tr>
                    <%
                        }
                    %>

                </table>

					<%if(index == 0){%>
                   <div class="page-number-cont">
                        <ul class=" ul-page">
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=5">5</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=6">6</a></li>
                            <li><a href="AllProductServlet?action=add" class="next" id="next">  Next &gt; </a></li>
                        </ul>
                    </div>
                    <%}else if(index == 5){%>
                    
                      <div class="page-number-cont">
                        <ul class=" ul-page">
                            <li><a href="AllProductServlet?action=sub" class="prev" id="prev"> &lt; Prev </a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=5">5</a></li> 
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=6">6</a></li>
                        </ul>
                    </div>
                    <%}else{
                    
            		if(index == 1){%>
            		
            		<div class="page-number-cont">
                        <ul class=" ul-page">
                            <li><a href="AllProductServlet?action=sub" class="prev" id="prev"> &lt; Prev </a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=5">5</a></li>  
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=6">6</a></li>
                            <li><a href="AllProductServlet?action=add" class="next" id="next">  Next &gt; </a></li>
                        </ul>
                    </div>
                    <%}else if(index == 2){%>
                    
                    <div class="page-number-cont">
                        <ul class=" ul-page">
                            <li><a href="AllProductServlet?action=sub" class="prev" id="prev"> &lt; Prev </a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber "><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=5">5</a></li> 
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=6">6</a></li> 
                            <li><a href="AllProductServlet?action=add" class="next" id="next">  Next &gt; </a></li>
                        </ul>
                    </div>
                    
                    <%}else if(index == 3){ %>
                    
                    <div class="page-number-cont">
                        <ul class=" ul-page">
                            <li><a href="AllProductServlet?action=sub" class="prev" id="prev"> &lt; Prev </a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber "><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=5">5</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=6">6</a></li>
                            <li><a href="AllProductServlet?action=add" class="next" id="next">  Next &gt; </a></li>
                        </ul>
                    </div>
            </div>
			<%}else if(index == 4){%>
			<div class="page-number-cont">
                        <ul class=" ul-page">
                            <li><a href="AllProductServlet?action=sub" class="prev" id="prev"> &lt; Prev </a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=1">1</a></li>
                            <li class="PageNumber "><a href="AllProductServlet?action=set&indice=2">2</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=3">3</a></li>
                            <li class="PageNumber "><a href="AllProductServlet?action=set&indice=4">4</a></li>
                            <li class="PageNumber active"><a href="AllProductServlet?action=set&indice=5">5</a></li>
                            <li class="PageNumber"><a href="AllProductServlet?action=set&indice=6">6</a></li>
                            <li><a href="AllProductServlet?action=add" class="next" id="next">  Next &gt; </a></li>
                        </ul>
                    </div>
			<%}} %>

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