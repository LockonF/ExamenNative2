/*
1. Usuario
2. UsuarioView
3. UsuarioCollection
4. UsuarioCollectionView
*/


var render_usuarios = function(data){
	//parámetros de entrada: data (un arreglo de objetos JS)
	//div_id: en éste div_id se escrbirá la vista después de render

	//definición del modelo: aquí colocamos todos los atributos del objeto
	var Usuario = Backbone.Model.extend({
		//se pueden declarar valores default si fuera necesario
	});

	var UsuarioCollection = Backbone.Collection.extend({
		model:Usuario
	});

	var UsuarioCollectionView = Backbone.View.extend({
		tagName: 'table', //es el objeto padre en el que se van a ir introduciendo los elementos

		render:function(){
            console.log("Rendereando");
			//agregamos el encabezado
			this.$el.append("<tr><th>Usuario</th><th>Nombre</th><th>Fecha de Nacimiento</th><th></th></tr>")
			this.$el.addClass('table')
			this.$el.addClass('table-striped')
			this.$el.addClass('table-hover')
			this.collection.each(function(usuario){
	      //usuario es un objeto Model de Backbone
	      var usuarioView = new UsuarioView({model:usuario});
	      this.$el.append(usuarioView.render().el);
	  },this);
			return this;
		}
	});


	var UsuarioView = Backbone.View.extend({
		tagName: 'tr',

		//cargamos con jQuery el template del html
		template: _.template($("#usuario-template").html()),
		render:function(){
			this.$el.html(this.template(this.model.toJSON()));
			return this;
		}
	});


	/*Utilizar:
	1. instanciar UsuarioCollection utilizando el arreglo de Users
	2. instanciar UsuarioCollectionView
	3. colocar en el placeholder
	*/
	//creamos una colección con los objetos JS que se reciben, Collection instancia por cada elemento un modelo.
	var usuariosCollection = new UsuarioCollection(data);

	//preparar el CollectionView con el collection que hemos construído
	var collectionView = new UsuarioCollectionView({collection:usuariosCollection});


	return collectionView.render().el
}

//

BuscarUsuariosRender = function(){



	//cargar el template
	$("#contenedor").html($("#vista-buscar").html())
   $("#forma-buscar").submit(function(event){
        event.preventDefault();
        $.getJSON("../php/controller/userManagement.php", $("#forma-buscar").serialize(),function(response){
            $("#resultados-busqueda").html(render_usuarios(response));
        });
        return false;
    });
}

/*Funciones Render*/

VerUsuariosRender = function(){
    $("#contenedor").html($("#vista-todos-usuarios").html())
	//petición asíncrona para cargar los datos
    var json = (function () {
        var json = null;
        $.ajax({
            url: '../php/controller/userManagement.php?s=all',
            success: function (data) {
                json = $.parseJSON(data);
                $("#contenedor").html(render_usuarios(json))
            }
        });
        return json;
    })();

}

CrearUsuarioRender = function(){
	$("#contenedor").load('forma-Usuario.html');
}

$("#tab-buscar-usuario").on("click",function(){
	//activar tab
	$("#nav-gestion > li").removeClass('active')
	$('#tab-buscar-usuario').parent().addClass('active');

	BuscarUsuariosRender();
});

$("#tab-todos-usuario").on("click",function(){
	//tab activo
	$("#nav-gestion > li").removeClass('active')
	$('#tab-todos-usuario').parent().addClass('active');

	VerUsuariosRender();
});

$("#tab-crear-usuario").on("click",function(){
	//tab activo
	$("#nav-gestion > li").removeClass('active')
	$('#tab-crear-usuario').parent().addClass('active');
	CrearUsuarioRender();
});




var render_default = function(){
	$("#contenedor").html($("#vista-buscar").html())
    BuscarUsuariosRender();
}

render_default();