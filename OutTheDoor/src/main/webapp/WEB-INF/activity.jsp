<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/activity.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>${activity.title }</title>
</head>

<!-- Update and Delete Buttons -->
<form action="/getUpdate.do?id=${activity.id}">
<p align="right">
  <button class="update" type="submit"><i class="fa fa-bars"></i> Update</button></p>
  </form>
  <form action="/getDelete.do">
  <p align="right">
  <button class="delete" type="submit"><i class="fa fa-trash"></i> Delete</button></p>
</form>

<body>
<h1 style="font-family:didot, serif; font-size:50px; text-align:left; color:black; font-variant: small-caps">${activity.title }</h1>


<div class="container">
  <div class="row">
    <div class="col">
      <img src="${activity.profileURL}"> 
    </div>
    <div class="col bg-secondary">
      ${activity.description}
    </div>
  </div>
  <div class="row">
    <div class="col">
      Difficulty: ${activity.difficulty}<br>Distance: ${activity.distanceInMiles }
    </div>
    <div class="col">
      Elevation Gain: ${activity.elevationGain} <br>Route: ${activity.route } 
    </div>
    <div class="col">
      Handicap Accessible: ${activity.handicapAccessible} <br>Dogs Allowed: ${ activity.dogsAllowed} <br>Parking: ${activity.parking}
    </div>
  </div>
</div>

<div class="container bg-secondary">
	<p>
		Pro Tips: ${activity.proTips}
	</p>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>