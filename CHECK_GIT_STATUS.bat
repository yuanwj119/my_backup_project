@echo off

REM ==================================================
REM 检查Git仓库状态和远程推送情况
REM ==================================================

cls
echo 正在检查Git仓库状态...
echo 请稍候...
echo.

REM 1. 验证Git是否已正确安装
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: Git未正确安装或未添加到系统环境变量中。
echo 请确保已安装Git并重新启动命令提示符后重试。
pause
exit /b 1
)
echo Git已正确安装！
echo.

REM 2. 确保在正确的项目目录
cd /d "d:\python练习一\my_backup_project"
echo 当前工作目录: %cd%
echo.

REM 3. 检查是否是Git仓库
if not exist ".git" (
    echo 错误: 当前目录不是Git仓库！
echo 请先初始化Git仓库（使用RUN_GIT_COMMANDS.bat或执行git init命令）。
pause
exit /b 1
)
echo 当前目录是Git仓库。
echo.

REM 4. 显示Git用户配置
echo Git用户配置:
git config --global user.name
if %errorlevel% neq 0 echo 用户名为空
git config --global user.email
if %errorlevel% neq 0 echo 邮箱为空
echo.

REM 5. 显示本地仓库状态
echo 本地仓库状态:
git status
set status_exit_code=%errorlevel%
if %status_exit_code% neq 0 (
    echo 错误: 检查本地状态失败。
pause
exit /b 1
)
echo.

REM 6. 检查远程仓库配置
echo 远程仓库配置:
git remote -v
set remote_exit_code=%errorlevel%
if %remote_exit_code% neq 0 (
    echo 错误: 检查远程仓库配置失败。
pause
exit /b 1
)
echo.

REM 7. 检查是否有远程仓库关联
for /f "tokens=1" %%i in ('git remote') do set remote_name=%%i
if not defined remote_name (
    echo 警告: 本地仓库尚未关联任何远程仓库！
echo 建议执行以下命令关联远程仓库：
echo git remote add origin https://github.com/yuanwj119/my_backup_project.git
    set /p "add_remote=是否现在关联远程仓库？(y/n): "
    if /i "%add_remote%"=="y" (
        set /p "remote_url=请输入GitHub仓库URL: "
        if not defined remote_url set remote_url=https://github.com/yuanwj119/my_backup_project.git
        git remote add origin %remote_url%
        if %errorlevel% neq 0 (
            echo 错误: 关联远程仓库失败。
pause
exit /b 1
        )
        echo 已成功关联远程仓库。
echo.
    )
) else (
    echo 已关联远程仓库: %remote_name%
)
echo.

REM 8. 显示当前分支和提交情况
echo 当前分支和提交情况:
git branch
set branch_exit_code=%errorlevel%
if %branch_exit_code% neq 0 (
    echo 错误: 获取分支信息失败。
pause
exit /b 1
)
echo.

echo 最近的提交记录:
git log --oneline -n 5
echo.

REM 9. 检查是否需要推送
echo 检查本地分支与远程分支的同步状态:
for /f "tokens=2" %%i in ('git branch ^| findstr "^*"') do set current_branch=%%i

REM 检查远程是否存在对应的分支
git ls-remote --exit-code --heads origin %current_branch% >nul 2>&1
set remote_branch_exists=%errorlevel%

if %remote_branch_exists% equ 0 (
    REM 远程分支存在，检查是否需要推送
git fetch origin %current_branch%
git status -uno
) else (
    REM 远程分支不存在，需要推送新分支
echo 警告: 远程仓库中不存在 %current_branch% 分支。
echo 需要首次推送此分支到远程仓库。
)
echo.

REM 10. 提供推送选项
set /p "push_now=是否需要推送到远程仓库？(y/n): "
if /i "%push_now%"=="y" (
    echo 正在推送到远程仓库...
    if %remote_branch_exists% equ 0 (
        git push origin %current_branch%
    ) else (
        git push -u origin %current_branch%
    )
    set push_exit_code=%errorlevel%
    if %push_exit_code% equ 0 (
        echo 成功推送到远程仓库！
    ) else (
        echo 错误: 推送失败。请检查网络连接或GitHub权限。
        echo 常见解决方法：
        echo 1. 确保您的GitHub账户有仓库推送权限
        echo 2. 检查网络连接是否正常
        echo 3. 确认已配置正确的GitHub凭证（可能需要个人访问令牌）
    )
) else (
    echo 已跳过推送操作。
)
echo.

echo ==================================================
echo 检查完成！
echo 总结：
if %remote_branch_exists% equ 0 (
    echo - 本地仓库已关联到远程仓库
) else (
    echo - 本地仓库尚未推送到远程仓库
)
echo 请根据以上信息确认代码是否已成功提交并推送到远程仓库。
echo 如果有任何问题，请参考项目中的GIT_PUSH_GUIDE.md文件。
echo ==================================================
echo.
pause