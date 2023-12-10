<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entities.Player" %>
<%@ page import="entities.Wizard" %>
<%@ page import="entities.Enemy" %>
<%@ page import="entities.Enemy" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Player.css">
<title>Play</title>
</head>
<body>

<%
	
	Player p = (Player) session.getAttribute("player");
	Enemy enemy = (Enemy) session.getAttribute("enemy");
	
   
    if (p != null) {
%>
		<div id="header">
			
		    <div id="header-hero">
		    	<h3 > <%= p.getName() %> : <%= p.getPv() %></h3>
			    <% if (p instanceof entities.Wizard) { %>
			        <h3><%= ((entities.Wizard) p).getPm() %></h3>
			    <% } %>
		    </div>
		    <div id="header-enemy">
			    <h3 > <%= enemy.getName() %> : <%= enemy.getPv() %></h3>
		    </div>
		
		</div>
<%
    }
%>
	<div id="characters">
		<div class="card">
			<div id="character">
				<img alt="Enemy" src="sources/hero.png">
				<form action="atack-enemy.php" id="enemy-form" > 
		  		    <button onclick="attack_enemy(event)" id="btn-enemy">Attack</button>
		    	</form> 
			</div>
			<div class="attack" id="enemy-weapons">
				<img alt="" src="sources/attack.png">
			</div>
		</div>
		<div class="card">
			<div class="attack" id="hero-weapons">
				<img alt="" src="sources/attack.png">
			</div>
			<div id="character">
				<img alt="Enemy" src="sources/Enemy.png">
				<form action="atack-hero.php" id="hero-form">
   					 <button onclick="attack_hero(event)" id="btn-hero">Attack</button>
			    </form>

			</div>
		</div>
	</div>
	

</body>
<script type="text/javascript">
function attack_hero() {
	event.preventDefault();  

    var heroWeapons = document.getElementById("hero-weapons");
    var btn_form = document.getElementById("hero-weapons");
    heroWeapons.classList.add("attack-hero");
    heroWeapons.classList.remove("attack");
    heroWeapons.addEventListener("animationend", function() {
        heroWeapons.classList.remove("attack-hero");
        heroWeapons.classList.add("attack");
        var btn_form = document.getElementById("hero-form").submit();
    }, { once: true }); 
    
}

function attack_enemy(event) {
    event.preventDefault();  

    var enemyWeapons = document.getElementById("enemy-weapons");
    enemyWeapons.classList.add("attack-enemy");
    enemyWeapons.classList.remove("attack");
    enemyWeapons.addEventListener("animationend", function() {
    	enemyWeapons.classList.remove("attack-enemy");
    	enemyWeapons.classList.add("attack");
    	 var btn_form = document.getElementById("enemy-form").submit();
    }, { once: true }); 
}

</script>

</html>
