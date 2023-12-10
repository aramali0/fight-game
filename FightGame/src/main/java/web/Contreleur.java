
package web;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entities.Player;
import entities.Wizard;
import entities.Enemy;
import entities.Knight;
import entities.Loot;


@WebServlet(name="cs",urlPatterns = {"*.php"})
public class Contreleur extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        String winnerNom =null;
        Boolean isAttack1 = false;
        Boolean isAttack2 = false;
        int winnerScore = 0 ;

        if (path.equals("/welcom.php")) {
            request.getRequestDispatcher("/welcom.jsp").forward(request, response);
        } 
        
        
        else if (path.equals("/inserPlayer.php")) {
            request.getRequestDispatcher("/inser.jsp").forward(request, response);

        } 
        
        
        else if (path.equals("/save.php")) {
                String nom = request.getParameter("nom");
                String characterType = request.getParameter("character"); 
                Enemy enemy = new Enemy("Enemy",50,Loot.POTION);
                Player p = null ;
                if(characterType.equals("knight")){
                    p = new Knight(nom,50);
                }
                else {
                    p = new Wizard(nom,50,100);
                }

                HttpSession session = request.getSession();
                session.setAttribute("enemy", enemy);
                session.setAttribute("player", p);
                request.getRequestDispatcher("/play4.jsp").forward(request, response);
            }
        
        else if (path.equals("/atack-hero.php")) {
        	HttpSession session = request.getSession();
        	Player p = (Player) session.getAttribute("player");
        	Enemy enemy = (Enemy) session.getAttribute("enemy");
        	
        	if(p.isAlive() && enemy.isAlive()) {
        		
        		if (p != null && enemy != null) {
        			p.attack(enemy);
        		}
        		double number = Math.floor(Math.random()*100);
        		isAttack1 = false;
        		System.out.println(number);
        		if(number >= 50) {
						enemy.attack(p);
						isAttack1 = true;
						request.setAttribute("isAttack1", isAttack1);
        		}
        		
        		request.getRequestDispatcher("/play4.jsp").forward(request, response);
        	}
        	else {
        		if(p.isAlive()) {
        			winnerNom = p.getName();
        		}
        		else {
        			winnerNom = enemy.getName();
        			
        		}
        		winnerScore = p.getExperience();
        		request.setAttribute("winnerNom", winnerNom);
        		request.setAttribute("winnerScore", winnerScore);
        		request.getRequestDispatcher("/end.jsp").forward(request, response);
        	}
        }
        
        else if (path.equals("/atack-enemy.php")) {
        	HttpSession session = request.getSession();
        	Player p = (Player) session.getAttribute("player");
        	Enemy enemy = (Enemy) session.getAttribute("enemy");
        	
        	if(p.isAlive() && enemy.isAlive()) {
        		
        		if (p != null && enemy != null) {
        			enemy.attack(p);
        		}
        		double number = Math.floor(Math.random()*100);
        		isAttack2 = false;
        		if(number >= 20) {
        			System.out.println("attack");
        			p.attack(enemy);
        			isAttack2 = true;
        			request.setAttribute("isAttack2", isAttack2);
        		}
        		
        		request.getRequestDispatcher("/play4.jsp").forward(request, response);
        	}
        	else {
        		if(p.isAlive()) {
        			winnerNom = p.getName();
        		}
        		else {
        			winnerNom = enemy.getName();
        			
        		}
        		winnerScore = p.getExperience();
        		request.setAttribute("winnerNom", winnerNom);
        		request.setAttribute("winnerScore", winnerScore);
        		request.getRequestDispatcher("/end.jsp").forward(request, response);
        	}
        }
        else {
        	request.getRequestDispatcher("/notFound.jsp").forward(request, response);
        }
    }
}