<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
        
        <script src = "jquery-3.5.1.min.js"></script>
        
        <style>
        #loginErrore {color : red}
        </style>
    </head>

    <body>
    <% boolean esito = (boolean) request.getSession().getAttribute("esito"); %>
        		
		<header><%@include file="Header.jsp"%></header>
		
		<div class = "divbody" style = "margin-top : 50px">
        <div class="logincontainer">
            <section class="loginsec">
                <div class="imglog">
                    <img src="./Images/Product/doc.jpg" alt="">
                </div>
                <div class="contentlogin">
                    <div class="formlog">
                        <h2> Login </h2>
                        <form action="LoginServlet" class="login" method = "post" id = "form" >

                            <div class="inputlogin">
                                <span class="login"> Username </span>
                                <input type="text" name="username" id = "username" placeholder = "Inserire Username qui">
                                <div id="usrnErr"></div>
                            </div>
                            <div class="inputlogin">
                                <span class="login"> Password </span>
                                <input type="password" name="password" id = "password" placeholder = "Inserire Password qui">
                                <div id="passErr"></div>
                            </div>
                            <div class="inputlogin">
                                <input type="button" value="Accedi" id = "submit">
                            </div> 
                            <div class="inputlogin">
                                <p> Non hai un account? <a href="Register.jsp" class="loga">Iscriviti qui</a></p>
                            </div>
                            
                            <% if(esito == false)
			{ %>
			<p id = "loginErrore"> <b>Si è verificato un errore, reinserisci i dati per accedere </b></p>
		<% } %>
                            
                            <div id = "result"></div>

                        </form>
                    </div>
                </div>

            </section>
        </div>          
                  </div>
        <footer><%@include file="Footer.html" %></footer>   
           <script type="text/javascript">
         	//usato jquery con il $
           $(document).ready(function(){
               $('#submit').click(function(){   
                   var username = $('#username').val();
                   var password = $('#password').val();
                   if(username == "")
                	   {
                	   	$('#username').css("border","1px solid red");
                	    $('#usrnErr').css("display","inline");
                        $('#usrnErr').css("color","red");
                        $('#usrnErr').css("font-size","14px").html("Campo obbligatorio" + "<br>");
                	   }
                   if(password == "")
                	   {
                	   $('#password').css("border","1px solid red");
                	   $('#passErr').css("display","inline");
                       $('#passErr').css("color","red");
                       $('#passErr').css("font-size","14px").html("Campo obbligatorio" + "<br>");
                	   }
                   $.ajax({
                       type: 'POST',
                       data: {username:username, password:password},			//il campo username del form è usrname
                       url : 'AccountCheckServlet',
                       success: function(result){			//result = quello che ritorna la servlet
                           if(result!=null && result!=""){	//se è presente un messaggio, result!=null c'è stata una collisione di nomi
                               //impostazioni css caso di errore
                           	   $('#result').css("display","inline");
                               $('#result').css("color","red");
                               $('#result').css("font-size","14px").html(result + "<br>");
                           }else{
                        	   $('#result').css("display","inline");
                               $('#result').css("color","green");
                               $('#result').css("font-size","14px").html("Combinazione corretta, ripremere per accedere" + "<br>");
                               $('#username').css("border","1px solid green");
                       	       $('#usrnErr').css("display","none");
                       	   	   $('#password').css("border","1px solid green");
                     	       $('#passErr').css("display","none");
                               $('#submit').prop("type","submit");
                           }
                       }

                   })
               });

           });
           </script>
    </body>
    </html>