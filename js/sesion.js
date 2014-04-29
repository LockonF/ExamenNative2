 //lado script if session =  true
 <script type="text/javascript">

 function cierrasesion(){



 	var newHTML =   " <div id="sesion">"+
 	"<li>"+
 	"<a href="Signout.php">"+
 	"<div class="ca-content">"+

 	" <h2 class="ca-main">Cerrar Sesion</h2>"+
 	"<span class="ca-icon">U</span>"+
 	" <h3 class="ca-sub"><br>Cerrar Sesion</h3>"+

 	"</div>"+
 	"</a>                    </li>"+
 	"</div>"

 	$("#sesion").html(newHTML);

 }

 </script>
//cambio en gui
<div id="sesion">
<li>
<a href="Signin.php">
<div class="ca-content">

<h2 class="ca-main">Iniciar Sesion</h2>
<span class="ca-icon">U</span>
<h3 class="ca-sub"><br>Cerrar Sesion</h3>

</div>
</a>                    </li>
</div>