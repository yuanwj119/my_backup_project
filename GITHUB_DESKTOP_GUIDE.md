# 使用GitHub桌面版创建远程仓库指南

感谢您告知已安装GitHub桌面版！本指南将详细指导您如何使用GitHub桌面版在GitHub上创建名为"my_backup_project"的远程仓库，并获取仓库的SSH或HTTPS地址。

## 步骤1：打开GitHub桌面版并登录

1. 双击桌面上的GitHub桌面版图标打开应用程序
2. 如果尚未登录，请点击"Sign in to GitHub.com"按钮
3. 输入您的GitHub用户名（yuanwj119）和密码，点击"Sign in"
4. 如果启用了双因素认证，还需要输入验证码

## 步骤2：将现有项目添加到GitHub桌面版

1. 在GitHub桌面版中，点击左上角的"File"菜单
2. 选择"Add Local Repository..."选项
3. 在弹出的对话框中，点击"Choose..."按钮
4. 导航到您的项目目录：`d:\python练习一\my_backup_project`
5. 选中该目录后，点击"Select Folder"按钮
6. 点击"Add Repository"按钮将项目添加到GitHub桌面版

## 步骤3：在GitHub上创建远程仓库

1. 添加项目后，GitHub桌面版会显示项目的更改摘要
2. 在左侧边栏中，确保您的项目"my_backup_project"被选中
3. 点击顶部菜单栏中的"Publish repository"按钮（通常位于右上角）
4. 在弹出的"Publish Repository"对话框中：
   - **Repository Name**: 确保显示的是"my_backup_project"
   - **Description**: 可选，为您的仓库添加描述（例如："Django备份项目"）
   - **Visibility**: 选择仓库的可见性（公开或私有）
   - **Keep this code private**: 如果要创建私有仓库，请勾选此选项
   - **GitHub.com**: 确保显示的是您的GitHub账户（yuanwj119）
5. 点击"Publish Repository"按钮开始创建过程

## 步骤4：获取远程仓库的SSH或HTTPS地址

创建完成后，有两种方法可以获取仓库的地址：

### 方法1：从GitHub桌面版获取

1. 在GitHub桌面版中，确保您的项目"my_backup_project"被选中
2. 点击顶部菜单栏中的"Repository"选项
3. 选择"Repository Settings..."选项
4. 在弹出的设置窗口中，选择"Remote"选项卡
5. 您将看到仓库的HTTPS地址，格式类似于：`https://github.com/yuanwj119/my_backup_project.git`
6. 点击地址旁边的复制图标将地址复制到剪贴板

### 方法2：从GitHub网站获取

1. 在GitHub桌面版中，右键点击您的项目名称
2. 选择"View on GitHub"选项，浏览器会打开您的仓库页面
3. 在仓库页面上，点击绿色的"Code"按钮
4. 在弹出的下拉菜单中，您可以看到两种类型的地址：
   - **HTTPS**: 默认显示，格式为 `https://github.com/yuanwj119/my_backup_project.git`
   - **SSH**: 点击"SSH"标签可切换到SSH地址，格式为 `git@github.com:yuanwj119/my_backup_project.git`
5. 点击地址旁边的复制图标将地址复制到剪贴板

## 步骤5：确认本地项目已关联远程仓库

1. 在GitHub桌面版中，点击顶部菜单栏中的"Repository"选项
2. 选择"Open in Command Prompt"（或"Open in Git Bash"）
3. 在命令行窗口中，输入以下命令：
   ```cmd
   git remote -v
   ```
4. 您应该能看到类似以下的输出：
   ```
   origin  https://github.com/yuanwj119/my_backup_project.git (fetch)
   origin  https://github.com/yuanwj119/my_backup_project.git (push)
   ```
   这表明您的本地项目已成功关联到GitHub上的远程仓库

## 步骤6：推送本地代码到远程仓库

1. 在GitHub桌面版中，确保您的项目"my_backup_project"被选中
2. 在左侧边栏的"Changes"选项卡中，查看所有未提交的更改
3. 在底部的提交信息框中，输入一个有意义的提交消息（例如："Initial commit"）
4. 点击"Commit to master"（或"Commit to main"）按钮
5. 提交完成后，点击顶部的"Push origin"按钮将代码推送到GitHub

## 常见问题及解决方案

### 1. 无法找到"Publish repository"按钮

如果没有看到"Publish repository"按钮，可能是因为您的项目已经关联了远程仓库。请按照步骤4中的方法检查远程仓库地址。

### 2. 推送失败

如果推送失败，可能是因为远程仓库已经存在同名项目或有冲突。请检查您的GitHub账户上是否已有名为"my_backup_project"的仓库。

### 3. 无法登录GitHub桌面版

如果无法登录，请确保：
- 您的GitHub用户名和密码正确
- 如果启用了双因素认证，使用正确的验证码
- 您的网络连接正常

### 4. 如何切换SSH和HTTPS协议

如果您想切换远程仓库的协议（从HTTPS到SSH或反之），可以：
1. 按照步骤4获取新协议的地址
2. 在GitHub桌面版中，进入仓库设置的"Remote"选项卡
3. 删除现有的远程地址
4. 添加新协议的地址
5. 点击"Save"按钮保存更改

## 后续操作建议

- 定期使用GitHub桌面版的"Fetch origin"按钮获取远程仓库的最新更改
- 在本地进行更改后，使用GitHub桌面版的提交和推送功能更新远程仓库
- 探索GitHub桌面版的其他功能，如分支管理、合并请求等

如果您遇到任何其他问题，可以参考GitHub的[官方文档](https://docs.github.com/en/desktop)或搜索相关解决方案。

祝您使用GitHub桌面版愉快！