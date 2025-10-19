# Git提交命令指南

以下是完成项目基本功能开发后进行Git提交的完整命令列表。请注意，在执行这些命令前，确保您已经安装了Git并正确配置了用户信息。

## 基本提交命令

按照您的要求，以下是添加所有文件并提交的命令：

```bash
# 添加项目中所有修改的文件到暂存区
git add .

# 提交代码到本地仓库，备注为"完成基本功能开发"
git commit -m "完成基本功能开发"
```

## 完整的Git工作流程

为了帮助您更好地管理代码，以下是完整的Git工作流程命令：

1. **初始化Git仓库**（如果尚未初始化）：
   ```bash
git init
   ```

2. **配置Git用户信息**（如果尚未配置）：
   ```bash
git config --global user.name "yuanwj119"
git config --global user.email "13639134438@163.com"
   ```

3. **检查当前仓库状态**：
   ```bash
git status
   ```

4. **添加所有文件到暂存区**：
   ```bash
git add .
   ```

5. **提交代码到本地仓库**：
   ```bash
git commit -m "完成基本功能开发"
   ```

6. **关联远程仓库**（如果尚未关联）：
   ```bash
git remote add origin <您的GitHub仓库URL>
   ```
   例如：
   ```bash
git remote add origin https://github.com/yuanwj119/my_backup_project.git
   ```

7. **推送到远程仓库**：
   ```bash
git push -u origin master
   ```
   如果默认分支名称是`main`，请使用：
   ```bash
git push -u origin main
   ```

## 其他常用Git命令

- **查看提交历史**：
  ```bash
git log
  ```

- **查看远程仓库配置**：
  ```bash
git remote -v
  ```

- **从远程仓库拉取最新代码**：
  ```bash
git pull origin master
  ```
  或
  ```bash
git pull origin main
  ```

- **创建并切换到新分支**：
  ```bash
git checkout -b <分支名>
  ```

- **切换回主分支**：
  ```bash
git checkout master
  ```
  或
  ```bash
git checkout main
  ```

## 注意事项

1. 确保在执行这些命令前，您已经安装了Git。如果尚未安装，请参考GIT_INSTALL_CONFIG_GUIDE.md文件。

2. 首次推送代码到远程仓库时，Git可能会提示您输入GitHub的用户名和密码。如果使用的是较新版本的Git，可能需要使用个人访问令牌（PAT）作为密码。

3. 如果您在执行命令过程中遇到任何问题，请参考GITHUB_DESKTOP_TROUBLESHOOTING.md文件中的解决方案。

4. 定期提交代码是良好的开发习惯，可以帮助您更好地跟踪和管理项目的变更。

祝您使用Git愉快！