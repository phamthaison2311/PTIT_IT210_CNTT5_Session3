<%--
  Created by IntelliJ IDEA.
  User: shank
  Date: 06/04/2026
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%--Hiển thị cho UC-1 và UC3--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách sinh viên - StudentHub</title>
    <style>
        .status-studying { color: green; font-weight: bold; }
        .status-reserved { color: orange; font-weight: bold; }
        .status-graduated { color: blue; font-weight: bold; }
    </style>
</head>
<body>
<h2>Danh sách sinh viên nhóm G5</h2>

<form action="students" method="GET">
    <input type="text" name="search" placeholder="Nhập tên sinh viên...">
    <button type="submit">Tìm kiếm</button>
</form>

<table border="1" cellpadding="10" cellspacing="0">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã SV</th>
        <th><a href="?sortBy=name">Họ tên (A-Z)</a></th>
        <th>Khoa</th>
        <th><a href="?sortBy=gpa">GPA (Cao -> Thấp)</a></th>
        <th>Trạng thái</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${students}" var="s" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td>${s.studentCode}</td>
            <td>${s.fullName}</td>
            <td>${s.faculty}</td>
            <td>${s.gpa}</td>
            <td>
                <c:choose>
                    <c:when test="${s.status == 'Đang học'}"><span class="status-studying">${s.status}</span></c:when>
                    <c:when test="${s.status == 'Bảo lưu'}"><span class="status-reserved">${s.status}</span></c:when>
                    <c:otherwise><span class="status-graduated">${s.status}</span></c:otherwise>
                </c:choose>
            </td>
            <td><a href="students/detail?id=${s.id}">Xem chi tiết</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="students/dashboard">Xem thống kê</a>
</body>
</html>
