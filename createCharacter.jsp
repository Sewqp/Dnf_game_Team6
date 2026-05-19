<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dnf.*" %>
<%
    String 결과 = null;
    String 캐릭터정보 = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String 플레이어id = request.getParameter("플레이어id");
        String 캐릭터명   = request.getParameter("캐릭터명");
        String 직업       = request.getParameter("직업");
        String 레벨str    = request.getParameter("레벨");

        int 레벨 = 1;
        try { 레벨 = Integer.parseInt(레벨str); } catch (Exception e) {}

        전투 전투obj = new 전투();
        캐릭터 c = 전투obj.캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨);

        if (c != null) {
            결과 = "캐릭터 생성 성공";
            캐릭터정보 = "이름: " + c.get캐릭터명()
                      + " | 직업: " + c.get직업()
                      + " | 레벨: " + c.get레벨()
                      + " | HP: " + c.getHP()
                      + " | 공격력: " + (int) c.get공격력();
            // 세션에 캐릭터 저장 (공격 화면에서 사용)
            session.setAttribute("캐릭터", c);
            session.setAttribute("플레이어id", 플레이어id);
        } else {
            결과 = "캐릭터 생성 실패: 플레이어 인증 오류 (id는 hero 만 허용)";
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
            <td><input type="text" name="플레이어id" value="hero" /></td>
        </tr>
        <tr>
            <td>캐릭터명</td>
            <td><input type="text" name="캐릭터명" /></td>
        </tr>
        <tr>
            <td>직업</td>
            <td>
                <select name="직업">
                    <option value="전사">전사</option>
                    <option value="마법사">마법사</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>레벨</td>
            <td><input type="number" name="레벨" value="10" min="1" /></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="캐릭터 생성" />
</form>

<hr>

<%
    if (결과 != null) {
%>
<p><b>결과:</b> <%= 결과 %></p>
<%
        if (캐릭터정보 != null) {
%>
<p><b>캐릭터 정보:</b> <%= 캐릭터정보 %></p>
<br>
<a href="attackMonster.jsp"><button>몬스터 공격 화면으로 이동</button></a>
<%
        }
    }
%>

<br><br>
<a href="index.jsp">← 메인으로</a>
</body>
</html>
