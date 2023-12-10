<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/end.css">
 
<title>The End</title>
</head>
<body>
	<div class="list">
		<h1>End of the game</h1>
		<h3> Winner : <%=request.getAttribute("winnerNom") %></h3>
		<h3> Score : <%=request.getAttribute("winnerScore") %></h3>
		<a class="button" href="inserPlayer.php"> Play Again ? </a>
	</div>
</body>
</html>