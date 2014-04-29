<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

    </head>
  <body>
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

    <div class="progress">
        <div id="progressBar" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
        </div>
    </div>


    <!-- Pager -->
<ul class="pager">
   <li><a href="#" id="prev">Anterior</a></li>
   <li><a href="#" id="next">Siguiente</a></li>
</ul>

</div>
      </body>
</html>