<%--
  Created by IntelliJ IDEA.
  User: shank
  Date: 06/04/2026
  Time: 11:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%--Hiển thị cho UC-2--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Chi tiết sinh viên</title></head>
<body>
<h2>Thông tin chi tiết sinh viên</h2>
<ul>
    <li><b>Mã SV:</b> ${student.studentCode}</li>
    <li><b>Họ tên:</b> ${student.fullName}</li>
    <li><b>Khoa:</b> ${student.faculty}</li>
    <li><b>Năm nhập học:</b> ${student.enrollmentYear}</li>
    <li><b>GPA:</b> ${student.gpa}</li>
    <li><b>Trạng thái:</b> ${student.status}</li>
</ul>
<br>
<a href="${pageContext.request.contextPath}/students">Quay lại danh sách</a>
</body>
</html>
