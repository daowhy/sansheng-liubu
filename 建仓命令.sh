#!/bin/bash
# 三省六部框架仓 · 一键建仓脚本（工部封装 · push 上线前须过发布确认）
# 用法：export GH_TOKEN=<token> 后执行本脚本（GitHub 官方 gh CLI 通道）
# 仓名：sansheng-liubu（可改）。License 候发布者定（MIT / Apache-2·定后补 LICENSE 文件再首推）。
set -euo pipefail

REPO_NAME="${REPO_NAME:-sansheng-liubu}"
DESC="三省六部 · 多智能体朝廷运营框架——照真实运营了两个月的方法论骨架：公文制/回执账/收班交割/岗位范式"

cd "$(dirname "$0")"

# 0) gh 就绪检查
command -v gh >/dev/null || { echo "缺 gh CLI（官方安装：https://cli.github.com/）"; exit 1; }

# 1) 初始化与首提
git init -b main
git add -A
git commit -m "init: 三省六部框架骨架（公文制/运行机制/岗位范式/模板）"

# 2) 建仓并推（public·官方名义发布前请再次确认仓库内容）
gh repo create "$REPO_NAME" --public --source . --description "$DESC" --push

# 3) 首页话题（可按平台规则增删）
gh repo edit "$REPO_NAME" --add-topic multi-agent --add-topic ai-agents --add-topic workflow --add-topic organization-management

echo "建仓讫：https://github.com/<owner>/$REPO_NAME"
echo "备忘：①LICENSE 定后补文件重推 ②screenshots 若未生成先运行 assets 生成脚本 ③push 前已过发布确认家规"
