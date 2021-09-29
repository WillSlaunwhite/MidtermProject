<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/main.css"/>
<title>OutTheDoor</title>
</head>

<!-- Headers -->
<body>
<h1 style="font-family:didot, serif; font-size:200px; text-align:center; color:white; font-variant: small-caps">OutTheDoor</h1>
<h2 style="font-family:didot, serif; font-size:35px; text-align:center; color:white; font-variant: small-caps">search for your next great adventure</h2>

<!-- Background Image -->
<style>
body {
  background-image: url('https://wallpaperaccess.com/full/622264.jpg');
background-repeat: no-repeat; background-size: cover; }
</style>

<!--  Search Bar and Button -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<form class="example" action="/action_page.php">
  <input type="text" placeholder="search by keyword or zip code" name="search">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>


<!-- Bottom of Home Page - Categories -->
<div class="categories">
<body>
<a href ="getAllHiking.do"><img src="https://live.staticflickr.com/65535/51530390479_197e9677fd_z.jpg" style="width:220px;height:140px;padding-right:30px;"></a>
<a href ="getAllBiking.do"><img src="https://live.staticflickr.com/65535/51530390294_d2914028d4_z.jpg" style="width:220px;height:140px;padding-right:30px;"></a>
<a href ="getAllKayaking.do"><img src="https://live.staticflickr.com/65535/51530390049_f5e340aac8_z.jpg" style="width:220px;height:140px;padding-right:30px;"></a>
<a href ="getAllRafting.do"><img src="https://live.staticflickr.com/65535/51529718201_0902da1442_z.jpg" style="width:220px;height:140px;padding-right:30px;"></a>
<a href ="getAllFishing.do"><img src="https://live.staticflickr.com/65535/51528868662_68e487f590_z.jpg" style="width:220px;height:140px;padding-right:30px;"></a>
</body>
</div>

</body>
</html>