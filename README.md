# CUMTB-Thesis

中国矿业大学（北京）毕业论文 LaTeX 模板

China University of Mining and Technology, Beijing (CUMTB) Thesis LaTeX Template

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![LaTeX](https://img.shields.io/badge/LaTeX-2020+-green.svg)](https://www.latex-project.org/)

## 简介

这是中国矿业大学（北京）的毕业论文 LaTeX 模板，支持本科、硕士、博士学位论文。本模板严格遵循中国矿业大学（北京）的论文格式规范，提供完整的论文结构和丰富的功能。

## 主要特性

- ✅ 符合 CUMTB 论文格式要求
- ✅ 支持本科、硕士、博士三种学位论文
- ✅ **盲审模式**：一键生成盲审版本
- ✅ **Makefile 构建**：自动化编译流程
- ✅ 基于 XeLaTeX，良好的中文支持
- ✅ 使用 biblatex + biber 管理参考文献，符合 GB/T 7714-2015 标准
- ✅ **原创性声明**和版权授权书
- ✅ 完整的**符号说明**环境
- ✅ **latexmk 配置**：一键编译
- ✅ 提供完整的示例文档和使用手册
- ✅ 简洁的用户接口，易于使用

## 系统要求

- TeX Live 2020 或更新版本（推荐使用最新版）
- 支持 XeLaTeX 编译引擎
- 支持 Biber 处理参考文献

## 快速开始

### 1. 下载模板

```bash
git clone https://github.com/yourusername/cumtb-thesis.git
cd cumtb-thesis
```

### 2. 配置论文信息

编辑 `main.tex`，修改以下内容：

```latex
% 选择学位类型：bachelor（本科）、master（硕士）、doctor（博士）
\documentclass[master]{cumtbthesis}

% 配置论文信息
\ctitle{论文题目}
\cauthor{作者姓名}
\studentid{学号}
\school{学院名称}
\major{专业名称}
\advisor{导师姓名}
\advisortitle{导师职称}
\cdate{2025年6月}

% 关键词
\keywords{关键词1；关键词2；关键词3}
\enkeywords{keyword1; keyword2; keyword3}
```

### 3. 编译论文

**方法一：使用 Makefile（推荐）**

```bash
make thesis    # 编译论文
make clean     # 清理辅助文件
make help      # 查看所有命令
```

**方法二：使用 latexmk**

```bash
latexmk -xelatex main.tex
```

**方法三：手动编译**

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

### 4. 盲审模式

生成盲审版本（隐藏作者和导师信息）：

```latex
% 在 main.tex 第一行修改为：
\documentclass[master,review]{cumtbthesis}
```

然后编译：
```bash
make thesis
```

## 项目结构

```
cumtb-thesis/
├── cumtbthesis.cls          # 文档类文件
├── cumtbthesis.cfg          # 配置文件
├── main.tex                 # 主文档
├── ref/
│   └── refs.bib             # 参考文献数据库
├── data/
│   ├── abstract.tex         # 中文摘要
│   ├── abstract_en.tex      # 英文摘要
│   ├── acknowledgements.tex # 致谢
│   ├── chap01.tex          # 第一章
│   ├── chap02.tex          # 第二章
│   └── chap03.tex          # 第三章
├── figures/                 # 图片文件夹
├── LICENSE                  # 许可证
└── README.md               # 本文件
```

## 使用说明

### 原创性声明

原创性声明和授权书会自动包含在论文中（盲审模式下不包含）。

### 符号说明

在 `main.tex` 中取消注释：
```latex
% 符号说明（可选）
\input{data/notation}
```

在 `data/notation.tex` 中添加符号：
```latex
\begin{notation}
$\alpha$ & 学习率参数 \\
$\beta$ & 衰减系数 \\
\end{notation}
```

### 撰写章节

在 `data/` 目录下创建章节文件（如 `chap01.tex`），然后在 `main.tex` 中使用 `\input{}` 引入：

```latex
\input{data/chap01}
```

### 插入图片

将图片放在 `figures/` 目录下，使用以下代码插入：

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.6\textwidth]{example.pdf}
  \caption{图片标题}
  \label{fig:example}
\end{figure}
```

### 添加参考文献

在 `ref/refs.bib` 中添加 BibTeX 条目，然后在正文中引用：

```latex
如文献\cite{reference_key}所述...
```

### 插入表格

```latex
\begin{table}[htbp]
  \centering
  \caption{表格标题}
  \label{tab:example}
  \begin{tabular}{ccc}
    \toprule
    列1 & 列2 & 列3 \\
    \midrule
    数据1 & 数据2 & 数据3 \\
    \bottomrule
  \end{tabular}
\end{table}
```

### 数学公式

行内公式：`$E = mc^2$`

行间公式：
```latex
\begin{equation}
  \int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
  \label{eq:example}
\end{equation}
```

## 编辑器推荐

- **TeXstudio**：功能强大的 LaTeX 集成编辑环境
- **VS Code**：配合 LaTeX Workshop 插件使用
- **Overleaf**：在线 LaTeX 编辑器

## 字数统计

使用字数统计脚本：

```bash
./scripts/wordcount.sh
# 或
make wordcount
```

需要先安装 texcount：
```bash
tlmgr install texcount
```

## 贡献指南

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详情。

## 更新日志

查看 [CHANGELOG.md](CHANGELOG.md) 了解版本更新历史。

## 常见问题

### 编译错误

1. 确保使用 XeLaTeX 编译引擎
2. 确保安装了所有必需的宏包
3. 尝试删除所有辅助文件后重新编译

### 字体问题

确保系统已安装以下字体：
- 中文：宋体、黑体、楷体
- 英文：Times New Roman、Arial、Courier New

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个模板！

## 开源协议

本项目采用 MIT License 开源许可证，欢迎使用和改进。

## 许可证

本项目采用 [MIT License](LICENSE) 开源许可证。

## 免责声明

本模板为学习和研究目的创建，使用者应确保最终论文符合中国矿业大学（北京）的官方要求。

## 联系方式

如有问题或建议，请通过 GitHub Issues 反馈。

---

**祝各位同学顺利完成学位论文！** 🎓
