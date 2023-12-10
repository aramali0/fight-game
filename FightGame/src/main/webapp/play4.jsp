<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="entities.Player" %>
<%@ page import="entities.Wizard" %>
<%@ page import="entities.Enemy" %>
<%@ page import="entities.Enemy" %>



<!DOCTYPE html>
<html>
<head>
	
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/player6.css">
	<title>Play</title>
</head>
<style>
	.ken-progress::-webkit-progress-value {
    background-color: <%= ((Player) session.getAttribute("player")).getPv() > 25 ? "green" : "red" %>;
  }
  
	.ryu-progress::-webkit-progress-value {
    background-color: <%= ((Enemy) session.getAttribute("enemy")).getPv() > 25 ? "green" : "red" %>;
  }
</style>
<body>


<%
	
	
	Player p = (Player) session.getAttribute("player");
	Enemy enemy = (Enemy) session.getAttribute("enemy");
	
   
    if (p != null) {
%>
		<div id="header">
				<div class="card-header">
				<% if (p instanceof entities.Knight) { %>
					    <form action="atack-hero.php" id="hero-form" > 
				  		    <button type="submit" onclick="attack_hero(event)" id="btn-hero" class="btn"></button>
				    	</form>
				    <% } %>
				    <div id="header-hero">
				    	<img alt=" ryu image " src="sources/ken-profile.png" class="character-img">
				    	
				    		<div id='wrapper'>
							  <progress max='50' value=<%= p.getPv() %> class="ken-progress"></progress>
							</div>
					      
					  
				    </div>
					  
				</div>
			 <div class="card-header">
			 <% if (p instanceof entities.Wizard) { %>
					    <form action="atack-enemy.php" id="enemy-form" > 
				  		    <button type="submit" onclick="attack_enemy(event)" id="btn-enemy" class="btn"></button>
				    	</form>
				    <% } %>
				 	 <div id="header-enemy">
					   <img alt=" ryu image " src="sources/ryu-profile.png" class="character-img">
					   <div class="progress-hero">
						    <div id='wrapper' >
							  <progress max='50' value=<%= enemy.getPv() %> class="ryu-progress"></progress>
							</div>
							 <% if (p instanceof entities.Wizard) { %>
								   <div id='wrapper-pm'>
									  <progress max='100' value=<%= ((entities.Wizard) p).getPm() %> class="pm-progress"></progress>
									</div>
								<% } %>
						</div>
				    </div>
			
			</div>
	</div>
<%
    }
%>
	<div id="characters">
			<div class="character">
				<div id="img_animation_hero" class="anime-hero-waiting"></div>
			</div>
			<div class="character">
				<div id="img_animation_enemy" class="anime-enemy-waiting"></div>
			</div>
	</div>
		
		

<script type="text/javascript">
 function attack_hero(event) {
	 <% if (p instanceof entities.Knight) { %>
		event.preventDefault();  
	<%}%>

    var heroAttack = document.getElementById("img_animation_hero");
    var audio = new Audio('music/KenVoice.mp3');
	audio.loop = true;
	audio.play();
    heroAttack.classList.add("anime-hero-attack");
   	setTimeout(() => {
    	heroAttack.classList.remove("anime-hero-attack");
    	 audio.pause();
    	var enmy_dead = document.getElementById("img_animation_enemy");
    	enmy_dead.classList.add("anime-ryu-dead");
    	enmy_dead.addEventListener("animationend", function() {
    		enmy_dead.classList.remove("anime-ryu-dead");
    		 <% if (p instanceof entities.Knight) { %>
    			document.getElementById("hero-form").submit();
    		<%}%>
    	    
    	    }, { once: true }); 
	}, 1000);
   
    
}

 function attack_enemy(event) {
	 
	 <% if (p instanceof entities.Wizard) { %>
		event.preventDefault();  
	<%}%>

	    var enemyAttack = document.getElementById("img_animation_enemy");
	    var audio = new Audio('music/goku2.mp3');
		audio.loop = true;
		audio.play();
	    enemyAttack.classList.add("anime-ryu-attack");
	    enemyAttack.addEventListener("animationend", function() {
	    	  enemyAttack.classList.remove("anime-ryu-attack");
	    	  audio.pause();
	    	var hero_dead = document.getElementById("img_animation_hero");
	    	hero_dead.classList.add("anime-ken-dead");
	    	hero_dead.addEventListener("animationend", function(){
	    		hero_dead.classList.remove("anime-ken-dead");
	    		 <% if (p instanceof entities.Wizard) { %>
	    			document.getElementById("enemy-form").submit();
	    		<%}%>
	    	    }, { once: true }); 
	    }, { once: true }); 
}
 

 document.addEventListener("keydown",(e)=>{
	 if(e.keyCode == 32 || e.keyCode == 13){
		 <% if (p instanceof entities.Knight) { %>
			 attack_hero(event);
		<%}%>
		
		 <% if (p instanceof entities.Wizard) { %>
			 attack_enemy(event);
		<%}%>

	 }
 });
 
 
</script>
<%  
	Boolean isAttack1 = (Boolean)request.getAttribute("isAttack1");
	Boolean isAttack2 = (Boolean)request.getAttribute("isAttack2");
	
	if(isAttack1 != null){
		out.println("<script> attack_enemy(event); "
			+ "console.log(\" attack-enemy\");</script>");	
	}
	
	if(isAttack2 != null){
		out.println("<script> attack_hero(event); "
				+ "console.log(\" attack-hero\");</script>");	
} %>




</body>
</html>
