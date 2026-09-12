<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看投标信息 - 药品在线招投标系统</title>
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
        .tender-info {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .bid-list {
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
        .info-item {
            margin: 10px 0;
        }
        .info-label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
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
        .status-1 {
            color: #4CAF50;
            font-weight: bold;
        }
        .status-0 {
            color: #f44336;
            font-weight: bold;
        }
        .status-2 {
            color: #2196F3;
            font-weight: bold;
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
        <div class="tender-info">
            <h2>${tender.drugName} - 招标详情</h2>
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
            <br>
            <a href="index" class="btn">返回列表</a>
            <c:if test="${tender.status == '1'}">
                <a href="endTender?tenderId=${tender.tenderId}" class="btn btn-danger" style="margin-left: 10px;" onclick="return confirm('确定要结束招标吗？');">结束招标</a>
            </c:if>
        </div>
        
        <div class="bid-list">
            <h2>投标信息列表</h2>
            <c:if test="${empty bids}">
                <p>暂无投标信息</p>
            </c:if>
            <c:if test="${not empty bids}">
                <table>
                    <thead>
                        <tr>
                            <th>投标单位</th>
                            <th>法人姓名</th>
                            <th>联系电话</th>
                            <th>产品批号</th>
                            <th>生产日期</th>
                            <th>有效期</th>
                            <th>投标总金额</th>
                            <th>保证金缴款日期</th>
                            <th>投标日期</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bid" items="${bids}">
                            <tr>
                                <td>${bid.bidCompany}</td>
                                <td>${bid.legalPerson}</td>
                                <td>${bid.phone}</td>
                                <td>${bid.batchNumber}</td>
                                <td>${bid.productionDate}</td>
                                <td>${bid.expirationDate}</td>
                                <td>${bid.totalAmount}元</td>
                                <td>${bid.depositDate}</td>
                                <td>${bid.bidDate}</td>
                                <td class="status-${bid.status}">
                                    <c:choose>
                                        <c:when test="${bid.status == '1'}">已提交</c:when>
                                        <c:when test="${bid.status == '0'}">未中标</c:when>
                                        <c:when test="${bid.status == '2'}">中标</c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${tender.status == '1'}">
                                        <a href="selectWinner?bidId=${bid.id}&tenderId=${tender.tenderId}" class="btn" onclick="return confirm('确定选择该投标单位为中标单位吗？');">选择中标</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <div class="footer">
        <p>© 2026 药品在线招投标系统</p>
    </div>
</body>
</html>