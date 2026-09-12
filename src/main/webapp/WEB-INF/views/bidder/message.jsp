<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>留言板 - 药品在线招投标系统</title>
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
        .message-section {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .message-form {
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            height: 100px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message-list {
            margin-top: 20px;
        }
        .message-item {
            border-bottom: 1px solid #ddd;
            padding: 15px;
        }
        .message-item:hover {
            background-color: #f9f9f9;
        }
        .message-sender {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .message-content {
            margin-bottom: 5px;
        }
        .message-time {
            color: #999;
            font-size: 12px;
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
        <div class="message-section">
            <h2>发布留言</h2>
            <div class="message-form">
                <form action="addMessage" method="post">
                    <div class="form-group">
                        <label for="sender">发送人</label>
                        <input type="text" id="sender" name="sender" required>
                    </div>
                    <div class="form-group">
                        <label for="content">留言内容</label>
                        <textarea id="content" name="content" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="type">留言类型</label>
                        <input type="text" id="type" name="type" placeholder="例如：咨询、建议等">
                    </div>
                    <input type="submit" value="发布留言">
                </form>
            </div>
        </div>
        <div class="message-section">
            <h2>留言列表</h2>
            <div class="message-list">
                <c:forEach var="message" items="${messages}">
                    <div class="message-item">
                        <div class="message-sender">${message.sender}</div>
                        <div class="message-content">${message.content}</div>
                        <div class="message-time">${message.sendTime} - ${message.type}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>