<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dnf.Character, com.dnf.Battle, com.dnf.Warrior, com.dnf.Mage, com.dnf.Player" %>
<%
    Character c    = (Character) session.getAttribute("character");
    String playerId = (String) session.getAttribute("playerId");
    String result   = null;

    if (c == null) {
        response.sendRedirect("createCharacter.jsp");
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        Battle battle = new Battle();
        result = battle.attackMonster(playerId, c);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>몬스터 공격 - 던전앤파이터</title>
</head>
<body>
<h2>[ 몬스터 공격 ]</h2>
<hr>

<p><b>플레이어 ID:</b> <%= playerId %></p>
<p><b>캐릭터명:</b> <%= c.getName() %></p>
<p><b>직업:</b> <%= c.getJob() %></p>
<p><b>레벨:</b> <%= c.getLevel() %></p>
<p><b>HP:</b> <%= c.getHp() %></p>
<p><b>공격력:</b> <%= (int) c.getAttack() %></p>

<hr>

<form method="POST" action="attackMonster.jsp">
    <input type="submit" value="몬스터 공격!" />
</form>

<hr>

<% if (result != null) { %>
    <p><b>공격 결과:</b> <%= result %></p>
<% } %>

<br>
<a href="createCharacter.jsp">← 캐릭터 생성으로</a>
&nbsp;&nbsp;
<a href="index.jsp">← 메인으로</a>
</body>
</html>
