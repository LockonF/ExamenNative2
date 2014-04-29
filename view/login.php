<?PHP
/*session_start();
if(isset($_SESSION['username']))
    header('Location:examen.php');*/
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Examen</title>

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
<div class="container">
    <div class="row">
        <!-- form: -->
        <section>
            <div class="page-header">
                <h1>Bootstrap Validate plugin</h1>
            </div>

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
                    <div class="form-group">
                        <div class="col-lg-3 col-lg-offset-3">
                            <button class="btn btn-primary" id="send">Iniciar Sesi&oacute;n</button>
                        </div>
                    </div>

                </form>
             <div class="col-lg-5 col-lg-offset-3" id="error">


             </div>




                </div>



        </section>
        <!-- :form -->
    </div>
</div>
</body>
</html>