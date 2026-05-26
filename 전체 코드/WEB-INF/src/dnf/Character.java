package dnf;
public abstract class Character implements java.io.Serializable {
    protected String charName;
    protected String job;
    protected int level;
    protected int hp;
    protected double attack;
    public Character(String charName, String job, int level) {
        this.charName = charName;
        this.job = job;
        this.level = level;
    }
    public abstract double useSkill();
    public String getCharName() { return charName; }
    public String getJob()      { return job; }
    public int getLevel()       { return level; }
    public int getHp()          { return hp; }
    public double getAttack()   { return attack; }
}
