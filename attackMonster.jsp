<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dnf.*" %>
<%
    캐릭터 c          = (캐릭터) session.getAttribute("캐릭터");
    String 플레이어id = (String) session.getAttribute("플레이어id");
    String 결과       = null;

    if (c == null) {
        response.sendRedirect("createCharacter.jsp");
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        전투 전투obj = new 전투();
        결과 = 전투obj.몬스터공격(플레이어id, c);
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

<p><b>플레이어 ID:</b> <%= 플레이어id %></p>
<p><b>캐릭터명:</b> <%= c.get캐릭터명() %></p>
<p><b>직업:</b> <%= c.get직업() %></p>
<p><b>레벨:</b> <%= c.get레벨() %></p>
<p><b>HP:</b> <%= c.getHP() %></p>
<p><b>공격력:</b> <%= (int) c.get공격력() %></p>

<hr>

<form method="POST" action="attackMonster.jsp">
    <input type="submit" value="몬스터 공격!" />
</form>

<hr>

<%
    if (결과 != null) {
%>
<p><b>공격 결과:</b> <%= 결과 %></p>
<%
    }
%>

<br>
<a href="createCharacter.jsp">← 캐릭터 생성으로</a>
&nbsp;&nbsp;
<a href="index.jsp">← 메인으로</a>
</body>
</html>
