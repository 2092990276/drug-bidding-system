<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>招标单位 - 药品在线招投标系统</title>
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
        .tender-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .tender-header h2 {
            margin: 0;
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
        .btn-danger {
            background-color: #f44336;
        }
        .btn-danger:hover {
            background-color: #da190b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
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
        <h1>药品在线招投标系统 - 招标单位</h1>
    </div>
    <div class="nav">
        <a href="index">招标管理</a>
        <a href="message">留言板</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="tender-list">
            <div class="tender-header">
                <h2>招标信息列表</h2>
                <a href="addTender" class="btn">添加招标</a>
            </div>
            <div class="search-form" style="margin-bottom: 20px; padding: 15px; background-color: #f9f9f9; border-radius: 8px;">
                <form action="search" method="post" style="display: flex; gap: 10px; align-items: center;">
                    <div>
                        <label for="drugName">药品名称：</label>
                        <input type="text" id="drugName" name="drugName" style="padding: 6px; border: 1px solid #ddd; border-radius: 4px;">
                    </div>
                    <div>
                        <label for="tenderId">招标编号：</label>
                        <input type="text" id="tenderId" name="tenderId" style="padding: 6px; border: 1px solid #ddd; border-radius: 4px;">
                    </div>
                    <button type="submit" class="btn">查询</button>
                    <a href="index" class="btn btn-secondary" style="background-color: #999; margin-left: 5px;">重置</a>
                </form>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>招标编号</th>
                        <th>药品名称</th>
                        <th>制药单位</th>
                        <th>总量</th>
                        <th>截止日期</th>
                        <th>保证金</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tender" items="${tenders}">
                        <tr>
                            <td>${tender.tenderId}</td>
                            <td>${tender.drugName}</td>
                            <td>${tender.manufacturer}</td>
                            <td>${tender.totalQuantity}</td>
                            <td>${tender.deadline}</td>
                            <td>${tender.deposit}元</td>
                            <td>${tender.status == '1' ? '招标中' : '已结束'}</td>
                            <td>
                                <a href="editTender?tenderId=${tender.tenderId}" class="btn">编辑</a>
                                <a href="viewBids?tenderId=${tender.tenderId}" class="btn" style="margin-left: 5px;">查看投标</a>
                                <a href="deleteTender?tenderId=${tender.tenderId}" class="btn btn-danger" style="margin-left: 5px;" onclick="return confirm('确定要删除吗？');">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>