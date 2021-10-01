<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Update Activity</title>
</head>
<body>
	<div class="container bg-light">
		<h1>Please make necessary changes to the data in the form below:</h1>
		<br>
		<p style="color: red;">** Note, changes made here are permanent
			and will post to the database</p>

		<section>
			<h2style"text-align:center">Activity: ${activity.title}</h2></section>
		<br>
		<div class="container">



			<form action="update.do" method="POST">
				<div class="form-group">
					<label for="title">Current Title</label> <input type="text"
						name="title" value="${activity.title}" /><br>
					<label for="id">Current Id:</label> <input type="text"
						name="id" value="${activity.id}" /><br>
				</div>
				<div class="form-group">

					<label for="description">Current Description</label>
					<textarea class="form-control" name="description" rows="5">${activity.description}</textarea>
				</div>
				<div class="form-group">

					<label for="description">Current Pro Tips</label>
					<textarea class="form-control" name="proTips" rows="5">${activity.proTips}</textarea>
				</div>
				<div class="form-group">
					<div class="form-row">
						<label for="customer-control customer radio">Are Dogs/Pets
							Allowed?<span style="padding-right: 15px;"></span>
						</label>
						<div class="customer-control custom radio">
							<label><input type="radio" name="dogsAllowed" id="yes"
								value="true">Yes</label> <label><input type="radio"
								name="dogsAllowed" id="no" value="false">No</label><span
								style="padding-right: 15px;"></span>
						</div>
						
							<label for="customer-control customer radio">On-Site
								Parking Available?<span style="padding-right: 15px;"></span>
							</label> <div class="customer-control custom radio"><label class="radio-inline"> <input type="radio"
								name="parking" id="yes" value="true">Yes
							</label> <label class="radio-inline"><input type="radio"
								name="parking" id="no" value="false">No</label><span
								style="padding-right: 15px;"></span>
						</div>
							<label for="customer-control customer radio">Handicapped Accessible?<span style="padding-right: 15px;"></span>
							</label> <div class="customer-control custom radio"><label class="radio-inline"> <input type="radio"
								name="handicapAccessible" id="yes" value="true">Yes
							</label> <label class="radio-inline"><input type="radio"
								name="handicapAccessible" id="no" value="false">No</label><span
								style="padding-right: 15px;"></span>
						</div>
					
				</div>
		</div>
		<input type="submit" value="Update Activity" />
		</form>
	</div>

	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>