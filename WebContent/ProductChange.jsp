<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, it.unisa.model.UserBean "%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
	<link href="Style.css" rel="stylesheet" type="text/css">
<title>WHAT THE FUNKO</title>

<script src = "jquery-3.5.1.min.js"></script>

</head>
<body>

	<% UserBean user = (UserBean) request.getSession().getAttribute("utente") ;
		if(user==null){%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }
	  
	   if(user.isAdmin() == false)
	   {%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }%>
	
	<form action="AddProductServlet" method="post">
		<fieldset>
			<p>
				Inserici un nuovo articolo:<br>
				 Product Code: <input type="number" name = "id" id="id" value="" /><br>
				 <div id = "result"></div>
				 quantity: <input type="number" name = "quantity" id="quantity" required/> <br> 
				 <div id = "quantRes"></div>
				 price: <input type="number" name="price" value="" required/> <br> 
				 name: <input type="text" name="name" value="" required/> <br> 
				 description  <input type="text" name="description" value="" required/> <br>
				 franchise :  <input type="text" name="franchise" value="" required/> <br>
				 rarity :  <input type="number" name="rarity" value="" required/> <br>
				 dimension : <input type="number" name = "dimension" id="dimension" value="" required/> <br>
				 <div id = "dimRes"></div>
				 series : <input type="text" name="series" value="" required/> <br>
				 <input type="button" id = "submit" value="Aggiungi Articolo" /> &nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
	
	<br> <br> <br> <br>
	
	<form action="SetProductServlet" method="post">
		<fieldset>
			<p>
				Inserici l'articolo articolo con i nuovi valori:<br>
				 Product Code: <input type="number" name = "id" id="id2" value="" /><br> 
				 <div id = "result2"></div>
				 quantity: <input type="number" name ="qt" id="quantity2" value="" required/> <br> 
				  <div id = "quantRes2"></div>
				 price: <input type="number" name="price" value="" /> <br> 
				 name: <input type="text" name="name" value="" /> <br> 
				 description  <input type="text" name="description" value="" /> <br>
				 franchise :  <input type="text" name="franchise" value="" /> <br>
				 rarity :  <input type="number" name="rarity" value="" /> <br>
				 dimension : <input type="number" name = "dimension" id="dimension2" value="" required/> <br>
				 <div id = "dimRes2"></div>
				 series : <input type="text" name="series" value="" /> <br>
				 <input type = "hidden" name = "action" value = "change"> 
				 <input type="button" id = "submit2" value="Cambia Articolo" />&nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
	<br><br><br>
	<form action="SetProductServlet" method="post">
		<fieldset>
			<p>
				 Rimuovi articolo:<br>
				 Product Code: <input type="number" name = "id" id="id3" value="" /><br>
				 <div id = "result3"></div>
				 <input type = "hidden" name = "action" value = "delete"> 
				 <input type="button" id = "submit3" value="Rimuovi Articolo" />&nbsp; &nbsp; 
				 <input type="reset" value="Azzera Campi" /><br>
			</p>
		</fieldset>
	</form>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#id').blur(function(){
	        var id = $('#id').val();
	        var action = "add";
	        var quantity =  $('#quantity').val();
	        if(quantity == 0 || isNaN(quantity))
	        	{
	        	$('#submit').prop("type","button");
                $('#quantity').css("border","1px solid red");
            	$('#quantRes').css("display","inline");
                $('#quantRes').css("color","red");
                $('#quantRes').css("font-size","14px").html("Quantità non disponibile" + "<br>");
	        	}
	        else
	        	{
	        	$('#quantity').css("border","1px solid green");
	        	$('#quantRes').css("display","none");
	        	$('#submit').prop("type","submit");
	        	}
	        var dimension = $('#dimension').val();
	        if(dimension == 0 || isNaN(dimension))
	        	{
	        	$('#submit').prop("type","button");
                $('#dimension').css("border","1px solid red");
            	$('#dimRes').css("display","inline");
                $('#dimRes').css("color","red");
                $('#dimRes').css("font-size","14px").html("Dimensione non disponibile" + "<br>");
	        	}
	        else
	        	{
	        	$('#dimension').css("border","1px solid green");
	        	$('#dimRes').css("display","none");
	        	$('#submit').prop("type","submit");
	        	}
	        $.ajax({
	            type: 'POST',
	            data: {id:id,action:action},			
	            url : 'ProductCheckServlet',
	            success: function(result){			
	                if(result!=null && result!=""){	
	                    //impostazioni css caso di errore
	                    $('#submit').prop("type","button");
	                    $('#id').css("border","1px solid red");
	                	$('#result').css("display","inline");
	                    $('#result').css("color","red");
	                    $('#result').css("font-size","14px").html(result + "<br>");
	                }else{
	                    $('#id').css("border","2px solid green");
	                    $('#result').css("color","green");
	                    $('#result').css("display","inline");
	                    $('#submit').prop("type","submit");
	                    $('#result').css("font-size","14px").html("Product Code disponibile <br><br>");
	                }
	            }

	        })
	    });

	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#id2').blur(function(){
	        var id = $('#id2').val();
	        var action = "set";
	        var quantity =  $('#quantity2').val();
	        if(quantity == 0 || isNaN(quantity))
	        	{
	        	$('#submit2').prop("type","button");
                $('#quantity2').css("border","1px solid red");
            	$('#quantRes2').css("display","inline");
                $('#quantRes2').css("color","red");
                $('#quantRes2').css("font-size","14px").html("Quantità non disponibile" + "<br>");
	        	}
	        else
	        	{
	        	$('#quantity2').css("border","1px solid green");
	        	$('#quantRes2').css("display","none");
	        	$('#submit2').prop("type","submit");
	        	}
	        var dimension = $('#dimension').val();
	        if(dimension == 0 || isNaN(dimension))
	        	{
	        	$('#submit2').prop("type","button");
                $('#dimension2').css("border","1px solid red");
            	$('#dimRes2').css("display","inline");
                $('#dimRes2').css("color","red");
                $('#dimRes2').css("font-size","14px").html("Dimensione non disponibile" + "<br>");
	        	}
	        else
	        	{
	        	$('#dimension2').css("border","1px solid green");
	        	$('#dimRes').css("display","none");
	        	$('#submit2').prop("type","submit");
	        	}
	        $.ajax({
	            type: 'POST',
	            data: {id:id,action:action},		
	            url : 'ProductCheckServlet',
	            success: function(result){			
	                if(result!=null && result!=""){	
	                    //impostazioni css caso di errore
	                    $('#submit2').prop("type","button");
	                    $('#id2').css("border","1px solid red");
	                	$('#result2').css("display","inline");
	                    $('#result2').css("color","red");
	                    $('#result2').css("font-size","14px").html("Dimensione non disponibile" + "<br>");
	                }else{
	                    $('#id2').css("border","2px solid green");
	                    $('#result2').css("color","green");
	                    $('#result2').css("display","inline");
	                    $('#submit2').prop("type","submit");
	                    $('#result2').css("font-size","14px").html("Product Code disponibile <br><br>");
	                }
	            }

	        })
	    });

	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#id3').blur(function(){
	        var id = $('#id3').val();
	        var action = "set";
	        $.ajax({
	            type: 'POST',
	            data: {id:id,action:action},		
	            url : 'ProductCheckServlet',
	            success: function(result){			
	                if(result!=null && result!=""){	
	                    //impostazioni css caso di errore
	                    $('#submit3').prop("type","button");
	                    $('#id3').css("border","1px solid red");
	                	$('#result3').css("display","inline");
	                    $('#result3').css("color","red");
	                    $('#result3').css("font-size","14px").html(result + "<br>");
	                }else{
	                    $('#id3').css("border","2px solid green");
	                    $('#result3').css("color","green");
	                    $('#result3').css("display","inline");
	                    $('#submit3').prop("type","submit");
	                    $('#result3').css("font-size","14px").html("Product Code disponibile <br><br>");
	                }
	            }

	        })
	    });

	});
</script>
	
	
</body>
</html>