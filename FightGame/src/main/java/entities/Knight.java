package entities;


public class Knight extends Player {

	public Knight(String name, int pv) {
		super(name, pv);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void attack(Character c) {
		c.takeDamage(10);
		super.setExperience(super.getExperience() + 10);
		
	}
}
