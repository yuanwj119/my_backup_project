@echo off
cls
echo ==================================================
echo           初始化 Git 仓库并添加远程仓库
===================================================

REM 检查 Git 是否已安装
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo 错误: 未找到 Git！请先安装 Git。
    echo 您可以从 https://git-scm.com/downloads 下载安装。
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b 1
)

echo 状态: Git 已安装

REM 检查当前目录是否已初始化 Git 仓库
if not exist .git (
    echo.
    echo 初始化 Git 仓库...
    git init
    if %ERRORLEVEL% neq 0 (
        echo 错误: 初始化 Git 仓库失败！
        echo.
        echo 按任意键退出...
        pause >nul
        exit /b 1
    )
    echo 状态: Git 仓库初始化成功
    
    REM 设置 Git 用户名和邮箱（如果未设置）
    echo.
    echo 设置 Git 用户信息...
    git config user.name "User"
    git config user.email "user@example.com"
    echo 状态: Git 用户信息设置完成（请根据需要修改）
) else (
    echo 状态: 当前目录已初始化 Git 仓库
)

REM 添加远程仓库
echo.
echo 添加远程仓库...
git remote add origin https://github.com/yuanwj119/my_backup_project.git
if %ERRORLEVEL% neq 0 (
    echo 警告: 添加远程仓库失败！
    echo 可能的原因：远程仓库名称已存在
    echo 尝试查看当前远程仓库配置...
    git remote -v
    echo 如需重新添加远程仓库，可以先运行：git remote remove origin
) else (
    echo 状态: 远程仓库添加成功
    echo 验证远程仓库配置...
    git remote -v
)

echo.
echo ==================================================
echo 操作完成。请检查以上输出确认操作结果。
echo 后续步骤：
echo 1. 添加文件到 Git: git add .
echo 2. 提交更改: git commit -m "Initial commit"
echo 3. 推送代码: git push -u origin main
echo ==================================================
echo.
echo 按任意键退出...
pause >nul