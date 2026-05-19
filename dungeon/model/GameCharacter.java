package dungeon.model;

public abstract class GameCharacter {
    private String name;
    private String job;
    private int level;
    private int hp;
    private int attackPower;

    public GameCharacter(String name, String job, int level, int hp, int attackPower) {
        this.name = name;
        this.job = job;
        this.level = level;
        this.hp = hp;
        this.attackPower = attackPower;
    }

    public abstract int useSkill();

    public abstract String getSkillName();

    public int getAttackPower() {
        return attackPower;
    }

    public String getInfo() {
        return "캐릭터명: " + name +
                "\n직업: " + job +
                "\n레벨: " + level +
                "\nHP: " + hp +
                "\n공격력: " + attackPower;
    }
}