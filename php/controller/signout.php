<?php 
	require "../model/Session.php";
	if(Session::isAuthenticated()){
		Session::logout();
        header("Location: ../../view/index.html");

    }
?>