<%--
  Created by IntelliJ IDEA.
  User: shank
  Date: 06/04/2026
  Time: 11:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%--Hiển thị cho UC-4--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Dashboard - StudentHub</title></head>
<body>
<h2>Báo cáo Tổng quan Nhóm G5</h2>
<div style="border: 1px solid #ccc; padding: 20px; width: 300px;">
    <p><b>Tổng số sinh viên:</b> ${stats.total}</p>
    <p><b>GPA Trung bình:</b> ${stats.avgGpa}</p>
    <hr>
    <p><b>Thủ khoa:</b> <br>
        <span style="color: red; font-size: 1.2em;">${stats.valedictorian.fullName}</span>
        (${stats.valedictorian.gpa})
    </p>
</div>
<br>
<a href="students">Xem danh sách sinh viên</a>
</body>
</html>
