@echo off
cls
echo ==================================================
echo          检查 Git 安装状态
===================================================

REM 检查 git 命令是否可用
try (
    git --version >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        echo 状态: Git 已成功安装！
        echo.
        echo Git 版本信息:
        git --version
        echo.
        echo 系统环境变量中可以找到 Git 命令
        echo.
        echo ===================================================
        echo 检查完成。您可以正常使用 Git 命令。
        echo ===================================================
    ) else (
        echo 状态: 未找到 Git！
        echo.
        echo 可能的原因:
        echo 1. Git 尚未安装
        echo 2. Git 已安装但未添加到系统环境变量
        echo.
        echo 建议操作:
        echo 1. 从 https://git-scm.com/downloads 下载并安装 Git
        echo 2. 安装时确保勾选 "Add Git to PATH"
        echo 3. 或手动将 Git 的 bin 目录添加到系统环境变量
        echo.
        echo ===================================================
        echo 检查完成。需要安装或配置 Git。
        echo ===================================================
    )
) catch (
    echo 状态: 执行命令时出错！
    echo.
    echo 错误信息: %error%
    echo.
    echo ===================================================
    echo 检查完成。出现未知错误。
    echo ===================================================
)

echo.
echo 按任意键退出...
pause >nul