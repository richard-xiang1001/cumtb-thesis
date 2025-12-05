# CUMTB Thesis LaTeX 模板安装说明

## 环境要求

本模板需要 TeX Live 2020 或更高版本。推荐使用完整版 TeX Live 以避免缺少宏包的问题。

## 方法一：使用完整版 TeX Live（推荐）

如果您还没有安装 TeX Live，建议直接安装完整版：

### macOS
```bash
# 下载 MacTeX（TeX Live 完整版 for macOS）
# 访问 https://www.tug.org/mactex/mactex-download.html
# 或使用 Homebrew
brew install --cask mactex
```

### Windows
```bash
# 下载 TeX Live ISO 镜像或网络安装程序
# 访问 https://www.tug.org/texlive/acquire-netinstall.html
```

### Linux
```bash
# 使用包管理器安装
sudo apt-get install texlive-full  # Debian/Ubuntu
sudo dnf install texlive-scheme-full  # Fedora
```

## 方法二：在现有 Basic 版本上安装必需宏包

如果您已经安装了 TeX Live Basic 版本（如本机当前环境），可以使用 tlmgr 安装必需的宏包。

### 使用用户模式安装（推荐，无需 sudo）

```bash
# 初始化用户树
tlmgr init-usertree

# 安装核心宏包
tlmgr --usermode install ctex xecjk fontspec zhnumber fandol

# 安装 biblatex 相关
tlmgr --usermode install biblatex biblatex-gb7714-2015 logreq xstring

# 安装其他必需宏包
tlmgr --usermode install caption booktabs multirow subfigure
tlmgr --usermode install listings enumitem titlesec
tlmgr --usermode install algorithm2e algorithmicx algorithms
tlmgr --usermode install xltxtra realscripts metalogo xunicode
```

### 使用管理员权限安装

如果需要系统级安装（需要密码）：

```bash
sudo tlmgr install ctex xecjk fontspec zhnumber fandol \
  biblatex biblatex-gb7714-2015 logreq xstring \
  caption booktabs multirow subfigure listings enumitem titlesec \
  algorithm2e algorithmicx algorithms \
  xltxtra realscripts metalogo xunicode
```

## 已安装的宏包清单

本项目已成功安装以下宏包（用户模式）：

✅ 核心宏包：
- ctex (中文支持)
- xeCJK (XeLaTeX 中文支持)
- fontspec (字体管理)
- zhnumber (中文数字)
- fandol (Fandol 字体)

✅ 参考文献：
- biblatex
- biblatex-gb7714-2015
- logreq

✅ 图表和排版：
- caption (图表标题)
- booktabs (三线表)
- multirow (多行表格)
- subfigure (子图)
- listings (代码高亮)
- enumitem (列表环境)
- titlesec (章节标题)

✅ 算法：
- algorithm2e
- algorithmicx
- algorithms

✅ 其他工具：
- xstring
- xltxtra
- realscripts
- metalogo
- xunicode

## 编译方法

### 基本编译（适用于当前环境）

```bash
# 第一次编译
xelatex main.tex

# 如果有参考文献（需要安装 biber）
biber main
xelatex main.tex
xelatex main.tex
```

### 使用 latexmk（需要配置）

```bash
latexmk -xelatex main.tex
```

## 常见问题

### Q1: 编译时出现 "L3 kernel version mismatch" 错误

这是因为用户安装的 ctex 宏包版本较新，而系统 LaTeX 格式文件较老。这个警告不影响编译，可以忽略。

如果想消除警告，可以更新系统 LaTeX 格式：
```bash
sudo fmtutil-sys --all
```

### Q2: biber 命令不可用

TeX Live Basic 版本可能没有包含 biber。有两个解决方案：

方案 1：安装 biber
```bash
tlmgr --usermode install biber  # 用户模式
# 或
sudo tlmgr install biber  # 系统模式
```

方案 2：使用 BibTeX 代替（需要修改 cumtbthesis.cls）

### Q3: 字体问题

确保系统已安装以下字体：
- **中文**：宋体、黑体、楷体（macOS 自带）
- **英文**：Times New Roman、Arial、Courier New（macOS 自带）

### Q4: PDF 生成但参考文献没有显示

这是因为没有运行 biber。您可以：
1. 安装 biber 并运行完整编译流程
2. 或暂时忽略参考文献部分

## 验证安装

编译示例文档以验证环境：

```bash
cd /Users/xiangruichao/Desktop/cumtb毕业论文latex模版
xelatex main.tex
```

如果成功生成 main.pdf，说明环境配置成功！✅

## 技术支持

如有问题，请查看：
- 完整 TeX Live 安装指南：https://www.tug.org/texlive/
- CTeX 宏集文档：http://mirrors.ctan.org/language/chinese/ctex/ctex.pdf
- 项目 GitHub Issues（待创建）

---

**当前状态**：✅ 已成功在 TeX Live 2025 Basic 环境下通过用户模式安装所需宏包并成功编译！
