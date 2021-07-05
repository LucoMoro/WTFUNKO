<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
    <%@ page contentType="text/html; charset=UTF-8" 
    import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart, 
    it.unisa.model.UserBean, 
    it.unisa.model.OrderBean "%>  
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
    </head>

    <body>

        
        <div class="c_table">

            <div class="table-container">
                <% UserBean user = (UserBean) request.getSession().getAttribute("utente") ;
		if(user==null){%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }
	  
		else if(user.isAdmin() == false)
	   {%>
		  <p> Non hai i requisiti per accedere a questa pagina, premi <a href = "ProductView.jsp"> qui</a> per tornare alla pagina principale.
	  <% }else
	  {
	  	String type = (String) request.getSession().getAttribute("type");
	  	ArrayList<OrderBean> ordini = new ArrayList<OrderBean> ();
	  	OrderBean ordine;
	  	if(type.contentEquals("nominativo"))
	  	{
	  		ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("nameOrdini");
	  	}
	  	else
	  	{
	  		ordini = (ArrayList<OrderBean>) request.getSession().getAttribute("dateOrdini");
	  	}
	  %>
	  	

                <table class="table">
                    <thead>
                        <tr>
                            <th>ID cliente</th>
                            <th>Codice ordine</th>
                            <th>Data ordine </th>
                        </tr>
                    </thead>
                    <% for(int i = 0; i<ordini.size(); i++) 
		            {
			ordine = ordini.get(i);
			
		            %>

                    <tbody>
                        <tr>
                            <td data-label="ID cliente"><%=ordine.getID()%></td>
                            <td data-label="Codice ordine"><%=ordine.getOrderCode()%></td>
                            <td data-label="Data ordine"><%=ordine.getDataOrdine().toString()%></td>
                        </tr>
                    </tbody>
                    <% } }%>
                </table>

        </div>
		<p> Premi <a href = "AreaRiservata.jsp"> qui </a>per tornare indietro</p>
    </body>

</html>