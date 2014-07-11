

$(document).ready(generateTabs);
$(document).ready(sliders);
$(document).ready(progressNav);
$(document).ready(timer);
$(document).ready(function() {
    $(".fancybox").fancybox();
});



function openWindow(event)
{
    event.preventDefault();
    var win=window.open($(this).attr("href"));
    win.focus();
}

/*
Funcion para guardar, falta enviar el JSON a procesar al PHP
 */

function guarda(event)
{
    event.preventDefault();

    var arr = new Array();
    $('input:checked').each(function(){
        var respuesta= new Object();
        respuesta.idPregunta=$(this).attr("name");
        respuesta.opcSelec=$(this).val();
        arr.push(respuesta);

    })
    var json= JSON.stringify(arr, null, 2);
    //console.log(json);
    $.ajax(
        {
            type:"POST",
            dataType:"json",
            url:"../php/controller/evaluador.php",
            data:{"json":json,"save":0}
        }
    );
}

/*
    Funcion para evaluar, al tener éxito manda a llamar
    a la función getEvaluacion, hace una peticion AJAX a
    evaluador.php
 */

function evalua(event)
{
    event.preventDefault();

    var arr = new Array();
    $('input:checked').each(function(){
        var respuesta= new Object();
        respuesta.idPregunta=$(this).attr("name");
        respuesta.opcSelec=$(this).val();
        arr.push(respuesta);

    })
    var json= JSON.stringify(arr, null, 2);
    var request=$.ajax(
        {
            type:"POST",
            dataType:"json",
            url:"../php/controller/evaluador.php",
            data:{"json":json,"save":1}
        });
    $("#CountDownTimer").TimeCircles().stop();
    getEvaluacion();
}


function getEvaluacion()
{
    /*
        Obtenemos datos basicos del JSON, que tiene lo siguiente
        aciertos = numero de aciertos
        errores = numero de errores
        sugerencia = sugerencia general
        justificaciones = [arreglo de objetos]
     */
    console.log("Evaluacion ya");
    var data=$.getJSON("../php/controller/obtenerEval.php","flag=1",function(data){
        var aciertos=$("#footerleft");
        aciertos.append("<h2>Tus aciertos son:"+data.aciertos+"</h2>");
        var errores = $("#footermiddle");
        errores.append("<h2>Tus errores son:"+data.errores+"</h2>");
        var sugerencia= $("#footerright");
        sugerencia.append("<h2>Sugerencia: "+data.sugerencia+"</h2>");


        /*
            Iteramos el arreglo de materias, que a su vez tiene
            un arreglo de justificaciones
         */
        $.each(data.justificaciones,function(key,val)
        {
            console.log(val);
            if(val!=null)
            {

                    var accordion=$("#accordion");
                    accordion.append("<h3>Pregunta: "+val.id+"</h3>");
                    var div=$("<div></div>");
                    div.append("<h2><strong>Oraci&oacute;n:</strong> "+val.oracion+"</h2><br>");
                    div.append("<h2><strong>Respuesta correcta:</strong> "+val.opcc+"</h2><br>");
                    div.append("<h2><strong>Justificaci&oacute;n:</strong> "+val.just+"</h2><br>");
                    accordion.append(div);
            }
        });
        /*
        El acordeon se tiene que refrescar cada vez que se agregan elementos
         */
        $("#accordion").accordion();
        $("button").attr("disabled", "disabled");

    });

}


/*
Progress bar con click en el Nav, falta arreglar
 */

function progressNav()
{
    $("#materias").click(function(){


        var tempX=$(this ).find( ".active");
        var hrefX = $(tempX).find("a").attr("href")
        hrefX=parseInt(hrefX.replace('#', '' ));
        //console.log(hrefX);
        var temp2X=$(this).find("li").length;
        //console.log(temp2X);
        $("#progressBar").width((hrefX*100/temp2X)+"%");
    });

}

/*
Funcion del progress bar con botones previo y siguiente
 */
function progressBar()
{
    var temp=$( "#materias" ).find( ".active");
    var href = $(temp).find("a").attr("href")
    href=parseInt(href.replace('#', '' ));
    var temp2=$("#materias").find("li").length;
    $("#progressBar").width((href*100/temp2)+"%");


}


/**Funcion para generar los tabs activos**/


