# my_backup_project

这是一个Django备份项目，用于管理和执行备份任务。

## 项目结构

项目采用标准的Django项目结构，包含以下主要组件：

- `my_backup_project/` - 项目配置目录
- `backup/` - 备份应用程序
- `static/` - 静态文件目录
- `templates/` - 模板文件目录
- `requirements.txt` - 项目依赖
- `.gitignore` - Git忽略文件配置

## 快速开始

### 1. 安装依赖

```bash
pip install -r requirements.txt
```

### 2. 数据库迁移

```bash
python manage.py migrate
```

### 3. 创建超级用户

已创建超级用户，用户名：admin，邮箱：admin@example.com

### 4. 运行开发服务器

```bash
python manage.py runserver
```

访问 http://127.0.0.1:8000/ 查看首页，或 http://127.0.0.1:8000/admin/ 访问管理界面。

## Git设置说明

注意：当前环境中未安装Git。请手动在本地安装Git，并执行以下命令初始化仓库：

```bash
# 在项目根目录下执行
git init
git config user.name "yuanwj119"
git config user.email "13639134438@163.com"
```

然后添加和提交代码：

```bash
git add .
git commit -m "Initial commit"
```

## 功能说明

当前项目包含一个简单的首页视图，后续可以根据需求扩展备份相关功能。