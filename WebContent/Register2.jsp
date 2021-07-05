<!DOCTYPE html>
<html>

<%@ page contentType="text/html; charset=UTF-8"
	import="it.unisa.model.UserBean"%>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
        
        <script src = "jquery-3.5.1.min.js"></script>
    </head>

    <body>
        <header><%@include file="Header.jsp" %></header>
    
   <div class = "divbody" style = "margin-top : 50px">

        <div class="regcontainer" style="margin-top:200px; margin-bottom:200px">
            <section class="regsec">
                <div class="imgreg">
                    <img src="./Images/Product/doc.jpg" alt="doc">
                </div>
                
                <div class="contentreg">
                    <div class="formreg">
                        
                        <form action="RegisterServlet"  method = "post" class="register" onSubmit = "event.preventDefault(); validate(this)">
                        <input type = "hidden" name = "tipo" value = "altro">
                            <h2> Informazioni Consegna </h2>
                            <div class="inputreg">
                                <span class="register"> Inserisci indirizzo e numero civico </span>
                                <input type="text"  id = "indirizzo"  style="text-transform:uppercase" name="indirizzo" placeholder = "XIV Maggio 27">
                                <div id = "indirizzoRes"></div>
                            </div>

                            <div class="inputreg">
                                <span class="register"> Inserisci provincia  </span>
                                <input type="text"  id = "provincia"  style="text-transform:uppercase" name="provincia" placeholder = "NA">
                                <div id = "provinciaRes"></div>
                            </div>

                            <div class="inputreg">
                                <span class="register"> Inserisci città </span>
                                 <input type="text"  id = "city"  style="text-transform:uppercase" name="città" placeholder = "NAPOLI">
                                <div id = "cityRes"></div>
                            </div>

                            <h2> Informazioni Pagamento </h2>
                           <p><small>Questa sarà la carta predefinita per il pagamento</small></p><br>
                            <div class="inputreg">
                                <span class="register"> Inserisci CVV</span>
                                <input type="number"  id = "CVV"  style="text-transform:uppercase" name="CVV" placeholder = "xxx">
                                <div id = "CVVRes"></div>
                            </div>

                            <div class="inputreg">
                                <span class="register"> Inserisci codice carta </span>
                                <input type="text"  id = "code" name="codiceCarta" placeholder = "xxxx xxxx xxxx xxxx">
                                <div id = "codeRes"></div>
                            </div>

                            <div class="inputreg">
                                <input type="submit" value="Procedi con l'inserimento" id = "btn">
                            </div>
                        </form>
                    </div>
                </div>

            </section>
        </div>
        
 </div>
        <footer><%@include file="Footer.html" %></footer> 
          
            <script type = "text/javascript">
            $(document).ready(function(){
        		$('#indirizzo').change(function(){
        		var indirizzo = $('#indirizzo').val().toUpperCase();
        		var upperCaseLetters = /[A-Z]/g;
        		var numbers = /[0-9]/g;
        		if(indirizzo.match(upperCaseLetters) && indirizzo.match(numbers))
        			{
        			 $('#indirizzo').css("border","1px solid green");
					 $('#indirizzoRes').css("display","inline");
					 $('#indirizzoRes').css("color","green");
					 $('#indirizzoRes').css("font-size","14px").html("Formato indirizzo corretto <br>");
        			}
        		else
        			{
        			 $('#indirizzo').css("border","1px solid red");
					 $('#indirizzoRes').css("display","inline");
					 $('#indirizzoRes').css("color","red");
					 $('#indirizzoRes').css("font-size","14px").html("Formato indirizzo incorretto <br>");
        			}
        		});
            });
            </script>
            
            <script type = "text/javascript">
            $(document).ready(function(){
        		$('#provincia').change(function(){
        		var provincia = $('#provincia').val().toUpperCase();
        		var upperCaseLetters = /[A-Z]/g;
        		if(provincia.match(upperCaseLetters) && provincia.length == 2)
        			{
        			 $('#provincia').css("border","1px solid green");
					 $('#provinciaRes').css("display","inline");
					 $('#provinciaRes').css("color","green");
					 $('#provinciaRes').css("font-size","14px").html("Formato provincia corretto <br>");
        			}
        		else
        			{
        			 $('#provincia').css("border","1px solid red");
					 $('#provinciaRes').css("display","inline");
					 $('#provinciaRes').css("color","red");
					 $('#provinciaRes').css("font-size","14px").html("Formato provincia incorretto <br>");
					 }
        		});
            });
            </script>
            
            <script type = "text/javascript">
            $(document).ready(function(){
        		$('#city').change(function(){
        		var city = $('#city').val().toUpperCase();
        		var upperCaseLetters = /[A-Z]/g;
        		if(city.match(upperCaseLetters) && city.length > 3)
        			{
        			 $('#city').css("border","1px solid green");
					 $('#cityRes').css("display","inline");
					 $('#cityRes').css("color","green");
					 $('#cityRes').css("font-size","14px").html("Formato città corretto <br>");
        			}
        		else
        			{
        			 $('#city').css("border","1px solid red");
					 $('#cityRes').css("display","inline");
					 $('#cityRes').css("color","red");
					 $('#cityRes').css("font-size","14px").html("Formato città incorretto <br>");
        			}
        		});
            });
            </script>
            
            <script type = "text/javascript">
            $(document).ready(function(){
        		$('#CVV').change(function(){
        		var CVV = $('#CVV').val();
        		var numbers = /[0-9]/g;     
        		if(CVV.match(numbers) && CVV.length == 3)
        			{
        			 $('#CVV').css("border","1px solid green");
					 $('#CVVRes').css("display","inline");
					 $('#CVVRes').css("color","green");
					 $('#CVVRes').css("font-size","14px").html("Formato CVV corretto <br>");
        			}
        		else
        			{
        			 $('#CVV').css("border","1px solid red");
					 $('#CVVRes').css("display","inline");
					 $('#CVVRes').css("color","red");
					 $('#CVVRes').css("font-size","14px").html("Formato CVV incorretto <br>");
        			}
        		});
            });
            </script>
            
            <script type = "text/javascript">
            $(document).ready(function(){
        		$('#code').change(function(){
        		var code = $('#code').val();
        		var numbers = /[0-9]/g;     
        		if(code.match(numbers) && code.length == 16)
        			{
        			 $('#code').css("border","1px solid green");
					 $('#codeRes').css("display","inline");
					 $('#codeRes').css("color","green");
					 $('#codeRes').css("font-size","14px").html("Formato code corretto <br>");
        			}
        		else
        			{
        			 $('#code').css("border","1px solid red");
        			 $('#codeRes').css("display","inline");
					 $('#codeRes').css("color","red");
					 $('#codeRes').css("font-size","14px").html("Formato code incorretto <br>");
        			}
        		});
            });
            </script>
            
            <script>
            function validate(obj)
    		{
    			var valid = true;
    			
    			var indirizzo = $('#indirizzo').val();
    			if(indirizzo == "")
    				{
    				valid = false; 
    				$('#indirizzo').css("border","1px solid red");
    				 $('#indirizzoRes').css("display","inline");
					 $('#indirizzoRes').css("color","red");
					 $('#indirizzoRes').css("font-size","14px").html("Campo Obbligatorio <br>");
    				}
    			
    			var provincia = $('#provincia').val();
    			if(provincia == "")
    				{
    				valid = false; 
    				$('#provincia').css("border","1px solid red");
    				 $('#provinciaRes').css("display","inline");
					 $('#provinciaRes').css("color","red");
					 $('#provinciaRes').css("font-size","14px").html("Campo Obbligatorio <br>");
    				}
    			
    			var city = $('#city').val();
    			if(city == "")
    				{
    				valid = false; 
    				$('#city').css("border","1px solid red");
    				 $('#cityRes').css("display","inline");
					 $('#cityRes').css("color","red");
					 $('#cityRes').css("font-size","14px").html("Campo Obbligatorio <br>");
    				}
    			
    			var CVV = $('#CVV').val();
    			if(CVV == "")
    				{
    				valid = false; 
    				$('#CVV').css("border","1px solid red");
    				 $('#CVVRes').css("display","inline");
					 $('#CVVRes').css("color","red");
					 $('#CVVRes').css("font-size","14px").html("Campo Obbligatorio <br>");
    				}
    			
    			var code = $('#code').val();
    			if(code == "")
    				{
    				valid = false; 
    				$('#code').css("border","1px solid red");
    				 $('#codeRes').css("display","inline");
					 $('#codeRes').css("color","red");
					 $('#codeRes').css("font-size","14px").html("Campo Obbligatorio <br>");
    				}
    			
    			if(valid) obj.submit();
    		}
            </script>
            
            
    </body>
    </html>