package entities;


public class Wizard extends Player{
	private int pm;

	public Wizard(String name, int pv, int pm) {
		super(name, pv);
		this.pm = pm;
	}

	@Override
	public void attack(Character c) {
		if(pm > 10) {
		c.takeDamage(10);
		super.setExperience(super.getExperience() + 10);
		pm = pm - 10;
		}
		
	}

	public int getPm() {
		return pm;
	}

}
