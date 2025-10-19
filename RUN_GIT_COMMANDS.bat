@echo off

REM ==================================================
REM Git安装验证和项目提交命令批处理文件
REM ==================================================

REM 1. 验证Git是否已正确安装
cls
echo 正在验证Git安装...
echo 请稍候...
git --version

if %errorlevel% neq 0 (
    echo.
echo 错误: Git未正确安装或未添加到系统环境变量中。
echo 请确保已安装Git并重新启动命令提示符后重试。
pause
exit /b 1
)

REM 2. 显示项目目录
cd /d "d:\python练习一\my_backup_project"
echo.
echo 当前工作目录: %cd%
echo.

REM 3. 配置Git用户信息（如果尚未配置）
echo 请确认您的Git用户信息配置:
git config --global user.name
git config --global user.email
echo.

set /p "configure=是否需要配置Git用户信息？(y/n): "
if /i "%configure%"=="y" (
    set /p "username=请输入您的GitHub用户名: "
    set /p "email=请输入您的GitHub邮箱: "
    git config --global user.name "%username%"
    git config --global user.email "%email%"
    echo.
echo Git用户信息已配置。
echo.
)

REM 4. 初始化Git仓库（如果尚未初始化）
echo 检查是否已初始化Git仓库...
if not exist ".git" (
    echo 正在初始化Git仓库...
git init
    if %errorlevel% neq 0 (
        echo 错误: Git仓库初始化失败。
pause
exit /b 1
    )
echo Git仓库初始化成功！
echo.
) else (
    echo Git仓库已存在。
echo.
)

REM 5. 添加所有文件到暂存区
echo 正在将所有文件添加到暂存区...
git add .
if %errorlevel% neq 0 (
    echo 错误: 添加文件到暂存区失败。
pause
exit /b 1
)
echo 文件添加成功！
echo.

REM 6. 提交代码到本地仓库
echo 正在提交代码到本地仓库...
git commit -m "完成基本功能开发"
if %errorlevel% neq 0 (
    echo 错误: 提交代码失败。
pause
exit /b 1
)
echo 代码提交成功！
echo.

REM 7. 查看提交状态
echo 显示当前仓库状态:
git status

echo.
echo 恭喜！您已成功完成Git仓库的初始化和代码提交。
echo 接下来，您可以参考GIT_COMMANDS.md文件中的指南，将代码推送到远程GitHub仓库。
echo.
pause