<?php 
	require "../php/model/Session.php";
	if(Session::isAuthenticated()){
		Session::logout()
	}
?>