-- 创建数据库
CREATE DATABASE IF NOT EXISTS drug_bidding DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE drug_bidding;

-- 创建用户表
CREATE TABLE IF NOT EXISTS user (
                                    id INT PRIMARY KEY AUTO_INCREMENT,
                                    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    type VARCHAR(10) NOT NULL COMMENT '1: 投标单位, 2: 招标单位, 3: 管理员',
    company_name VARCHAR(100),
    contact_name VARCHAR(50),
    phone VARCHAR(20),
    address VARCHAR(200)
    );

-- 创建招标信息表
CREATE TABLE IF NOT EXISTS tender (
    tender_id VARCHAR(20) PRIMARY KEY,
    drug_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    packaging_requirements VARCHAR(500),
    total_quantity INT NOT NULL,
    deadline DATETIME NOT NULL,
    deposit DOUBLE NOT NULL,
    status VARCHAR(10) NOT NULL COMMENT '1: 招标中, 0: 已结束',
    create_time DATETIME NOT NULL
    );

-- 创建投标信息表
CREATE TABLE IF NOT EXISTS bid (
                                   id INT PRIMARY KEY AUTO_INCREMENT,
                                   bid_date DATETIME NOT NULL,
                                   bid_company VARCHAR(100) NOT NULL,
    legal_person VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    tender_id VARCHAR(20) NOT NULL,
    batch_number VARCHAR(50) NOT NULL,
    production_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    total_amount DOUBLE NOT NULL,
    deposit_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL COMMENT '1: 已提交, 0: 已拒绝',
    FOREIGN KEY (tender_id) REFERENCES tender(tender_id)
    );

-- 创建留言表
CREATE TABLE IF NOT EXISTS message (
                                       id INT PRIMARY KEY AUTO_INCREMENT,
                                       sender VARCHAR(50) NOT NULL,
    content VARCHAR(1000) NOT NULL,
    send_time DATETIME NOT NULL,
    type VARCHAR(50),
    status VARCHAR(10) NOT NULL COMMENT '1: 已发布, 0: 已删除'
    );

-- 插入默认管理员用户（如果不存在）
INSERT INTO user (username, password, type, company_name, contact_name, phone, address) 
SELECT 'admin', 'admin123', '3', '系统管理', '管理员', '13800138000', '系统管理中心'
WHERE NOT EXISTS (SELECT 1 FROM user WHERE username = 'admin');

-- 插入测试数据
INSERT INTO user (username, password, type, company_name, contact_name, phone, address) 
VALUES 
('bidder1', 'bidder123', '1', 'XX制药有限公司', '张三', '13800138001', '北京市朝阳区'),
('bidder2', 'bidder123', '1', 'YY制药有限公司', '王五', '13800138002', '上海市浦东新区'),
('bidder3', 'bidder123', '1', 'ZZ制药有限公司', '赵六', '13800138003', '广州市天河区'),
('tenderer1', 'tenderer123', '2', 'XX医院', '李四', '13900139001', '上海市浦东新区'),
('tenderer2', 'tenderer123', '2', 'YY医院', '钱七', '13900139002', '北京市海淀区'),
('tenderer3', 'tenderer123', '2', 'ZZ医院', '孙八', '13900139003', '广州市越秀区');

INSERT INTO tender (tender_id, drug_name, manufacturer, packaging_requirements, total_quantity, deadline, deposit, status, create_time) 
VALUES 
('T2026030401', '阿莫西林胶囊', 'XX制药有限公司', '铝塑包装，每盒24粒', 10000, '2026-03-31 23:59:59', 5000.00, '1', '2026-03-04 10:00:00'),
('T2026030402', '布洛芬缓释胶囊', 'YY制药有限公司', '铝塑包装，每盒12粒', 5000, '2026-04-15 23:59:59', 3000.00, '1', '2026-03-04 11:00:00'),
('T2026030403', '头孢拉定胶囊', 'ZZ制药有限公司', '铝塑包装，每盒16粒', 8000, '2026-04-30 23:59:59', 4000.00, '1', '2026-03-04 12:00:00'),
('T2026030404', '盐酸伐地那非片', 'XX制药有限公司', '铝塑包装，每盒8片', 3000, '2026-05-15 23:59:59', 6000.00, '1', '2026-03-04 13:00:00'),
('T2026030405', '葡萄糖注射液', 'YY制药有限公司', '玻璃瓶装，每瓶250ml', 15000, '2026-05-30 23:59:59', 7000.00, '1', '2026-03-04 14:00:00');

INSERT INTO bid (bid_date, bid_company, legal_person, phone, tender_id, batch_number, production_date, expiration_date, total_amount, deposit_date, status) 
VALUES 
('2026-03-05 10:00:00', 'XX制药有限公司', '张三', '13800138001', 'T2026030401', '20260301', '2026-03-01', '2028-03-01', 95000.00, '2026-03-05', '1'),
('2026-03-06 11:00:00', 'YY制药有限公司', '王五', '13800138002', 'T2026030401', '20260302', '2026-03-02', '2028-03-02', 92000.00, '2026-03-06', '1'),
('2026-03-07 14:00:00', 'ZZ制药有限公司', '赵六', '13800138003', 'T2026030402', '20260303', '2026-03-03', '2028-03-03', 48000.00, '2026-03-07', '1');

INSERT INTO message (sender, content, send_time, type, status) 
VALUES 
('张三', '请问投标保证金如何缴纳？', '2026-03-04 14:00:00', '咨询', '1'),
('李四', '招标信息已更新，请各位投标单位注意查看', '2026-03-04 15:00:00', '通知', '1'),
('王五', '什么时候公布中标结果？', '2026-03-05 09:00:00', '咨询', '1'),
('钱七', '新的招标项目已发布，请及时查看', '2026-03-05 10:00:00', '通知', '1'),
('赵六', '投标文件需要准备哪些材料？', '2026-03-06 14:00:00', '咨询', '1'),
('孙八', '招标截止日期已延长至4月30日', '2026-03-07 11:00:00', '通知', '1');