<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.UserBean"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<% UserBean utente = (UserBean) request.getSession().getAttribute("utente");%>

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
            <li><a href="About_Us.jsp"> About Us </a></li>
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
</body>
</html>