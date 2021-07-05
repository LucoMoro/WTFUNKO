<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "it.unisa.model.UserBean"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
	<meta charset="ISO-8859-1">
	
	<style>
	input[type=submit] {
  	 margin-bottom:10px;
    border-radius: 30px;
    font-weight: 500;
    font-size: 16px;
    background-color: var(--background);
    color: white;
    width : 100%;
    height: 40px;
	}
	
	input[type=submit]:hover{
    background-color: var(--hover);
    color: var(--background);
}
	</style>
    </head>
    <body>
	 <header><%@include file="Header.jsp" %></header>
	
	<div class = "divbody" style = "margin-top : 50px">
    <div class="userbody">
        <div class="profile-card">
            <div class="imgcontainer-profile">
                <img src="./Images/Product/boba.jpg" alt="">
            </div>

            <div class="title-profile">
                <h2><i class="fa fa-user-circle info " aria-hidden="true"></i><%= utente.getNome()%>  <%= utente.getCognome() %></h2>
            </div>

            <div class="maincontainer-profile">
				<% if(utente.getIndirizzo().contentEquals(""))
				{
				%>
				 <p><i class="fa fa-home info"></i>Campo non ancora compilato <a href = "Register2.jsp" style = "color : 00ea38">clicca qui </a> per completare la registrazione</p>
				 <% }else{ %>
                <p><i class="fa fa-home info"></i> Via <%=utente.getIndirizzo() %></p>
                <%} %>
                <p><i class="fa fa-envelope info"></i><%= utente.getEmail() %></p>
                <p><i class="fa fa-phone info"></i><%= utente.getTelefono() %> </p>
                <hr>

                <div class="buttonprof-cont">
                	<form action = "Orders.jsp">
                    <input type="submit" class="buttonprofile"  value="I miei ordini">
                    </form>
                    <form action = "LogOutServlet">
                    <input type="submit" class="buttonprofile" value="Logout">
                    </form>
                </div>
            </div>

        </div>
    </div>
    
    </div>
     <footer><%@include file="Footer.html" %></footer>
    </body>
</html>