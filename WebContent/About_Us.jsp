<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.UserBean"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
    </head>
    <body>
    
    <% UserBean utente = (UserBean) request.getSession().getAttribute("utente");%>
<header>
	<h1 class="logo"> </h1> <a href="Home.jsp"><img  id="logo" src="./Images/Logo/logo.png" alt="Logo"> </a></h1>
    <input type="checkbox" id="nav-toggle" class="nav-toggle"> <!-- è conveniente inserire classi e id per essere più specifici -->
        <!-- in questo caso si hanno classe e id: classe per css mentre id per collegarlo alla label e farli lavorare insieme-->
    <nav>
        
        <% request.getSession().setAttribute("esito", true);%>

        <ul>
            <li><a href="CartTmp.jsp"> Cart </a></li>
            <% if(utente == null)
            {
            %>
            <li><a href="Redirect?login=true"> Area Utente </a></li>
            <%}else
            	{%>
            		<li><a href="AreaUtente.jsp"> Area Utente </a></li>
            	<%}%>
        <%if(utente!= null &&utente.isAdmin())
        {%>
        	<li><a href="AreaRiservata.jsp"> Area Riservata </a></li>
         <%}%>
         
         <li><a href="SearchBar.jsp">Cerca un Prodotto</a></li>
          </ul>
        
    </nav>
    <label for="nav-toggle" class="nav-toggle-label"> <!-- for andrà a cercare un id e non la classe-->
        <!-- in questo modo non solo cliccando sulla checkbox si mostra  il menù-->
        <span></span>
    </label>
    </header>
    
    <div class = "divbody" style = "margin-top : 100px">
    
    
        <div class="containerus">

            <div class="cardus cardus1" style = "background-image: url(./Images/us/moro.jpg);
    		background-size: cover;">
                <div class="cardus-content"> 
                <h2 class="cardus-title">Morelli Luca</h2>
                <p class="cardus-body">
                    Studente di 20 anni, presso UNISA-informatica <br>
                    <b>Anno di nascita:</b> 14 ottobre 2000 <br>
                    <b>Esperienza lavorativa:</b> EasyCloud SRL</p>
                </div>
            </div>

            <div class="cardus cardus2" style = "background-image: url(./Images/us/palmisciano.jpg);
    		background-size: cover;">
                <div class="cardus-content"> 
                <h2 class="cardus-title">Palmisciano Marco</h2>
                <p class="cardus-body">
                <b>DEH, PEFFORZA!</b><br>
                    Studente di 20 anni, presso UNISA-informatica <br>
                    <b>Anno di nascita:</b> 27 maggio 2001 <br>
                    <b>Esperienza lavorativa:</b> EasyCloud SRL</p>

                </div>
            </div>

            <div class="cardus cardus3" style = "background-image: url(./Images/us/peppe.jpg);
    		background-size: cover;">
                <div class="cardus-content"> 
                <h2 class="cardus-title">Ragosta Giuseppe</h2>
                <p class="cardus-body">
                    Studente di 20 anni, presso UNISA-informatica <br>
                    <b>Anno di nascita:</b>31 gennaio 2001 <br>
                    <b>Esperienza lavorativa:</b> EasyCloud SRL</p>
                </div>
            </div>

        </div>
        </div>
        <footer><%@include file="Footer.html" %></footer>    
    </body>
</html>