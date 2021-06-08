<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
        <h1 class="logo"> </h1> <a href="Home.jsp"><img  id="logo" src="./Images/Logo/logo.png" alt="Logo"> </a></h1>
    <input type="checkbox" id="nav-toggle" class="nav-toggle"> <!-- � conveniente inserire classi e id per essere pi� specifici -->
        <!-- in questo caso si hanno classe e id: classe per css mentre id per collegarlo alla label e farli lavorare insieme-->
    <nav>
        

        <ul>
            <li><a href="#"> Cart </a></li>
            <li><a href="#"> Login </a></li>
            <li><a href="#"> About Us </a></li>
            <li><a href="#"> New In </a></li>
        </ul>
    </nav>
    <label for="nav-toggle" class="nav-toggle-label"> <!-- for andr� a cercare un id e non la classe-->
        <!-- in questo modo non solo cliccando sulla checkbox si mostra  il men�-->
        <span></span>
    </label>
    </header>

    <div id="slider">
        
        <figure class="f_slider">
            <a href="#"><img src="./Images/slider/iron_man2.jpg"></a>
            <a href="#"><img src="./Images/slider/mandalorian2.jpg"></a>
            <a href="#"><img src="./Images/slider/onepiece2.jpg"></a>
            <a href="#"><img src="./Images/slider/wwe2.jpg"></a>
            <a href="#"><img src="./Images/slider/iron_man2.jpg"></a>
        </figure>
    </div>


    

    <div class="container_buttons">
        <div class=" button_con" >
    
            <button class="button">
                <img src="./Images/Button/disney.png" id="img">
    
                <a href="#">
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
    
                <a href="#">
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
                <a href="#">
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
                <a href="#">
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
                   Tutte le novit� del Mondo Funko in un solo click! Riuscirai
                   a rimanere affascinato dai nuovi arrivati? Scoprilo tu stesso!
                </p>
                <a href="#" class="btn"  > SCOPRI DI PI� </a>
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
                <a href="#" class="btn" > SCOPRI DI PI� </a>
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
                <a href="#" class="btn" > SCOPRI DI PI� </a>
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
                <a href="#" class="btn"  > SCOPRI DI PI� </a>
            </div>
         </div>
     </div>

     </div>
</div>

<div class="footercontainer">
        <footer class="footer">
            <div class="container">
                <div class="row">

                    <div class="footer-col">
                        <h4> get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">spedizione</a></li>
                            <li><a href="#">stato dell'ordine</a></li>
                            <li><a href="#"> opzioni di pagamento</a></li>
                            <li><a href="#">politche di privacy</a></li>
                        </ul>
                    </div>

                    <div class="footer-col">
                        <h4> franchise</h4>
                        <ul>
                            <li><a href="ProdottoList?franchise=Marvel"> Marvel</a></li>
                            <li><a href="#"> DC</a></li>
                            <li><a href="#"> Disney </a></li>
                            <li><a href="#"> Lord of the rings</a></li>
                        </ul>
                    </div>

                    <div class="footer-col">
                        <h4> follow us</h4>
                        <div class= social-links>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
                <a href="#"><i class="fa fa-linkedin-square"></i></a>
                <a href="https://www.instagram.com/whatthe_funko_pop/" target="_blank"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>

                </div>

            </div>

            <div class="footer-bottom">
                <p> copyright &copy; WTFUNKO Site designed by <span> WTFUNKO developers</span></p>
        
            </div>
        </footer>

    </div>

</body>

</html>