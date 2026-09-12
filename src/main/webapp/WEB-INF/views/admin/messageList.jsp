<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>留言板管理 - 药品在线招投标系统</title>
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
        }
        .message-list {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
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
        .btn-danger {
            background-color: #f44336;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn-danger:hover {
            background-color: #da190b;
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
        <h1>药品在线招投标系统 - 系统管理员</h1>
    </div>
    <div class="nav">
        <a href="index">首页</a>
        <a href="userList">用户管理</a>
        <a href="messageList">留言板管理</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="message-list">
            <h2>留言板管理</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>发送人</th>
                        <th>留言内容</th>
                        <th>发送时间</th>
                        <th>留言类型</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="message" items="${messages}">
                        <tr>
                            <td>${message.id}</td>
                            <td>${message.sender}</td>
                            <td>${message.content}</td>
                            <td>${message.sendTime}</td>
                            <td>${message.type}</td>
                            <td>${message.status == '1' ? '已发布' : '已删除'}</td>
                            <td>
                                <a href="deleteMessage?id=${message.id}" class="btn-danger" onclick="return confirm('确定要删除吗？');">删除</a>
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