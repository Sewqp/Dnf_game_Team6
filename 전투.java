package com.dnf;

public class 전투 {

    private 플레이어 플레이어객체 = new 플레이어("hero");

    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        if (!플레이어객체.플레이어체크(플레이어id)) {
            return null; // 플레이어체크 실패
        }
        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        } else if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        }
        return null;
    }

    public String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) {
        if (!플레이어객체.플레이어체크(플레이어id)) {
            return "몬스터공격 실패: 플레이어 인증 오류";
        }

        double 데미지 = 캐릭터객체.스킬발동();
        String 스킬명;
        if (캐릭터객체 instanceof 전사) {
            스킬명 = "검 휘두르기";
        } else if (캐릭터객체 instanceof 마법사) {
            스킬명 = "파이어볼";
        } else {
            스킬명 = "기본공격";
        }

        String 등급 = 등급판정(데미지);
        return 스킬명 + " | 데미지: " + (int) 데미지 + " | " + 등급;
    }

    public String 등급판정(double 데미지) {
        if (데미지 >= 200) return "S급 공격";
        if (데미지 >= 100) return "A급 공격";
        return "B급 공격";
    }
}
