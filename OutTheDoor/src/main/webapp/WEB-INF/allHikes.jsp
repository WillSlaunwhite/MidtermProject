<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hikes</title>
</head>
<body>
<table>
<c:forEach var = "h" items = "${results }">
<tr>
<td>${h.title}</td>
<td>${h.location.city}</td>
<td>${h.description}</td>
</tr>
</c:forEach>
</table>

</body>
</html>