function generateTabs()
{

    $.getJSON( "../php/controller/listmaterias.php", function( data ) {
        var items = new Array();

        //Generamos tabs del nav
        $.each(data,function(key,val)
        {
            if(key==0)
            {
                $("#materias").append('  <li class="active"><a href="#'+val.id+'" data-toggle="tab">'+val.nombre+'</a></li>');
            }
            else
            {
                $("#materias").append('  <li><a href="#'+val.id+'" data-toggle="tab">'+val.nombre+'</a></li>');
            }
            items.push(val.id);
        });


        //Generamos el contenido

        for(var i=0;i<items.length;i++)
        {
            if(items[i]==1)
            {
                $("#preguntas").prepend( '<div class="tab-pane active" id='+items[i]+'></div>');
            }
            else
            {
                $("#preguntas").append( '<div class="tab-pane" id='+items[i]+'></div>');
            }
            $("#"+items[i]).append('<form class="form-horizontal" id="formMat'+items[i]+'"></form>');

            /*Funcion para generar las preguntas, se generan después de generar
             * los tabs*/
            $.getJSON("../php/controller/getPreguntas.php","idMateria="+items[i],function(jsonPreguntas){
                $.each(jsonPreguntas,function(key2,val2)
                {
                    var forma = $("#formMat"+val2.Materia);
                    var row= $('<div class="row"></div>');
                    var column=$('  <div class="col-md-3"></div>');
                    var column2=$('  <div class="col-md-9"></div>')

                    $(row).append(column);
                    $(row).append(column2);
                    $(forma).append("<h1>"+(key2+1)+" "+val2.oracion+"</h1><br>");
                    var radioButtonA = $('<input type="radio" name="p'+val2.idPregunta+'" value="opc1">   '+val2.opc1+'</input><br>');
                    var radioButtonB = $('<input type="radio" name="p'+val2.idPregunta+'" value="opc2">   '+val2.opc2+'</input><br>');
                    var radioButtonC = $('<input type="radio" name="p'+val2.idPregunta+'" value="opc3">   '+val2.opc3+'</input><br>');
                    var radioButtonD = $('<input type="radio" name="p'+val2.idPregunta+'" value="opc4">   '+val2.opc4+'</input><br>');
                    $(column).append(radioButtonA);
                    $(column).append(radioButtonB);
                    $(column).append(radioButtonC);
                    $(column).append(radioButtonD);
                    $(forma).append(row);

                    /*
                    Parte para meter imagenes
                     */

                    if(val2.grafico!=null)
                    {
                        var extension= val2.grafico.search("pdf")
                        //console.log(extension);
                        if(extension!=-1)
                        {
                            var pdf = $("<a href='../view/images/"+val2.grafico+"'><img src='../view/images/pdf.png' height='50px' width='50px' />"+val2.grafico+"</a>");
                            $(pdf).bind("click",openWindow);
                            $(column2).append(pdf);
                        }
                        else{
                            var image = $('<a class="fancybox" rel="group" href="../view/images/'+val2.grafico+'"><img src="../view/images/'+val2.grafico+'"class="img-rounded" height="60%" width="60%"></a>');
                            $(column2).append(image);
                        }

                    }
                    if(key2==(jsonPreguntas.length-1))
                    {
                        $(forma).bind("submit",guarda);
                        $(forma).append($('<div class="row"><div class="col-md-6 col-md-offset-5">'+'<div class="form-group">' +
                            '<button type="submit" class="btn btn-primary" id="'+val2.Materia+'Send">Guardar</button>'
                        +  '<button type="button" class="btn btn-danger" id="eval'+val2.Materia+'">Evaluar</button>'
                        +'</div></div></div>'
                        ));
                        $("#eval"+val2.Materia).bind("click",evalua);
                    }

                });
            });


        }

    });

}

function timer(){
    $("#DateCountdown").TimeCircles();
    $("#CountDownTimer").TimeCircles({
        "animation": "smooth",
        "bg_width": .1,
        "fg_width": 0.03,
        "circle_bg_color": "#000000",
        "time": {
            "Days": {
                "text": "",
                "color": "",
                "show": false
            },
            "Hours": {
                "text": "",
                "color": "#07B0B9",
                "show": true
            },
            "Minutes": {
                "text": "",
                "color": "#009B0F",
                "show": true
            },
            "Seconds": {
                "text": "",
                "color": "#CD2F27",
                "show": true
            }
        }
    });
    $("#PageOpenTimer").TimeCircles();

    var updateTime = function(){
        var date = $("#date").val();
        var time = $("#time").val();
        var datetime = date + ' ' + time + ':00';
        $("#DateCountdown").data('date', datetime).TimeCircles().start();
    }
    $("#date").change(updateTime).keyup(updateTime);
    $("#time").change(updateTime).keyup(updateTime);

    // Start and stop are methods applied on the public TimeCircles instance
    $(".startTimer").click(function() {
        $("#CountDownTimer").TimeCircles().start();
    });
    $(".stopTimer").click(function() {
        $("#CountDownTimer").TimeCircles().stop();
    });

    // Fade in and fade out are examples of how chaining can be done with TimeCircles
    $(".fadeIn").click(function() {
        $("#PageOpenTimer").fadeIn();
    });
    $(".fadeOut").click(function() {
        $("#PageOpenTimer").fadeOut();
    });
    $("#CountDownTimer").TimeCircles().addListener(function(){
        var tiempoRestante = $(this).TimeCircles().getTime();
        if(Math.floor(tiempoRestante)==0)
        {
            alert("Ya acabo el tiempo");
            evalua();
        }
    });
}


function sliders()
{
    /*Funciones para cambiar el navbar
     * prev mueve el anterior
     * */
    $("#prev").click(function(){
        if(!$("#materias li:first-child").hasClass("active"))
        {
            var temp=$( "#materias" ).find( ".active");
            var href = $(temp).find("a").attr("href")
            href=href.replace('#', '' );
            $( "#materias" ).find( ".active").prev().addClass("active");
            temp.removeClass("active");
            var tempContent=$("#"+href);
            tempContent.removeClass("tab-pane active");
            tempContent.addClass("tab-pane");
            var newContent =$("#"+(href-1));
            newContent.removeClass("tab-pane");
            newContent.addClass("tab-pane active");
            progressBar();

        }

    });
    //Funcion para el slider siguiente
    $("#next").click(function(){
        if(!$("#materias li:last-child").hasClass("active"))
        {
            var temp=$( "#materias" ).find( ".active");
            var href = $(temp).find("a").attr("href")
            href=href.replace('#', '' );
            $( "#materias" ).find( ".active").next().addClass("active");
            temp.removeClass("active");
            var tempContent=$("#"+href);
            tempContent.removeClass("tab-pane active");
            tempContent.addClass("tab-pane");
            hrefInt = parseInt(href);
            var newContent =$("#"+(hrefInt+1));
            newContent.removeClass("tab-pane");
            newContent.addClass("tab-pane-active");
            progressBar();


        }
    });


}






