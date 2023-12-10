package entities;


public abstract class Player extends Character implements Comparable<Player> {

	private int experience;

	public Player(String name, int pv) {
		super(name, pv);
		
	}
	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}
	
	@Override
	public int compareTo(Player e1) {
		return Integer.compare(this.getPv(), e1.getPv());
	}
	
	
	
}
