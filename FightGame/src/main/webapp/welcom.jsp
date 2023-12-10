<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/welcome2.css">
<title>Welcome Page</title>
   <script>
   var audio = new Audio('music/Opening.mp3');
   audio.loop = true;

   function toggleBackgroundMusic() {
       if (audio.paused) {
           audio.play();
       } else {
           audio.pause();
       }
   }
    </script>
</head>
<body>

	<h1 class="title">welcome to the street fight game</h1>
	<section class="welcome">
		<div class="text">
			<p>Street Fighter, designed by Takashi Nishiyama and Hiroshi Matsumoto,
				 debuted in arcades in 1987. The player controls martial artist Ryu 
				 to compete in a worldwide martial arts tournament spanning five countries 
				 and 10 opponents. A second player can control Ryu's friendly American rival,
				  Ken Masters. The player can perform three punch and kick attacks, 
				  each varying in speed and strength
			 </p>
		</div>
		<div class="image">
			<img alt="ryu image" src="sources/ryu-image.png">
		</div>
	</section>
	<div class="btn-box">
		<a class="button" href="inserPlayer.php">cree player</a>
	</div>
	<footer> <button class="music-btn" onclick="toggleBackgroundMusic()"></button></footer>
	 
</body>
</html>