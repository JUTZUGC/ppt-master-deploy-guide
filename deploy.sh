#!/usr/bin/env bash
set -euo pipefail
# PPT Master Python 脚本脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1 || { echo "需要先安装 Python 3"; exit 1; }

mkdir -p .download
cd .download

git clone --depth=1 https://github.com/hugohe3/ppt-master.git
cd ppt-master
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python skills/ppt-master/scripts/svg_to_pptx.py --help > /dev/null && echo "转换脚本可用"
echo "安装完成：用 AI 客户端打开本目录，把源文件放进 projects/ 即可开始"

echo ""

echo "安装完成：用 AI 客户端打开 ppt-master 目录，把 PDF/DOCX 放进 projects/ 后说一句「用这份文档做一份 8 页 PPT」即可"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md"
