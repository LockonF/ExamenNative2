<!-- Basados en una plantilla de http://freehtml5templates.com-->
<?PHP
/*session_start();
if(isset($_SESSION['username']))
    header('Location:examen.php');*/
?>

<!DOCTYPE html>
<html>
  <head>
    <title>Todo</title>
 <style type="text/css">
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
        
           <!-- javascript de nuestras funciones-->
    <script src="../js/jquery.js"></script>
    <script src="../js/login.js"></script>
    <!-- Bootstrap -->

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../js/css/bootstrapValidator.css"/>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrapValidator.min.js"></script>

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
      <div id="nav_social"><a href="https://www.facebook.com/pages/CICS-UST_Oficial/262507227184822?fref=ts"><img src="images/facebook_32.png" alt="Become a fan" width="32" height="32" /></a><a href="#"><img src="images/twitter_32.png" alt="Follows on Twitter" /></a><a href="#"><img src="images/linkedin_32.png" alt="Linked in" /></a><a href="#"><img src="images/email_32.png" alt="Contact" width="32" height="32" /></a> </div>
  </nav>
    </header>

<div class="content">

          <ul class="ca-menu">
                    <li>
                        <a href="Signin.php">
                            <div class="ca-content">
                              
                                <h2 class="ca-main">Iniciar Sesion</h2>
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
    
    <!--end main -->
    <!--start middle -->
    <middle>    
      <div class="enter">
      <div class="container">
    <div class="row">
        <!-- form: -->
        <section>
           
            <div class="col-lg-8 col-lg-offset-2">
                <form id="defaultForm" method="post" class="form-horizontal">
                    <fieldset>
                        <legend>Inicio de Sesi&oacute;n</legend>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Usuario</label>
                            <div class="col-lg-5">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" name="username"  id="username"/>
                                 </div>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Password</label>
                            <div class="col-lg-5">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="password" class="form-control" name="password" id="password" />

                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-3">
                                <button class="btn-block btn-primary" id="send">Iniciar Sesi&oacute;n</button>
                            </div>
                        </div>
                        <div class="col-lg-12" id="error"></div>
                    </div>
                </form>





                </div>



        </section>
        <!-- :form -->
    </div>
</div>

      
      </div>
           <div class="section_slogan" align="right"></div>
      <div class="middle_box">
      <h1><img src="images/fav.png" width="16" height="16" /> <a href="#">Duraci&oacute;n</a></h1>
      <ol>
        <img src="images/dialog-ok.png" width="16" height="16" /> 100 horas, 
</ol>
      <ol>
        <img src="images/dialog-ok.png" width="16" height="16" /> 5 horas por sesi&oacute;n
1 sesi&oacute;n en casa,</ol>
      <ol>
        <img src="images/dialog-ok.png" width="16" height="16" />  15  sesiones sabatinas de 08:00 a 13:00 horas </ol>
     <ol> <img src="images/dialog-ok.png" width="16" height="16" /> 4 en domingo..</ol>
      </div>
      <div class="middle_box">
        <h1><center><img src="images/cics.png" width="150" height="110"></center></h1>
      </div>
      <div class="middle_box">
        <h1><img src="images/fav.png" width="16" height="16" /> <a href="#">Objetivos </a></h1>
      <img src="images/dialog-ok.png" width="16" height="16" />Proporcionar  al  aspirante  un entrenamiento acad&eacute;mico  desarrollando habilidades para la  resoluci&oacute;n asertiva del examen  de admisi&oacute;n.      </div>

    </middle>
</div>
<!--end middle -->
<!--start footer -->
<footer>  
  <div id="footer">
  <div id="footerleft">
      <h2>&nbsp;</h2>
  </div>
    <div id="footermiddle">
      <h2>&nbsp;</h2>
    </div>
    <div id="footerright">
      <h2>&nbsp;</h2>
    </div>
    <details>

    </div>
</footer>
<!--end footer -->
</div>
<!--end container -->
<!-- Free template distributed by http://freehtml5templates.com -->
  </body>

</html>
