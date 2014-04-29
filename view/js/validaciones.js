    $(document).ready(function() {
        $('#forma-crear').bootstrapValidator({
            message: 'Formato de Campo Incorrecto',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                usuario: {
                    message: 'Usuario no valido',
                    validators: {
                        notEmpty: {
                            message: 'El usuario es obligatorio'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'el usuario debe mas de 6 y menos de  30 caracters de longitud'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'El usuario solo puede contener caracteres alfanumericos punto y / ò guion bajo'
                        }
                    }
                },
                nombre: {
                    message: 'Nombre no Vàlido',
                    validators: {
                        notEmpty: {
                            message: 'El nombre no puede estar Vacio'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: 'Tu nombre no puede tener más de 50 caracteres'
                        },
                        regexp: {
                            regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ \.]+$/,
                            message: 'El nombre solo acepta caracteres alfanumericos'
                        }
                    }
                },
                apellido_paterno: {
                    message: 'Apellido Paterno no Valido',
                    validators: {
                        notEmpty: {
                            message: 'Apellido Paterno Obligatorio'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: 'Tu apellido no puede tener más de 50 caracteres'
                        },
                        regexp: {
                            regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ \.]+$/,
                            message: 'El apellido solo acepta caracteres alfanumericos'
                        }
                    }
                },
                apellido_materno    : {
                    message: 'Apellido Matreno no Valido',
                    validators: {
                        notEmpty: {
                            message: 'Apellido materno Obligatorio'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: 'Tu Apellido no puede tener más de 50 caracteres'
                        },
                        regexp: {
                            regexp: /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ \.]+$/,
                            message: 'El apellido solo puede contener caracteres alfanuméricos'
                        }
                    }
                },


                email: {
                    validators: {
                        notEmpty: {
                            message: 'el correo electronico no puede quedar vacio'
                        },
                        emailAddress: {
                            message: 'Anote una direccion de correo válida'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'Contraseña Obligatoria'
                        },
                        identical: {
                            field: 'passwordConfirm',
                            message: 'Los campos no coinciden'
                        }
                    }
                },
                passwordConfirm: {
                    validators: {
                        notEmpty: {
                            message: 'Confirmación de password obligatoria'
                        },
                        identical: {
                            field: 'password',
                            message: 'Los campos no coinciden'
                        }
                    }
                }
            }
        });
    });