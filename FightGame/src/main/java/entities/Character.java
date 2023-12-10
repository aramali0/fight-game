package entities;

public abstract class Character {



	private String name;
	private int pv;
	
	
	
	public Character(String name, int pv) {
	    if (pv <= 0) {
	        throw new IllegalArgumentException("PV ne peut pas être négatif ou egale 0");
	    }
	    this.name = name;
	    this.pv = pv;
	}

	
	public boolean isAlive() {
		if(pv > 1) return true;
		return false;
		
	}
	
	public void takeDamage(int amount) {
		pv = pv - amount;
	}

	public String getName() {
		return name;
	}
	
	public int getPv() {
		return pv;
	}
	
	@Override
	public String toString() {
		return "Character [name=" + name + ", pv=" + pv + "]";
	}

	public abstract void attack(Character c);
	
}


