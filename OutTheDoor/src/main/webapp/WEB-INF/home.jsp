<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Out The Door</title>
</head>

<!-- Headers -->
<body>
<h1 style="font-family:didot, serif; font-size:200px; text-align:center; color:white; font-variant: small-caps">OutTheDoor</h1>
<h2 style="font-family:didot, serif; font-size:35px; text-align:center; color:white; font-variant: small-caps">cute little message about what to search here</h2>

<!-- Background Image -->
<style>
body {
  background-image: url('https://wallpaperaccess.com/full/622264.jpg');
background-repeat: no-repeat; background-size: cover; }
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<form class="example" action="/action_page.php">
  <input type="text" placeholder="search by keyword or zip code" name="search">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
<a href ="getAllHiking.do">Get Hikes</a>



${DEBUG}

</body>
</html>