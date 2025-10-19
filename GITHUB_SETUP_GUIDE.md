# GitHub网页版设置指南

由于当前环境限制，无法直接在网页版GitHub上操作。请按照以下步骤手动在GitHub网页版完成仓库创建和代码提交：

## 步骤1：创建GitHub账户

如果您还没有GitHub账户，请先访问 [GitHub官网](https://github.com/) 注册一个新账户。

## 步骤2：创建新仓库

1. 登录您的GitHub账户
2. 点击页面右上角的"+"图标，选择"New repository"
3. 在"Repository name"字段中输入 `my_backup_project`
4. 选择仓库的可见性（公开或私有）
5. 可选：勾选"Initialize this repository with a README"（但由于我们已经有README文件，不建议勾选）
6. 点击"Create repository"按钮

## 步骤3：安装Git并配置本地环境

1. 从 [Git官网](https://git-scm.com/downloads) 下载并安装Git
2. 打开命令提示符或Git Bash
3. 导航到您的项目目录：
   ```bash
   cd d:\python练习一\my_backup_project
   ```
4. 配置您的Git用户名和邮箱（与您在GitHub上的账户一致）：
   ```bash
   git config user.name "yuanwj119"
   git config user.email "13639134438@163.com"
   ```
5. 初始化本地Git仓库：
   ```bash
   git init
   ```
6. 将文件添加到暂存区：
   ```bash
   git add .
   ```
7. 提交代码：
   ```bash
   git commit -m "Initial commit"
   ```

## 步骤4：关联本地仓库与GitHub远程仓库

1. 在GitHub上创建的仓库页面中，复制"HTTPS"或"SSH"的远程仓库URL
2. 在命令提示符或Git Bash中，添加远程仓库：
   ```bash
   git remote add origin <您复制的远程仓库URL>
   ```
   例如：
   ```bash
   git remote add origin https://github.com/yuanwj119/my_backup_project.git
   ```
3. 推送到远程仓库：
   ```bash
   git push -u origin master
   ```
   如果您的默认分支名称是`main`，请使用：
   ```bash
   git push -u origin main
   ```

## 步骤5：验证推送是否成功

返回GitHub仓库页面，刷新浏览器，您应该能看到所有已提交的文件。

## 后续操作建议

- 定期执行 `git pull` 以获取远程仓库的最新更改
- 在本地进行更改后，使用 `git add`、`git commit` 和 `git push` 将更改推送到GitHub
- 考虑创建`.gitattributes`文件来处理行尾字符等跨平台问题

如果您遇到任何问题，可以参考GitHub的[官方文档](https://docs.github.com/en)或搜索相关解决方案。