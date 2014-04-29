<?PHP
require "../php/model/Session.php";

if(!Session::isAuthenticated())
{
    Session::redirectIndex();
}
?>

<!DOCTYPE html>
  <head>
 <title>Examen</title>

    <!-- javascript de nuestras funciones-->
    <script src="../js/jquery.js"></script>
    <script src="../js/materias.js"></script>
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- plugin fancyBox -->
    <link rel="stylesheet" href="../js/fancybox/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="../js/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
    <!-- plugin jqueryU1 -->
    <link href="../js/jquery-ui/css/cupertino/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
    <script src="../js/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
    <!-- TimeCircles -->
    <link href="../css/TimeCircles.css" rel="stylesheet">
    <script src="../js/TimeCircles.js"></script>
    <!--flotante  -->
     <script src="../js/flotante.js"></script>


<!--

-->
 </style>
 <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="../css/style9.css" />
    <link rel="stylesheet" type="text/css" href="../css/demo.css" />    
        <link href='http://fonts.googleapis.com/css?family=Terminal+Dosis' rel='stylesheet' type='text/css' />
        <style type="text/css">
<!--
.Stile1 {color: #333333}
-->
        </style>
 </head>
  
<body>
<!--start container -->
<div id="container">
<header>
    <nav>   
      <div id="logo"><a href="#"><img src="images/gemlogo.png" alt="Logo here" width="183" height="147" /></a>      </div>
      
      <div id="search-top">
   <form method="post" action="#">
  <input type="text" onFocus="if(this.value=='Search')this.value='';" onBlur="if(this.value=='')this.value='Search';" value="Search"  id="search-field"/>
  <input type="submit" value="" id="search-btn"/>
  </form> 
      </div>  
      <div id="nav_social"><a href="#"><img src="images/facebook_32.png" alt="Become a fan" width="32" height="32" /></a><a href="#"><img src="images/twitter_32.png" alt="Follows on Twitter" /></a><a href="#"><img src="images/linkedin_32.png" alt="Linked in" /></a><a href="#"><img src="images/email_32.png" alt="Contact" width="32" height="32" /></a> </div>
  </nav>
  
    </header>

<div class="content">

          <ul class="ca-menu">
                    <li>
                        <a href="../php/controller/signout.php">
                           <div class="ca-content">
                              
                                <h2 class="ca-main">Cerrar Sesión</h2>
                                <span class="ca-icon">U</span>
                                <h3 class="ca-sub"><br>Mi perfil</h3>
                                 
                            </div>
                        </a>                    </li>
                    <li>
                        <a href="examen.php">
                             
                            <div class="ca-content">
                              
                                <h2 class="ca-main">Realizar Ex&aacute;men</h2>
                                <span class="ca-icon">a</span>
                                <h3 class="ca-sub"><br>Inicio de sesi&oacute;n requerida</h3>
                                 
                            </div>
                        </a>                    </li>
                    <li>
                        <a href="acercade.html">
                            <span class="ca-icon">C</span>
                            <div class="ca-content">
                                <h2 class="ca-main">Acerca de..</h2>
                                <h3 class="ca-sub">Averigua m&aacute;s de nosotros</h3>
                            </div>
                        </a>                    </li>
                    <li>
                        <a href="index.html">
                            <span class="ca-icon">S</span>
                            <div class="ca-content">
                                <h2 class="ca-main">Gesti&oacute;n</h2>
                                <h3 class="ca-sub">Ajustes</h3>
                            </div>
                        </a>                    </li>
                </ul>
  <!--star main -->

<middle>

<div class="examen">
    <div id="caja_flotante" >
        <div id="CountDownTimer" data-timer="70 " style="width: 400px; height: 400px;"></div>
    </div>
    <br/><br/>

<div class="container-fluid">

<div class="row">
 <!-- Nav tabs -->
    <ul class="nav nav-tabs" id="materias">

    </ul>
</div>


<!-- Tab panes -->
<div class="row">
    <div class="tab-content" id="preguntas">

    </div>
</div>
<!--Progress Barr-->
<div class="row">
    <div class="col-md-12">
    <div class="progress">
        <div id="progressBar" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
        </div>
    </div>
    </div>
</div>

    <!-- Pager -->
<div class="row">
<ul class="pager">
   <li><a href="#" id="prev">Anterior</a></li>
   <li><a href="#" id="next">Siguiente</a></li>
</ul>
</div>


</div>

</div>



<div class="container-fluid">
   <div class="row">
       <div class="col-md-12 col-md-offset-1">
           <h1>Justificaciones</h1>
       </div>
   </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div id="accordion">

            </div>
        </div>
    </div>

</div>

    <footer>
        <div id="footer">
            <div id="footerleft">
                <h2></h2>
            </div>
            <div id="footermiddle">
                <h2></h2>
            </div>
            <div id="footerright">
                <h2></h2>
            </div>
        </div>
    </footer>




</body>

</html>
