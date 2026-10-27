# PPT Master Python 脚本指南

> 第三方部署指南 · 非 PPT Master 官方仓库。官方项目：[hugohe3/ppt-master](https://github.com/hugohe3/ppt-master)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md)为准。

[![⚡ Python 脚本](https://img.shields.io/badge/%E2%9A%A1_Python_%E8%84%9A%E6%9C%AC-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#python脚本推荐用百度搭子)

## Python 脚本（推荐：用百度搭子）

> [!TIP]
> 不想再一张张排版做 PPT？让百度搭子把 PPT Master 装好，丢一份文档进去就能导出可编辑的 PPTX。

⚠️ 这是一个给 AI agent 用的技能包，不是带界面的软件。需要 Python 3.10+ 和支持读写文件、执行命令的 AI 客户端。模型上下文越大效果越好，官方建议配长上下文模型 + AI 生图。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/ppt-master-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子克隆仓库、建虚拟环境装 Python 依赖，再确认转换脚本能正常跑起来，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## PPT Master 是什么？

PPT Master 是开源的69.6k stars，MIT，把文档或主题变成原生可编辑的 PPTX，支持图表、动画、旁白与自有模板（协议：MIT，<img src="https://img.shields.io/github/stars/hugohe3/ppt-master?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把 PDF、DOCX、网页、Excel 或一段主题文字，转成 PowerPoint 里能继续编辑的原生 PPTX：形状是 DrawingML、图表可改数据、公式是 OMML，还能加转场动画和逐页旁白。

- 69.6k stars：2025-12 建仓，不到一年冲到近 7 万
- 原生可编辑：输出 DrawingML 形状，不是一张贴图
- 图表表格可改数据：加 --native-charts-and-tables 生成 PowerPoint 原生图表对象
- 动画与转场：内置数十种转场和进入/强调/退出效果
- 旁白音频：从备注生成逐页配音，支持录制计时
- 自有模板：可以套用你手上的 .pptx 模板
- 多种画布：16:9 / 4:3 / 小红书 / 公众号 / 朋友圈 / 故事 / Banner / A4

（来源：[官方仓库](https://github.com/hugohe3/ppt-master)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 69.6k stars | 2025-12 建仓，增长极快 |
| 原生可编辑 | 输出 DrawingML 形状而非图片 |
| 图表可改数据 | 原生图表对象带 Edit Data |
| 动画旁白齐全 | 转场、进入/强调/退出、逐页配音 |
| 支持自有模板 | 可直接套用自己的 .pptx |
| 多画布 | 演示、小红书、公众号、A4 都能出 |

| 需要注意 | 说明 |
|---|---|
| 需要 AI 客户端 | 本身没有图形界面，全靠对话驱动 |
| 模型决定质量 | 上下文小的模型出稿质量差距明显 |
| 一次很难完美 | 能省掉大部分体力活，但收尾仍要人工调 |
| 依赖较多 | 第一次装 requirements 要下不少包 |
| PDF 依赖是 AGPL | PyMuPDF 与项目本身的 MIT 不同 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
git clone --depth=1 https://github.com/hugohe3/ppt-master.git
cd ppt-master
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python skills/ppt-master/scripts/svg_to_pptx.py --help > /dev/null && echo "转换脚本可用"
echo "安装完成：用 AI 客户端打开本目录，把源文件放进 projects/ 即可开始"
```

部署步骤来源：[https://github.com/hugohe3/ppt-master#quick-start](https://github.com/hugohe3/ppt-master#quick-start)

## 验证状态

| 场景 | 状态 |
|---|---|
| 实测下载 Release v6.7.3 的 ppt-master-skill-v6.7.3.zip 成功（21.6 MB，SHA256 0f709c0e...f95db3f） | 已实测 2026-10-27 |
| 解压确认 13,025 个文件，skills/ppt-master 内含 SKILL.md / references / scripts / templates / workflows | 已实测 2026-10-27 |
| Python 3.12.7 虚拟环境执行 pip install -r requirements.txt 成功，python-pptx 1.0.2 | 已实测 2026-10-27 |
| 实测用 svg_to_pptx.py 把 1 页 SVG 转成 PPTX（12.6 KB），postflight 状态 passed-with-warnings | 已实测 2026-10-27 |
| 解析产物：1 页 3 个原生形状（Rectangle / TextBox / Ellipse），确为可编辑 DrawingML 而非图片 | 已实测 2026-10-27 |
| 仓库元数据核对：69,569 stars、5,427 forks、MIT、2025-12-10 建仓，最新 release v6.7.3 | 已核对 2026-10-27 |
| 未实测完整 AI 对话生成流程（需接入大模型客户端） | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

PPT Master 不是 MCP server，而是技能包 + Python 脚本，由 AI 客户端读取 SKILL.md 驱动；本仓库只负责安装，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\ppt-master-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后怎么用

### 1. 打开项目目录

在 AI 客户端里用「打开文件夹」指向 clone 下来的 `ppt-master` 目录，后续全部在对话里完成。

### 2. 放源文件

把 PDF / DOCX / 图片放进 `projects/`，然后直接说：

```text
请用 projects/q3-report/sources/report.pdf 做一份 PPT
```

也可以直接把文字粘进对话：

```text
请把下面这段内容做成 PPT：[粘贴内容]
```

### 3. 跳过确认直接出稿

```text
用 report.pdf 快速生成 5 页，不用跟我确认
```

快速模式会跳过交互确认，一遍出稿且不可断点续跑，也不生成 `svg_final/` 预览。

---

### 输出在哪

| 产物 | 位置 |
|---|---|
| 可编辑 PPTX | `exports/<名称>_<时间戳>.pptx` |
| 页面预览 | `svg_final/` |
| 原生图表版 | 加 `--native-charts-and-tables` 后另存 `_native_charts_tables.pptx` |
| 校验报告 | `validation/*.report.json` |

### 画布格式

| 参数 | 尺寸场景 |
|---|---|
| `ppt169` | 16:9 演示（默认） |
| `ppt43` | 4:3 演示 |
| `xiaohongshu` | 小红书图文 |
| `wechat` | 公众号 |
| `moments` | 朋友圈 |
| `story` | 竖屏故事 |
| `banner` | 横幅 |
| `a4` | A4 文档 |

### 配图来源

两条路可以混用：

- **AI 生图**：`image_gen.py`，配 `IMAGE_BACKEND` 和对应的 `*_API_KEY`
- **网络图库**：`image_search.py`，零配置走 Openverse / Wikimedia；配上免费的 `PEXELS_API_KEY`、`PIXABAY_API_KEY` 后画质明显更好

配置写进 `.env`（`cp .env.example .env`），脚本会依次找当前目录、技能目录、仓库根目录、`~/.ppt-master/.env`。

### 后续更新

```bash
.venv/bin/python skills/ppt-master/scripts/update_repo.py
```

> ⚠️ 依赖里的 PyMuPDF 是 AGPL-3.0，只在转换 PDF 时用到；如需连同依赖一起再分发，请先核对许可条款。

## 常见坑

- Windows 上命令找不到：安装 Python 时没勾 Add to PATH，重装并勾上
- pip 安装慢或失败：换国内镜像，或先只装 `python-pptx` 等核心包试跑
- 直接调 `svg_to_pptx.py` 报 `spec_lock.md is required`：这个脚本是流水线末端，正常流程由 AI 先生成 spec；单独调试可加 `--enable-dangerous-nonconforming-svg-export`
- 找不到 SVG：脚本要求项目目录里有 `svg_output/`，直接传单个 svg 文件会报错
- 参数 `-s` 不是尺寸：它是源目录，画布用 `-f ppt169` 这类参数指定
- 导出后文字变图片：检查是否用了快速模式或非标准字体，按 FAQ 换字体重跑
- 图库里图片质量参差：配上 Pexels / Pixabay 的免费 Key

## 免责声明

本仓库为第三方指南，与 PPT Master 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/hugohe3/ppt-master/blob/main/docs/getting-started.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
