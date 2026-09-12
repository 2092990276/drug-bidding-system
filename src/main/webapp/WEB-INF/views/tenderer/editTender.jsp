<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑招标 - 药品在线招投标系统</title>
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
        .tender-form {
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
        input[type="text"], input[type="number"], input[type="date"], textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            height: 100px;
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
        <h1>药品在线招投标系统 - 招标单位</h1>
    </div>
    <div class="nav">
        <a href="index">招标管理</a>
        <a href="message">留言板</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="tender-form">
            <h2>编辑招标信息</h2>
            <form action="doEditTender" method="post">
                <input type="hidden" name="tenderId" value="${tender.tenderId}">
                <div class="form-group">
                    <label for="drugName">药品名称</label>
                    <input type="text" id="drugName" name="drugName" value="${tender.drugName}" required>
                </div>
                <div class="form-group">
                    <label for="manufacturer">制药单位</label>
                    <input type="text" id="manufacturer" name="manufacturer" value="${tender.manufacturer}" required>
                </div>
                <div class="form-group">
                    <label for="packagingRequirements">包装要求</label>
                    <textarea id="packagingRequirements" name="packagingRequirements" required>${tender.packagingRequirements}</textarea>
                </div>
                <div class="form-group">
                    <label for="totalQuantity">总量</label>
                    <input type="number" id="totalQuantity" name="totalQuantity" value="${tender.totalQuantity}" required>
                </div>
                <div class="form-group">
                    <label for="deadline">截止日期</label>
                    <input type="date" id="deadline" name="deadline" value="${tender.deadline}" required>
                </div>
                <div class="form-group">
                    <label for="deposit">投标保证金</label>
                    <input type="number" id="deposit" name="deposit" step="0.01" value="${tender.deposit}" required>
                </div>
                <div class="form-group">
                    <label for="status">状态</label>
                    <select id="status" name="status" required>
                        <option value="1" ${tender.status == '1' ? 'selected' : ''}>招标中</option>
                        <option value="0" ${tender.status == '0' ? 'selected' : ''}>已结束</option>
                    </select>
                </div>
                <button type="submit" class="btn">提交</button>
                <a href="index" class="btn btn-secondary">取消</a>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>