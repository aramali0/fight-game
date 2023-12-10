package entities;

public class Enemy extends Character{

	private Loot loot;
	
	public Enemy(String name, int pv ,Loot loot) {
		super(name, pv);
		this.setLoot(loot);
	}

	public void attack(Character c) {
		c.takeDamage(5);
		
	}

	public Loot getLoot() {
		return loot;
	}

	public void setLoot(Loot loot) {
		this.loot = loot;
	}

	
}
