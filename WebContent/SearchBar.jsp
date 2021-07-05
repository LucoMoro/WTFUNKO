<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
    <title>What The Funko</title>
   <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	
	<style>
	.searchcontainer{
    margin:200px;
    padding:0;

}

    .search-box{
        position:absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: var(--background);
        height: 40px;
        border-radius: 40px;
        padding:10px;
    }

    .formsearch:hover > .search-txt{
        width:240px;
        padding: 0 6px;
    }

    .formsearch:hover > .search-btn{
        background: var(--background);
        color:var(--hover)
    }

    .search-btn{
        background-color: var(--background);
        color: white;
        float: right;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        border:none;
    }

    .search-txt{
        border:none;
        background: none;
        outline:none;
        float:left;
        padding:0;
        color: white;
        font-size: 16px;
        transition: 0.4s;
        list-style: 40px;
        width: 0px;
    }
	</style>	
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
            <li><a href="About_Us.jsp"> About Us </a></li>
        <%if(utente!= null &&utente.isAdmin())
        {%>
        	<li><a href="AreaRiservata.jsp"> Area Riservata </a></li>
         <%}%>
          </ul>
        
    </nav>
    <label for="nav-toggle" class="nav-toggle-label"> <!-- for andrà a cercare un id e non la classe-->
        <!-- in questo modo non solo cliccando sulla checkbox si mostra  il menù-->
        <span></span>
    </label>
    </header>
	

<div class="searchcontainer" >
    <div class="search-box">
        <form action="SearchServlet" method = "post" class="formsearch">
        <input  class="search-txt" type="text" name="search" placeholder="Ricerca prodotto...">
        <button type="submit"  class="search-btn"> 
        <i class="fa fa-search"></i>
        </button>
    </form>
    </div>
</div>




<div class="c_container"> 
    <div class=" card_container">
        <div class="heading">
         <h1> NON SAI DA COSA PARTIRE? </h1>
     </div>

     <div class="row">

        <div class="card">
            <div class="card-header ch2">
                <h1 class="title_good"> ? </h1>
            </div>
            <div class="card-body">
                <h1> NUOVI ARRIVATI </h1>
                <p>
                   Tutte le novità del Mondo Funko in un solo click! Riuscirai
                   a rimanere affascinato dai nuovi arrivati? Scoprilo tu stesso!
                </p>
                <a href="AllProductServlet?action=start" class="btn"  > SCOPRI DI PIÙ </a>
            </div>
         </div>

         <div class="card">
            <div class="card-header ch1">
                <h1 class="title"> ECCO I FUNKO MARVEL</h1>
            </div>
            <div class="card-body">
                <h1> ECCO I FUNKO MARVEL</h1>
                <p>
                    Hai mai sognato di unirti agli Avengers o con gli X-Men?
                    Be', non possiamo darti i superpoteri, ma possiamo fare in modo
                    che tu sia circondato da loro
                </p>
                <a href="ProdottoList?franchise=Marvel" class="btn" > SCOPRI DI PIÙ </a>
            </div>
        </div>         
			
         <div class="card">
            <div class="card-header ch3">
                <h1 class="title"> ECCO I FUNKO HARRY POTTER</h1>
            </div>
            <div class="card-body">
                <h1> ECCO I FUNKO HARRY POTTER</h1>
                <p>
                   Anche voi state ancora sperando di ricevere la lettera di invito
                   di Hogwarts? Siamo in tanti. Potrete comunque ricevere i vostri
                   personaggi HP preferiti e portare a casa un pizzico della scuola di
                   Magia e Stregoneria prederita da tutti!
                </p>
                <a href="ProdottoList?franchise=Harry Potter" class="btn" > SCOPRI DI PIÙ </a>
            </div>
         </div>

         <div class="card">
            <div class="card-header ch4">
                <h1 class="title"> ECCO I FUNKO DISNEY</h1>
            </div>
            <div class="card-body">
                <h1> ECCO I FUNKO DISNEY</h1>
                <p>
                    Chi non ha mai sognato di entrare a far parte del magico mondo Disney?
                    Se anche tu vuoi unirti ai veri appassionati, questi Funko Disney fanno 
                    proprio per te!
                </p>
                <a href="ProdottoList?franchise=Disney" class="btn"  > SCOPRI DI PIÙ </a>
            </div>
         </div>
     </div>

     </div>
</div>
        <footer><%@include file="Footer.html" %></footer> 

</body>

</html>