<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>投标 - 药品在线招投标系统</title>
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
        .bid-form {
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
        input[type="text"], input[type="number"], input[type="date"], textarea {
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
        <h1>药品在线招投标系统 - 投标单位</h1>
    </div>
    <div class="nav">
        <a href="index">首页</a>
        <a href="message">留言板</a>
        <a href="../logout">退出登录</a>
    </div>
    <div class="content">
        <div class="bid-form">
            <h2>${tender.drugName} - 投标</h2>
            <form action="doBid" method="post">
                <input type="hidden" name="tenderId" value="${tender.tenderId}">
                <div class="form-group">
                    <label for="bidCompany">投标单位</label>
                    <input type="text" id="bidCompany" name="bidCompany" required>
                </div>
                <div class="form-group">
                    <label for="legalPerson">法人姓名</label>
                    <input type="text" id="legalPerson" name="legalPerson" required>
                </div>
                <div class="form-group">
                    <label for="phone">联系电话</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="batchNumber">产品批号</label>
                    <input type="text" id="batchNumber" name="batchNumber" required>
                </div>
                <div class="form-group">
                    <label for="productionDate">生产日期</label>
                    <input type="date" id="productionDate" name="productionDate" required>
                </div>
                <div class="form-group">
                    <label for="expirationDate">有效期</label>
                    <input type="date" id="expirationDate" name="expirationDate" required>
                </div>
                <div class="form-group">
                    <label for="totalAmount">投标总金额</label>
                    <input type="number" id="totalAmount" name="totalAmount" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="depositDate">投标保证金缴款日期</label>
                    <input type="date" id="depositDate" name="depositDate" required>
                </div>
                <button type="submit" class="btn">提交投标</button>
                <a href="index" class="btn btn-secondary">取消</a>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>