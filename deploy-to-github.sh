#!/bin/bash

# 🎮 游戏买量专家简历网站 - GitHub Pages一键部署脚本
# 作者：OpenClaw AI助手
# 时间：$(date)

echo "========================================="
echo "🎮 游戏买量专家简历网站 - 一键部署脚本"
echo "========================================="
echo ""

# 检查Git是否安装
if ! command -v git &> /dev/null; then
    echo "❌ Git未安装，请先安装Git："
    echo "   Ubuntu/Debian: sudo apt install git"
    echo "   CentOS/RHEL: sudo yum install git"
    echo "   macOS: brew install git"
    exit 1
fi

echo "✅ Git已安装"
echo ""

# 显示当前目录
echo "📁 当前目录：$(pwd)"
echo "📋 文件列表："
ls -la
echo ""

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误：未找到index.html文件"
    echo "💡 请确保在game-ua-resume目录中运行此脚本"
    exit 1
fi

echo "✅ 找到简历网站文件"
echo ""

# 询问GitHub信息
echo "📝 请输入GitHub信息："
read -p "1. GitHub用户名: " GITHUB_USERNAME
read -p "2. GitHub仓库名（建议：game-ua-resume）: " REPO_NAME
read -p "3. 你的邮箱（用于Git提交）: " USER_EMAIL
read -p "4. 你的姓名（用于Git提交）: " USER_NAME

echo ""
echo "🔧 配置Git..."
git config --global user.email "$USER_EMAIL"
git config --global user.name "$USER_NAME"

echo ""
echo "🚀 开始部署流程..."
echo ""

# 步骤1：初始化Git仓库
echo "1️⃣ 初始化Git仓库..."
rm -rf .git 2>/dev/null
git init
git add .
git commit -m "🎮 游戏买量专家简历网站 - 初始提交

包含：
- 专业游戏买量简历网站
- 响应式设计，适配所有设备
- 买量技能展示、成功案例、工具平台
- 单文件HTML，无需服务器
- 优化CDN，国内访问快速

部署时间：$(date)"

echo "✅ Git仓库初始化完成"
echo ""

# 步骤2：创建GitHub仓库（提供指导）
echo "2️⃣ 创建GitHub仓库..."
echo ""
echo "📋 请按以下步骤操作："
echo "   1. 访问 https://github.com/new"
echo "   2. 仓库名: $REPO_NAME"
echo "   3. 描述: 游戏买量专家个人简历网站"
echo "   4. 选择: Public（公开）"
echo "   5. 不要勾选: Initialize this repository with a README"
echo "   6. 点击: Create repository"
echo ""
read -p "⏳ 创建完成后按Enter继续..."

# 步骤3：连接到GitHub仓库
echo "3️⃣ 连接到GitHub仓库..."
git branch -M main
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo "📤 上传文件到GitHub..."
if git push -u origin main; then
    echo "✅ 文件上传成功！"
else
    echo ""
    echo "⚠️ 如果出现认证错误，请尝试："
    echo "   1. 使用SSH密钥：ssh-keygen -t ed25519 -C \"$USER_EMAIL\""
    echo "   2. 或将远程仓库URL改为：git@github.com:$GITHUB_USERNAME/$REPO_NAME.git"
    echo ""
    read -p "🔑 是否使用SSH方式重试？(y/n): " RETRY_SSH
    if [ "$RETRY_SSH" = "y" ] || [ "$RETRY_SSH" = "Y" ]; then
        git remote remove origin
        git remote add origin "git@github.com:$GITHUB_USERNAME/$REPO_NAME.git"
        git push -u origin main
    fi
fi

echo ""
echo "4️⃣ 启用GitHub Pages..."
echo ""
echo "📋 请按以下步骤启用GitHub Pages："
echo "   1. 访问：https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
echo "   2. Source选择：Deploy from a branch"
echo "   3. Branch选择：main"
echo "   4. Folder选择：/(root)"
echo "   5. 点击：Save"
echo ""
echo "⏳ 等待1-2分钟部署完成..."
echo ""

# 步骤4：显示访问信息
echo "========================================="
echo "🎉 部署完成！"
echo "========================================="
echo ""
echo "🌐 你的简历网站访问地址："
echo "   🔗 主页面：https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo "   🔗 启动页：https://$GITHUB_USERNAME.github.io/$REPO_NAME/launch.html"
echo "   🔗 直接访问：https://$GITHUB_USERNAME.github.io/$REPO_NAME/index.html"
echo ""
echo "📱 分享链接："
echo "   微信/QQ：https://$GITHUB_USERNAME.github.io/$REPO_NAME/launch.html"
echo "   简历：https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "🔧 功能特点："
echo "   ✅ 完全免费，无限流量"
echo "   ✅ 全球CDN加速，国内访问快"
echo "   ✅ 自动HTTPS，安全访问"
echo "   ✅ 响应式设计，手机电脑都能看"
echo "   ✅ 无需服务器维护"
echo ""
echo "🔄 更新网站："
echo "   修改文件后运行："
echo "   git add . && git commit -m '更新内容' && git push"
echo ""
echo "🎯 下一步："
echo "   1. 立即访问测试"
echo "   2. 分享给朋友或HR"
echo "   3. 根据反馈修改内容"
echo "   4. 考虑绑定自定义域名（可选）"
echo ""
echo "📞 技术支持："
echo "   如有问题，请查看README.md文件"
echo ""
echo "========================================="
echo "🎮 祝你找到理想的游戏买量工作！"
echo "========================================="