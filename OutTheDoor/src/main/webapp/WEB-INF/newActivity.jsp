<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Create New Activity</title>
</head>
<body>
<div class="container bg-light">
<div class="container">
<p><h3 style="align:center;">Welcome to the Create New Activity Page!</h3></p>
Just fill out the form below for a new activity and we'll add it to the database!
</div>
<div class="container bg-secondary">
<form>
<label> <input type="text" name="title"/>Activity Title:</label> 
<label> <textarea class="form-control" rows="5" name="description"/></textarea>Activity Description:</label> 
<label> <input type="text" name="elevationGain"/> Elevation gain(feet)</label> 
<label> <input type="text" name="route"/>Route type: (Out and back, loop, etc)</label> 
<label> <input type="number"min="1" max="5" name="difficulty"/>Activity Difficulty: (1-5)</label> 
<label> <input type="number" name="distanceInMiles"/>Activity Distance: (miles)</label> 
<label> <textarea class="form-control" rows="5" name="proTips"/></textarea>Enter some helpful "Pro Tips" for your fellow adventure-seekers : </label> 
<label> <input type="text" name="profileURL"/>Enter an image URL for the Activity</label> 

</form>
</div>
</div>



  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>