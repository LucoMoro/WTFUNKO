<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@ page contentType="text/html; charset=UTF-8" 
    import="java.util.*,
    it.unisa.model.ProductBean,it.unisa.model.Cart"%>
    <head>
    <script src="jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
        <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
        
        <style >
        
        
        .prodcontainer{
    box-sizing: border-box;
    margin-top: 10%;
    padding: 0;
    font-size: 18px;
}

.prodcard{
    background: white;
    margin-left: 10%;
    margin-right: 10%;
   /* border: 1px solid grey;*/
}

.prodimage{
    margin:50px;
    width: 250px;
    background-size: cover;
    float:left;
}

.prodtitle{
    text-align: center;
}


.prodlisttitle{
    margin-top: 3%;
    margin-left: 2%;
}

.prodbuttons{
    background: white;
    margin-left: 10%;
    margin-right: 10%;
   /* border: 1px solid grey;*/
}

.prodsinglelink{
    display: grid; /* lo mette grande come lo schermo e tramite i margin evitiamo sia tutto attaccato*/
    color: #fff;
    text-align:center;
    background: var(--background);
    text-decoration: none;
    margin-left: 30%;
    margin-right: 30%;
    margin-top: 10px;
    margin-bottom: 10px;
}

.prodsinglelink:hover {
    background-color: var(--hover);
    color: var(--background);
   /* transform: scale(1.03);
    transition: all 0.18s ease-in-out;*/
}

.producth2{
    margin: 2%;
    text-align: center;
    color:black;
}


.btn-single-prod {
    text-decoration: none;
    background-color: var(--background);
    color:white;
    width:100%;
    padding:10px 20px;
    outline:none;
    font-weight: 400;
    font-size: 16px;
    letter-spacing: 1px;
    border-radius: 30px;

}

.btn-single-prod:hover{
    background-color: var(--hover);
    color:var(--background);
}

.prodinput{
    width: 80px;
    height: 20px;
}

@media (max-width: 800px){

    .prodcontainer{
        box-sizing: border-box;
        margin-bottom: 30px;
        margin-top: 150px;
        padding: 0;
        font-size: 18px;
    }

    .prodimage{
        width: 100%;
        background-size: cover;
    }

    .prodlisttitle{
        margin-top: 10%;
        margin-left: 2%;
    }

    .prodbuttons{
        background: white;
        margin-left: 4%;
        margin-right: 4%;
       /* border: 1px solid grey;*/
    }
} 
        </style>
    </head>
    <body>
    <header><%@include file="Header.jsp" %></header>
    <div class = "divbody" style = "margin-top : 200px">
    
        
        <% ProductBean product= (ProductBean) request.getAttribute("prodotto"); %>
    <div class="prodcontainer">

        <div class="prodcard">
            <img src=<%= product.getImg() %> class="imgzoom" style=" margin:50px;
            width: 250px; background-size: cover;float:left;">
            <h2 class="prodtitle"><%= product.getName() %></h2>
            <p><%= product.getDescription() %></p>
            
            <h3 class="prodlisttitle"> Descrizione </h3>
            <ul class="prodlist">
                <li>Rarirtà: <%= product.getRarity() %></li>
                <li>Dimensioni: <%= product.getDimension() %> cm </li>
                <li>Franchise: <%= product.getFranchiseName() %></li>
                <li>Serie: <%= product.getSeries() %></li>
                <li>Completa la tua collezione di Pop! <%= product.getFranchiseName() %> </li>
            </ul>
        
            <%if(product.getQuantity() !=0){%>
            <input type="number" value="1" class="prodinput" style = "height : 20px; width : 80px">
             <input type="button" value="Acquista" style = "width : 120px; height : 40px " id = "buy" onClick = "addToCart(<%= product.getCode() %>)">
            <%}else{ %>
            <p><i>Disponibile Prossimamente</i></p>
            <%} %>
        </div>
        
    </div>

    <div class="prod_container">
    
    
		<%if(product.getCode() == 55){%>
			<div class="cardp cardp1" style = "background-image: url(./Images/Product/nezuko_kamado.jpg);
    		background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Nezuko Kamado</h2>
            <p class="cardp-body">
                Sarai pronto a combattere i tuoi demoni? </p>
            <a href="Prodotto?id=56" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>
		<%}else{ %>
        <div class="cardp cardp1" style = "background-image: url(./Images/Product/Tanjiro_Kamado.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Tanjiro Kamado</h2>
            <p class="cardp-body">
                Sarai pronto a combattere i tuoi demoni? </p>
            <a href="Prodotto?id=55" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>
        <%} %>

		
		
		<%if(product.getCode() == 16){%>
			<div class="cardp cardp1" style = "background-image: url(./Images/Product/nezuko_kamado.jpg);
    		background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Nezuko Kamado</h2>
            <p class="cardp-body">
                Sarai pronto a combattere i tuoi demoni? </p>
            <a href="Prodotto?id=56" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>
		<%}else{ %>
        <div class="cardp cardp2" style = "background-image: url(./Images/Product/gl_jessica.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Green Lantern (Jessica)</h2>
            <p class="cardp-body">
            Nel giorno più splendente, nella notte più profonda, nessun FUNKO sfugga alla mia ronda</p>
            <a href="Prodotto?id=16" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>
       <%} %>

        
        <%if(product.getCode() == 1){%>
			<div class="cardp cardp1" style = "background-image: url(./Images/Product/nezuko_kamado.jpg);
    		background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Nezuko Kamado</h2>
            <p class="cardp-body">
                Sarai pronto a combattere i tuoi demoni? </p>
            <a href="Prodotto?id=56" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>
		<%}else{ %>
        <div class="cardp cardp4" style = "background-image: url(./Images/Product/venomgroot.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title"> Venom Groot</h2>
            <p class="cardp-body">
                Pronto a vedere i tuoi personaggi venomizzati? </p>
            <a href="Prodotto?id=1" class="button_prod">SCOPRI DI PIÙ</a>

            </div>
        </div>
        <%}%>
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
      
      	<script src="zoom.js"></script> 

        <script>
            mediumZoom('.imgzoom', {
                margin: 50,
                scrollOffset : 200
            })
        </script>
        

    </body>
</html>