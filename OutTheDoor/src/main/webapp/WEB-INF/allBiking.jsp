<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 --><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./css/allBiking.css" />


<title>Biking</title>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
</head>
<body>

<h1 style="font-family:didot, serif; font-size:75px; text-align:center; color:black; font-variant: small-caps">Biking</h1>

<!-- <main class="container"></main> -->
<div class="container">
	<div class="row">
		<c:forEach var = "b" items = "${results }" >
			<div class="col-sm-4">
            	<p class="card-text"><h3>${b.title }</h3>
                <a href="getActivity.do?id=${b.id }"><img class="card-img-top" src="${b.profileURL}" style="width:150px;height:120px;" alt="Responsive image"></a>
             	<div class="card-body">
             	<p class="card-text">City: ${b.location.city}<br>State: ${b.location.state}<br>Trail Length: ${b.distanceInMiles}<br>Difficulty: ${b.difficulty}</p>
 	           	</div>
              </div>
		</c:forEach>
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>