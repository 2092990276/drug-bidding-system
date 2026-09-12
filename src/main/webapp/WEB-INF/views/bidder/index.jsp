<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>投标单位 - 药品在线招投标系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .nav {
            background-color: #4CAF50;
            padding: 10px;
        }
        .nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        .content {
            padding: 20px;
            padding-bottom: 80px; /* 增加底部边距，防止被footer覆盖 */
        }
        .tender-list {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .tender-item {
            border-bottom: 1px solid #ddd;
            padding: 15px;
        }
        .tender-item:hover {
            background-color: #f9f9f9;
        }
        .tender-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .tender-info {
            color: #666;
            margin-bottom: 10px;
        }
        .tender-actions {
            margin-top: 10px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>药品在线招投标系统 - 投标单位</h1>
    </div>
    <div class="nav">
        <a href="index">首页</a>
        <a href="message">留言板</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="tender-list">
            <h2>招标信息列表</h2>
            <c:forEach var="tender" items="${tenders}">
                <div class="tender-item">
                    <div class="tender-title">${tender.drugName}</div>
                    <div class="tender-info">
                        招标编号: ${tender.tenderId}<br>
                        制药单位: ${tender.manufacturer}<br>
                        包装要求: ${tender.packagingRequirements}<br>
                        总量: ${tender.totalQuantity}<br>
                        截止日期: ${tender.deadline}<br>
                        投标保证金: ${tender.deposit}元<br>
                        状态: <c:if test="${tender.status == '1'}"><span style="color: #4CAF50; font-weight: bold;">招标中</span></c:if>
                            <c:if test="${tender.status == '0'}"><span style="color: #f44336; font-weight: bold;">已结束</span></c:if>
                    </div>
                    <div class="tender-actions">
                        <a href="viewTender?tenderId=${tender.tenderId}" class="btn">查看详情</a>
                        <c:if test="${tender.status == '1'}">
                            <a href="bid?tenderId=${tender.tenderId}" class="btn" style="margin-left: 10px;">立即投标</a>
                        </c:if>
                        <c:if test="${tender.status == '0'}">
                            <a href="#" class="btn" style="margin-left: 10px; background-color: #999; cursor: not-allowed;">已结束</a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>