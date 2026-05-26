package dnf;
public class Battle {
    private Player player = new Player("hero");

    public Character createCharacter(String playerId, String charName, String job, int level) {
        if (!player.checkPlayer(playerId)) return null;
        if ("전사".equals(job))   return new Warrior(charName, level);
        if ("마법사".equals(job)) return new Mage(charName, level);
        return null;
    }

    public String attackMonster(String playerId, Character c, Dragon dragon) {
        if (!player.checkPlayer(playerId)) return "몬스터공격 실패: 플레이어 인증 오류";
        if (!dragon.isAlive()) return "이미 용을 처치했습니다!";

        double damage = c.useSkill();
        String skill = (c instanceof Warrior) ? "검 휘두르기" : (c instanceof Mage) ? "파이어볼" : "기본공격";
        String grade = judgeGrade(damage);

        dragon.takeDamage((int) damage);

        String result = skill + " | 데미지: " + (int) damage + " | " + grade;
        if (!dragon.isAlive()) {
            result += " | ★ 용을 처치했습니다! 클리어! ★";
        }
        return result;
    }

    public String judgeGrade(double damage) {
        if (damage >= 200) return "S급 공격";
        if (damage >= 100) return "A급 공격";
        return "B급 공격";
    }
}
