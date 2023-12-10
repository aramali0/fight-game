package entities;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Test  {
	private static boolean hasPlayerAlive(List<Player> players) {
		for(Player p : players ) {
			if(p.isAlive()) return true;
		}
		
		return false;
	}
	private static void Inplementation(List<Player> players , Enemy enemy) {
		

		for(Player p : players) {
			System.out.println(p.toString());
		}
		
		System.out.println(enemy.toString());
		
		int round = 1;
		while(hasPlayerAlive(players) && enemy.isAlive() )
		{
			System.out.println("*****Round : " + round);
			
			for(Player p : players) {
				p.attack(enemy);
			}
			int random =(int) Math.floor(Math.random() * players.size());
			enemy.attack(players.get(random));
			for(Player p : players) {
				System.out.println(p.toString());
			}
			System.out.println(enemy.toString());
			round++;
		}
		
		System.out.println("affichage des players avec la methode sort() ");
		Collections.sort(players);
		for(Player p : players) {
			System.out.println(p.toString());
		}
		
		System.out.println(enemy.toString());
		
		System.out.println("End of the game ");
	}

	
	public static void main(String[] args) {
		
		List<Player> players = new ArrayList<>();
		
		Enemy enemy = new Enemy("enemy", 100, Loot.POTION);
		Knight knight = new Knight("player1", 100);
		Wizard wizard = new Wizard("player2", 100, 100);
		
		players.add(knight);
		players.add(wizard);
		
		
		Inplementation(players,enemy);
	}
	
}
