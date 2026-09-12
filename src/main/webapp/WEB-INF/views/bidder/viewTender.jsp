<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看招标详情 - 药品在线招投标系统</title>
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
        .tender-detail {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .tender-info {
            margin-bottom: 20px;
        }
        .tender-info h2 {
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .info-item {
            margin: 10px 0;
        }
        .info-label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
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
        <div class="tender-detail">
            <h2>${tender.drugName} - 招标详情</h2>
            <div class="tender-info">
                <div class="info-item">
                    <span class="info-label">招标编号:</span>
                    <span>${tender.tenderId}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">药品名称:</span>
                    <span>${tender.drugName}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">制药单位:</span>
                    <span>${tender.manufacturer}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">包装要求:</span>
                    <span>${tender.packagingRequirements}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">总量:</span>
                    <span>${tender.totalQuantity}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">截止日期:</span>
                    <span>${tender.deadline}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">投标保证金:</span>
                    <span>${tender.deposit}元</span>
                </div>
                <div class="info-item">
                    <span class="info-label">状态:</span>
                    <span>${tender.status == '1' ? '招标中' : '已结束'}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">发布时间:</span>
                    <span>${tender.createTime}</span>
                </div>
            </div>
            <a href="index" class="btn">返回列表</a>
            <c:if test="${tender.status == '1'}">
                <a href="bid?tenderId=${tender.tenderId}" class="btn" style="margin-left: 10px;">立即投标</a>
            </c:if>
            <c:if test="${tender.status == '0'}">
                <a href="#" class="btn" style="margin-left: 10px; background-color: #999; cursor: not-allowed;">已结束</a>
            </c:if>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>