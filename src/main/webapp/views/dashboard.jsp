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
<div style="border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 10px; font-family: Arial, sans-serif;">
    <p><b>Tổng số sinh viên:</b> ${stats.total}</p>
    <p><b>GPA Trung bình:</b> ${stats.avgGpa}</p>
    <hr>

    <h4>Tỷ lệ theo trạng thái:</h4>

    <p>Đang học: <b>${stats.pctStudying}%</b></p>
    <div style="background-color: #ddd; border-radius: 5px;">
        <div style="width: ${stats.pctStudying}%; background-color: #4CAF50; height: 10px; border-radius: 5px;"></div>
    </div>

    <p>Bảo lưu: <b>${stats.pctReserved}%</b></p>
    <div style="background-color: #ddd; border-radius: 5px;">
        <div style="width: ${stats.pctReserved}%; background-color: #FF9800; height: 10px; border-radius: 5px;"></div>
    </div>

    <p>Tốt nghiệp: <b>${stats.pctGraduated}%</b></p>
    <div style="background-color: #ddd; border-radius: 5px;">
        <div style="width: ${stats.pctGraduated}%; background-color: #2196F3; height: 10px; border-radius: 5px;"></div>
    </div>

    <hr>
    <p><b>Thủ khoa:</b> <br>
        <span style="color: red; font-size: 1.2em; font-weight: bold;">${stats.valedictorian.fullName}</span>
        (${stats.valedictorian.gpa})
    </p>
</div>
<br>
<a href="../students">Quay lại danh sách</a>
</body>
</html>
