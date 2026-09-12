药品在线招投标系统
📖 项目简介
本项目是一个基于 SSM 框架的药品在线招投标系统，为药品投标单位、招标单位和系统管理员提供一个便捷、高效的在线招投标平台。系统实现了招标信息发布、投标提交、中标选择、留言管理等核心功能，旨在规范药品招投标流程、提高工作效率。

🛠 技术栈
类别	技术
后端框架	Spring + Spring MVC + MyBatis
前端技术	JSP + JSTL + HTML + CSS + JavaScript
数据库	MySQL 5.7+
开发工具	IntelliJ IDEA + Maven + Tomcat
JDK 版本	JDK 1.8+
✨ 功能模块
👤 用户管理
用户注册（支持投标单位、招标单位）

用户登录（根据角色跳转对应首页）

🏢 招标单位模块
发布招标信息

查看 / 编辑 / 删除 / 查询招标信息

查看投标信息

选择中标单位

结束招标

🏭 投标单位模块
查看招标信息列表及详情

提交投标信息

查看投标结果

💬 留言管理
用户发布留言、查看留言列表

管理员管理留言（查看 / 删除）

🔧 管理员模块
用户管理（查看 / 编辑 / 删除）

留言管理（查看 / 删除）

🗂 数据库设计
系统包含四张核心数据表：

表名	说明
user	用户信息表（投标单位、招标单位、管理员）
tender	招标信息表
bid	投标信息表
message	留言信息表
建表 SQL 见项目根目录下的 sql/ 文件夹。

🚀 本地运行
克隆项目

bash
git clone https://github.com/你的用户名/药品在线招投标系统.git
导入数据库

在 MySQL 中创建数据库 drug_bidding

执行 sql/init.sql 文件初始化表结构和测试数据

修改配置

打开 src/main/resources/applicationContext.xml，修改数据库连接信息

部署运行

用 IDEA 打开项目，配置 Tomcat

启动 Tomcat，访问 http://localhost:8080/drug-bidding-system/login

📸 项目截图


👨‍💻 作者
李欣
东华理工大学 软件工程专业

GitHub：@2092990276
