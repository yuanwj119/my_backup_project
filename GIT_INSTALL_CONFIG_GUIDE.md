# Git安装与配置详细指南

根据系统检测，您的计算机上尚未安装Git。本指南将帮助您在Windows系统上完成Git的安装和配置，以便将您的Django项目推送到GitHub。

## 步骤1：下载并安装Git

1. 打开浏览器，访问 [Git官网下载页面](https://git-scm.com/downloads/win)
2. 网站会自动检测您的操作系统并提供相应的下载链接，点击下载最新版本的Git for Windows
3. 下载完成后，双击安装程序开始安装

### 安装过程中的重要选项：

- **选择安装位置**：保持默认或选择您喜欢的位置
- **选择组件**：确保勾选所有默认组件，特别是"Git Bash Here"和"Git GUI Here"
- **选择默认编辑器**：推荐选择您熟悉的编辑器，如Notepad++或Visual Studio Code
- **调整PATH环境变量**：选择"Use Git from the Windows Command Prompt"选项，这样可以在命令提示符中使用Git命令
- **选择HTTPS传输后端**：保持默认选择"Use the OpenSSL library"
- **配置行尾转换**：选择"Checkout Windows-style, commit Unix-style line endings"
- **配置终端模拟器**：选择"Use Windows' default console window"
- **配置额外选项**：保持默认选项

点击"Install"完成安装。

## 步骤2：验证Git安装

1. 安装完成后，按下 `Win + R` 键打开运行对话框
2. 输入 `cmd` 并按Enter，打开命令提示符
3. 在命令提示符中输入以下命令：
   ```cmd
   git --version
   ```
4. 如果安装成功，您将看到Git的版本信息

## 步骤3：配置Git用户信息

1. 在命令提示符中，导航到您的项目目录：
   ```cmd
   cd d:\python练习一\my_backup_project
   ```
2. 配置您的Git用户名和邮箱（请使用您在GitHub上注册的账户信息）：
   ```cmd
   git config --global user.name "yuanwj119"
   git config --global user.email "13639134438@163.com"
   ```
3. 验证配置是否成功：
   ```cmd
   git config --list
   ```
   您应该能看到刚才设置的用户名和邮箱信息

## 步骤4：初始化本地Git仓库

1. 在项目目录中，执行以下命令初始化Git仓库：
   ```cmd
   git init
   ```
   您将看到类似"Initialized empty Git repository in D:/python练习一/my_backup_project/.git/"的提示

2. 将所有文件添加到暂存区：
   ```cmd
   git add .
   ```

3. 提交代码到本地仓库：
   ```cmd
   git commit -m "Initial commit: Django backup project"
   ```

## 步骤5：在GitHub上创建仓库

1. 打开浏览器，访问 [GitHub官网](https://github.com/) 并登录您的账户
2. 点击页面右上角的"+"图标，选择"New repository"
3. 在"Repository name"字段中输入 `my_backup_project`
4. 选择仓库的可见性（公开或私有）
5. 不要勾选"Initialize this repository with a README"，因为我们已经有README文件
6. 点击"Create repository"按钮

## 步骤6：关联本地仓库与GitHub远程仓库

1. 在GitHub上创建的仓库页面中，复制"HTTPS"的远程仓库URL（格式为：https://github.com/yuanwj119/my_backup_project.git）

2. 在命令提示符中，添加远程仓库：
   ```cmd
   git remote add origin https://github.com/yuanwj119/my_backup_project.git
   ```
   请将上面的URL替换为您实际复制的URL

3. 推送到远程仓库：
   ```cmd
   git push -u origin master
   ```
   如果提示默认分支名称是`main`，请使用：
   ```cmd
   git push -u origin main
   ```

4. 首次推送时，系统可能会提示您输入GitHub的用户名和密码。如果使用的是较新版本的Git，可能需要使用个人访问令牌（PAT）作为密码。

## 步骤7：验证推送是否成功

返回GitHub仓库页面，刷新浏览器，您应该能看到所有已提交的文件。

## 常见问题及解决方案

### 1. 无法识别git命令

如果安装后在命令提示符中输入`git`命令显示"不是内部或外部命令"，可能是环境变量配置问题：

- 重新运行Git安装程序，确保选择了"Use Git from the Windows Command Prompt"选项
- 或者手动添加Git的安装路径到系统环境变量PATH中

### 2. 推送时认证失败

如果遇到认证失败的问题，可能是因为GitHub不再支持密码认证：

1. 访问GitHub，进入"Settings" -> "Developer settings" -> "Personal access tokens" -> "Tokens (classic)"
2. 点击"Generate new token"，选择适当的权限（至少需要repo权限）
3. 生成令牌后，复制并妥善保存
4. 在推送时，使用这个令牌作为密码

### 3. 推送冲突

如果GitHub仓库不为空（例如您勾选了初始化README），推送可能会失败：

1. 先拉取远程仓库的更改：
   ```cmd
   git pull origin master --allow-unrelated-histories
   ```
2. 解决可能的冲突后，再次推送：
   ```cmd
   git push -u origin master
   ```

## 后续Git操作建议

- 定期执行 `git pull` 以获取远程仓库的最新更改
- 在本地进行更改后，使用以下命令将更改推送到GitHub：
  ```cmd
  git add .
  git commit -m "描述您的更改"
  git push
  ```
- 使用 `git status` 查看当前仓库状态
- 使用 `git log` 查看提交历史

如果您遇到任何其他问题，可以参考GitHub的[官方文档](https://docs.github.com/en)或搜索相关解决方案。

祝您使用Git和GitHub愉快！