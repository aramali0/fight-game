<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/inser2.css">
<title>Inserer Player</title>
</head>
<body>
	<section class="display">
		<div class="form">
		    <h1>Choisir Player</h1>
		    <h3>le type de player</h3>
		    <form action="save.php" id="playerForm">
			    <div class="radio">
				    <div class="card">
				        <label>Knight</label>
				        <input type="radio" name="character" value="knight" id="knight"/>
				    </div>
				    <div class="card">
				        <label>Wizard</label>
				        <input type="radio" name="character" value="wizard" id="wizard"/>
			        </div>
			     </div>
		        <label>Nom</label>
		        <input type="text" name="nom" id="nom" /><br>
		    </form>
		 </div>
	    <div id="character-img">
	        <img alt="ken gif" src="sources/ken-gif3.gif" id="img">
	   </div>
	</section>
	<section class="btn-box" >
		 <button class="button" type="submit" id="validateButton" onclick="validate()">Valider</button>
	</section>
	<footer> <button class="music-btn" onclick="toggleBackgroundMusic()"></button></footer>
    <script type="text/javascript">
        document.getElementById("knight").addEventListener("change", character);
        document.getElementById("wizard").addEventListener("change", character);

        function character() {
            var knight = document.getElementById("knight");
            var wizard = document.getElementById("wizard");
            var img =  document.getElementById("img");

            if (knight.checked) {
                img.src = "sources/ken-gif3.gif";
            } else if (wizard.checked) {
                img.src = "sources/ryu-gif.gif";
            }
        }

        function validate() {
        	
            var nomInput = document.getElementById("nom").value;
            var knight = document.getElementById("knight");
            var wizard = document.getElementById("wizard");
            if(!knight.checked && !wizard.checked)
           	{
           		alert("Choisir le character !");
               return;
           	}
            var nomRegex = /^[a-zA-Z\s]+$/;
            if (nomRegex.test(nomInput)) {
                document.getElementById("playerForm").submit();
            } else {
                alert("Le nom ne doit contenir que des lettres et des espaces.");
                return;
            }
            console.log("clicked");
        }
        
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
</body>
</html>
