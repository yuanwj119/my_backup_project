@echo off
cls
echo ===================================================
echo            项目远程仓库推送状态检查工具            
echo ===================================================
echo.

:: 检查Git是否安装
echo [1/6] 检查Git是否已安装...
echo.
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo 错误: 未检测到Git。请先安装Git并确保其已添加到系统PATH中。
    echo 请参考 GIT_INSTALL_CONFIG_GUIDE.md 文件了解如何安装和配置Git。
    pause
    exit /b 1
) else (
    echo Git已安装，版本信息：
    git --version
    echo.
)

:: 检查当前目录是否为Git仓库
echo [2/6] 检查当前目录是否为Git仓库...
echo.
if not exist ".git" (
    echo 错误: 当前目录不是Git仓库。请先初始化Git仓库。
    echo 初始化命令: git init
    pause
    exit /b 1
) else (
    echo 当前目录是Git仓库。
    echo.
)

:: 检查远程仓库配置
echo [3/6] 检查远程仓库配置...
echo.
git remote -v
if %errorlevel% neq 0 (
    echo 错误: 获取远程仓库配置失败。
    pause
    exit /b 1
)

:: 检查是否有配置远程仓库
git remote -v | findstr "origin" >nul
if %errorlevel% neq 0 (
    echo 警告: 未配置远程仓库。请先添加远程仓库。
    echo 添加命令示例: git remote add origin https://github.com/username/repository.git
    pause
    exit /b 1
)

:: 获取远程仓库URL
for /f "tokens=2" %%i in ('git remote -v ^| findstr "fetch"') do set REMOTE_URL=%%i
echo 远程仓库URL: %REMOTE_URL%
echo.

:: 检查本地分支与远程分支状态
echo [4/6] 获取本地分支信息...
echo.
git branch -vv
if %errorlevel% neq 0 (
    echo 错误: 获取分支信息失败。
    pause
    exit /b 1
)
echo.

:: 拉取最新的远程分支信息
echo [5/6] 拉取最新的远程分支信息...
echo.
git fetch --all
if %errorlevel% neq 0 (
    echo 错误: 拉取远程分支信息失败。请检查网络连接和远程仓库权限。
    pause
    exit /b 1
)
echo.

:: 检查本地分支与远程分支的差异
echo [6/6] 检查本地分支与远程分支的同步状态...
echo.
:: 获取当前分支名
for /f "tokens=2" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

:: 检查当前分支是否关联了远程分支
git config branch.%CURRENT_BRANCH%.remote >nul 2>nul
if %errorlevel% neq 0 (
    echo 警告: 当前分支 ^(%CURRENT_BRANCH%^) 未关联远程分支。
    echo 请使用以下命令关联并推送：
    echo git push -u origin %CURRENT_BRANCH%
    echo.
    echo 结论：项目尚未推送到远程仓库。
) else (
    :: 检查本地分支与远程分支的差异
git rev-list --left-right --count origin/%CURRENT_BRANCH%...%CURRENT_BRANCH% >nul 2>nul
if %errorlevel% neq 0 (
    echo 警告: 远程仓库中可能不存在 %CURRENT_BRANCH% 分支。
    echo 请使用以下命令创建并推送：
    echo git push -u origin %CURRENT_BRANCH%
    echo.
    echo 结论：项目尚未推送到远程仓库。
) else (
    for /f "tokens=1,2" %%a in ('git rev-list --left-right --count origin/%CURRENT_BRANCH%...%CURRENT_BRANCH%') do (
        set BEHIND=%%a
        set AHEAD=%%b
    )
    
    if %BEHIND% equ 0 (echo 本地分支没有落后于远程分支。) else (echo 警告: 本地分支落后于远程分支 %BEHIND% 个提交。建议先执行 git pull。)
    if %AHEAD% equ 0 (echo 本地分支没有领先于远程分支的提交。) else (echo 警告: 本地分支有 %AHEAD% 个提交尚未推送到远程仓库。建议执行 git push。)
    
    echo.
    if %BEHIND% equ 0 if %AHEAD% equ 0 (
        echo 结论：项目已成功推送到远程仓库，本地分支与远程分支完全同步！
    ) else (
        echo 结论：项目未完全同步到远程仓库。请根据上述提示进行操作。
    )
)
)
echo.
echo ===================================================
echo                   检查完成                           
echo ===================================================
echo.
echo 详细说明：
echo 1. 如果显示 "项目已成功推送到远程仓库"，表示您的代码已经完全同步到远程仓库。
echo 2. 如果显示 "本地分支有 X 个提交尚未推送到远程仓库"，请执行 git push 命令推送。
echo 3. 如果显示 "本地分支落后于远程分支 X 个提交"，请先执行 git pull 合并远程代码。
echo 4. 如果显示 "未配置远程仓库" 或 "未关联远程分支"，请参考提示添加远程仓库并推送。
echo.
echo 更多Git命令可参考 GIT_COMMANDS.md 文件。
echo 推送远程仓库的详细指南可参考 GIT_PUSH_GUIDE.md 文件。
echo.
pause