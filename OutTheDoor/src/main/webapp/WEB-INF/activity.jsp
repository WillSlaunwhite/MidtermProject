<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${activity.title }</title>
</head>
<body>
<style>
div::before{
content:'';
opacity: .5;
background-image: url('https://live.staticflickr.com/65535/51530390479_197e9677fd_z.jpg');
background-repeat: no-repeat;
background-size: cover;
position: absolute;
top: 0px;
bottom: 0px;
left: 0px;
right: 0px;
}
 
body{
background-image: url('https://live.staticflickr.com/65535/51530390479_197e9677fd_z.jpg');
background-repeat: no-repeat; background-size: cover;
} 
</style>
<h1 style="font-family:didot, serif; font-size:50px; text-align:left; color:black; font-variant: small-caps">${activity.title }</h1>
<div class="container">
<p><img src="${activity.profileURL}" style="width:200px; height:150px"> <br>${activity.description} <br>Pro Tips: ${activity.proTips} <br>Difficulty: ${activity.difficulty } <br>Distance: ${activity.distanceInMiles} <br>Elevation Gain: ${activity.elevationGain} <br>Route: ${activity.route } <br>Handicap Accessible: ${activity.handicapAccessible} <br>Dogs Allowed: ${ activity.dogsAllowed} <br>Parking: ${activity.parking}
</p>
</div>


</body>
</html>