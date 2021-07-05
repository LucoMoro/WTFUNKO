<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.UserBean"%>
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>What The Funko</title>
    <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
    
</head>

<body>
<header>
<%@include file="Header.jsp" %>
</header>

<div class = "divbody" style = "margin-top : 100px">

    <div id="slider">
        
        <figure class="f_slider">
            <a href="ProdottoList?franchise=Marvel"><img src="./Images/slider/iron_man2.jpg"></a>
            <a href="ProdottoList?franchise=Star Wars"><img src="./Images/slider/mandalorian2.jpg"></a>
             <a href="ProdottoList?franchise=One Piece"><img src="./Images/slider/onepiece2.jpg"></a>
            <a href="ProdottoList?franchise=WWE"><img src="./Images/slider/wwe2.jpg"></a>
            <a href="ProdottoList?franchise=Marvel"><img src="./Images/slider/iron_man2.jpg"></a>
        </figure>
    </div>


    

    <div class="container_buttons">
        <div class=" button_con" >
    
            <button class="button">
                <img src="./Images/Button/disney.png" id="img">
    
                <a href="ProdottoList?franchise=Disney">
                    <div class="video">
                        <video id="video" preload="none" muted autoplay loop poster="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564674844-disney.mp4">
                    <source id="mp4" src="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564674844-disney.mp4" type="video/mp4">
                    <p>Your browser does not support HTML5 Video!</p>
                    </video>
                </div>
            </a>
            </button>
    
            <button class="button">
                <img src="./Images/Button/marvel.png" id="img">
    
                <a href="ProdottoList?franchise=Marvel">
                    <div class="video">
                        <video id="video" preload="none" muted autoplay loop poster="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564676115-marvel.mp4">
                    <source id="mp4" src="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564676115-marvel.mp4" type="video/mp4">
                    <p>Your browser does not support HTML5 Video!</p>
                    </video>
                </div>
            </a>
            </button>
    
            <button class="button">
                <img src="./Images/Button/pixar.png" id="img">
                <a href="ProdottoList?franchise=Pixar">
                    <div class="video">
                        <video id="video" preload="none" muted autoplay loop poster="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564676714-pixar.mp4">
                    <source id="mp4" src="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2019/08/01/1564676714-pixar.mp4" type="video/mp4">
                    <p>Your browser does not support HTML5 Video!</p>
                    </video>
                </div>
            </a>
            </button>
    
            <button class="button">
                <img src="./Images/Button/starwars.png" id="img">
                <a href="ProdottoList?franchise=Star Wars">
                    <div class="video">
                        <video id="video" preload="none" muted autoplay loop poster="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2020/12/17/1608229455-star-wars.mp4">
                    <source id="mp4" src="https://vod-bgc-eu-west-1.media.dssott.com/bgui/ps01/disney/bgui/2020/12/17/1608229455-star-wars.mp4" type="video/mp4">
                    <p>Your browser does not support HTML5 Video!</p>
                    </video>
                </div>
            </a>
            </button>
    
            </div>
    </div>


<div class="prod_container">

        <div class="cardp cardp1" style = "background-image: url(./Images/Product/Tanjiro_Kamado.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Tanjiro Kamado</h2>
            <p class="cardp-body">
                Sarai pronto a combattere i tuoi demoni? </p>
            <a href="Prodotto?id=56" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>


        <div class="cardp cardp2" style = "background-image: url(./Images/Product/gl_jessica.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title">Green Lantern (Jessica)</h2>
            <p class="cardp-body">
            Nel giorno più splendente, nella notte più profonda, nessun FUNKO sfugga alla mia ronda</p>
            <a href="Prodotto?id=16" class="button_prod"> SCOPRI DI PIÙ</a>

            </div>
        </div>

        <div class="cardp cardp4" style = "background-image: url(./Images/Product/venomgroot.jpg);
    background-size: cover;">
            <div class="cardp-content"> 
            <h2 class="cardp-title"> Venom Groot</h2>
            <p class="cardp-body">
                Pronto a vedere i tuoi personaggi venomizzati? </p>
            <a href="Prodotto?id=1" class="button_prod">SCOPRI DI PIÙ</a>

            </div>
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

  </div>
        <footer><%@include file="Footer.html" %></footer>    

</body>

</html>