# PPT Master Python 脚本脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command python -ErrorAction SilentlyContinue)) { throw '需要先安装 Python 3' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

git clone --depth=1 https://github.com/hugohe3/ppt-master.git
Set-Location ppt-master
python -m venv .venv
.venv\Scripts\python.exe -m pip install -r requirements.txt
.venv\Scripts\python.exe skills\ppt-master\scripts\svg_to_pptx.py --help | Out-Null; Write-Host '转换脚本可用'
Write-Host '安装完成：用 AI 客户端打开本目录，把源文件放进 projects/ 即可开始'

Write-Host ''

Write-Host '安装完成：用 AI 客户端打开 ppt-master 目录，把 PDF/DOCX 放进 projects/ 后说一句「用这份文档做一份 8 页 PPT」即可'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md'
