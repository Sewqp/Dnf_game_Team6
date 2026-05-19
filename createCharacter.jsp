<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dnf.Character, com.dnf.Battle, com.dnf.Warrior, com.dnf.Mage, com.dnf.Player" %>
<%
    String result = null;
    String charInfo = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String playerId = request.getParameter("playerId");
        String charName = request.getParameter("charName");
        String job      = request.getParameter("job");
        String levelStr = request.getParameter("level");

        int level = 1;
        try { level = Integer.parseInt(levelStr); } catch (Exception e) {}

        Battle battle = new Battle();
        Character c = battle.createCharacter(playerId, charName, job, level);

        if (c != null) {
            result = "캐릭터 생성 성공";
            charInfo = "이름: " + c.getName()
                     + " | 직업: " + c.getJob()
                     + " | 레벨: " + c.getLevel()
                     + " | HP: " + c.getHp()
                     + " | 공격력: " + (int) c.getAttack();
            session.setAttribute("character", c);
            session.setAttribute("playerId", playerId);
        } else {
            result = "캐릭터 생성 실패: 플레이어 인증 오류 (ID는 hero 만 허용)";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 생성 - 던전앤파이터</title>
</head>
<body>
<h2>[ 캐릭터 생성 ]</h2>
<hr>

<form method="POST" action="createCharacter.jsp">
    <table>
        <tr>
            <td>플레이어 ID</td>
            <td><input type="text" name="playerId" value="hero" /></td>
        </tr>
        <tr>
            <td>캐릭터명</td>
            <td><input type="text" name="charName" /></td>
        </tr>
        <tr>
            <td>직업</td>
            <td>
                <select name="job">
                    <option value="전사">전사</option>
                    <option value="마법사">마법사</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>레벨</td>
            <td><input type="number" name="level" value="10" min="1" /></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="캐릭터 생성" />
</form>

<hr>

<% if (result != null) { %>
    <p><b>결과:</b> <%= result %></p>
    <% if (charInfo != null) { %>
        <p><b>캐릭터 정보:</b> <%= charInfo %></p>
        <br>
        <a href="attackMonster.jsp"><button>몬스터 공격 화면으로 이동</button></a>
    <% } %>
<% } %>

<br><br>
<a href="index.jsp">← 메인으로</a>
</body>
</html>
