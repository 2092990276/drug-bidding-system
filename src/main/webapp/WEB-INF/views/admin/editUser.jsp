<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑用户 - 药品在线招投标系统</title>
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
        .user-form {
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
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-secondary {
            background-color: #999;
        }
        .btn-secondary:hover {
            background-color: #777;
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
        <div class="user-form">
            <h2>编辑用户信息</h2>
            <form action="doEditUser" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" id="username" name="username" value="${user.username}" readonly>
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="type">用户类型</label>
                    <select id="type" name="type" required>
                        <option value="1" ${user.type == '1' ? 'selected' : ''}>投标单位</option>
                        <option value="2" ${user.type == '2' ? 'selected' : ''}>招标单位</option>
                        <option value="3" ${user.type == '3' ? 'selected' : ''}>管理员</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="companyName">公司名称</label>
                    <input type="text" id="companyName" name="companyName" value="${user.companyName}" required>
                </div>
                <div class="form-group">
                    <label for="contactName">联系人</label>
                    <input type="text" id="contactName" name="contactName" value="${user.contactName}" required>
                </div>
                <div class="form-group">
                    <label for="phone">联系电话</label>
                    <input type="text" id="phone" name="phone" value="${user.phone}" required>
                </div>
                <div class="form-group">
                    <label for="address">地址</label>
                    <input type="text" id="address" name="address" value="${user.address}" required>
                </div>
                <button type="submit" class="btn">提交</button>
                <a href="userList" class="btn btn-secondary">取消</a>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>