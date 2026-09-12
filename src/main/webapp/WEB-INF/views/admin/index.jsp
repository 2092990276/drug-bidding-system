<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统管理员 - 药品在线招投标系统</title>
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
        .admin-dashboard {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .dashboard-title {
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .dashboard-cards {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
        .dashboard-card {
            flex: 1;
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .dashboard-card h3 {
            color: #4CAF50;
            margin-top: 0;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            display: inline-block;
            margin-top: 10px;
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
        <h1>药品在线招投标系统 - 系统管理员</h1>
    </div>
    <div class="nav">
        <a href="index">首页</a>
        <a href="userList">用户管理</a>
        <a href="messageList">留言板管理</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="admin-dashboard">
            <h2 class="dashboard-title">系统管理中心</h2>
            <div class="dashboard-cards">
                <div class="dashboard-card">
                    <h3>用户管理</h3>
                    <p>管理所有投标单位和招标单位的信息</p>
                    <a href="userList" class="btn">进入管理</a>
                </div>
                <div class="dashboard-card">
                    <h3>留言板管理</h3>
                    <p>查看和管理系统中的留言信息</p>
                    <a href="messageList" class="btn">进入管理</a>
                </div>
                <div class="dashboard-card">
                    <h3>系统设置</h3>
                    <p>系统相关设置和配置</p>
                    <a href="#" class="btn">进入设置</a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>