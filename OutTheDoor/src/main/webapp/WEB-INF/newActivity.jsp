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
<h1>${location.id }</h1>
<div class="mx-auto" style="width:100%;">
<div class="container">
<p><h3 style="align:center;">Welcome to the Create New Activity Page!</h3></p>
Just fill out the form below for a new activity and we'll add it to the database!
</div>
<div class="container bg-secondary text-white">
<form action="addActivity.do" method="POST">
<div class="form-row">
<div class="col-sm-2">
<label for="title">Activity Title:</label> <input type="text" name="title"/> 
		
		</div>
		</div>
<div class="form-row">
<label for="description">Activity Description:</label> <textarea class="form-control" rows="5" name="description"/></textarea>
</div> 
<div class="form-row">
<label for="elevationGain">Elevation gain(feet)</label><input type="text" name="elevationGain"/> 
<label for="route"> Route type: (Out and back, loop, etc)</label>  <input type="text" name="route"/>
<label for="difficulty">Activity Difficulty: (1-5)</label>  <input type="number"min="1" max="5" name="difficulty"/>
<label for="distanceInMiles">Activity Distance: (miles)</label> <input type="number" name="distanceInMiles"/>
</div>
<div class="form-row"> 
<label for="proTips">Enter some helpful "Pro Tips" for your fellow adventure-seekers: </label> <textarea class="form-control" rows="5" name="proTips"/></textarea> 
</div>
<div class="form-row"> 
<label for="profileURL"> Enter an image URL for the Activity:</label><input type="text" name="profileURL"/>
</div>
<div class="form-group">
		<div class="form-row">
		<label for="customer-control customer radio">Are Dogs/Pets Allowed?<span style="padding-right:15px;"></span> </label>
		<div class="customer-control custom radio">
		<label><input type ="radio" name ="dogsAllowed" id="yes" value="yes">Yes</label>
		<label><input type="radio" name="dogsAllowed" id="no" value="no">No</label><span style="padding-right:15px;"></span>
		</div>
		<div class="radio">	
		<label for="customer-control customer radio">On-Site Parking Available?<span style="padding-right:15px;"></span></label>
		<label class="radio-inline"> <input type ="radio" name="parking" value="yes">Yes</label>
		<label class="radio-inline"><input type="radio" name="parking" value="no">No</label><span style="padding-right:15px;"></span>
		</div>
			<label for="customer-control customer radio">Handicapped Accessible?<span style="padding-right:15px;"></span> </label>
		<div class="customer-control custom radio">
		<label><input type ="radio" name ="handicapAccessible" id="yes" value="yes">Yes</label>
		<label><input type="radio" name="handicapAccessible" id="no" value="no">No</label><span style="padding-right:15px;"></span>
		</div>
		</div>
		</div>
			<input type="submit" value="Add activity" />
</form>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>