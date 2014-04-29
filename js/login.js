$(document).ready(validarForma);


function validarForma()
{
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        submitHandler: function(validator, form, submitButton) {
            user=$("#username").val();
            pass=$("#password").val();
            $.ajax({
                   url:"../php/controller/login.php",
                   type: "post",
                   data: {username:user,password:pass}
                }
                ).done(function(response){
                if(response=="success")
                {
                    window.location.replace("examen.php");
                }
                else{
                    $("#error").empty();
                    $("#error").append('<div class="alert alert-danger alert-dismissable"><button type=button class=close data-dismiss=alert aria-hidden=true>&times;</button><strong>Error!</strong> Usuario o Contrase&ntilde;a Incorrectos</div>');
                }
            }).fail(function(){
                $("#error").empty();
                $("#error").append('<div class="alert alert-danger alert-dismissable"><button type=button class=close data-dismiss=alert aria-hidden=true>&times;</button><strong>Error!</strong> Usuario o Contrase&ntilde;a Incorrectos</div>');
            });


        },
        fields: {
            username: {
                message: 'Este usuario no es valido',
                validators: {
                    notEmpty: {
                        message: 'El usuario es requerido y no puede estar vac&iacute;o'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'El usuario debe de tener entre 6 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Solo puede tener caracteres alfanumericos, punto y gui&oacute;n bajo'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'La contrase&ntilde;a no puede estar vac&iacute;a'
                    },
                stringLength:{
                    min: 5,
                    max: 20,
                    message: "La contrase&ntilde;a debe de tener entre 5 y 20 caracteres"
                    }

                }
            }

        }
    });
}