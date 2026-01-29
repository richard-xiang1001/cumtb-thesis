# 中国矿业大学（北京）毕业论文 LaTeX 模版

这是一个专为中国矿业大学（北京）学生优化的、开箱即用的 LaTeX 毕业论文模版。本模版已经过深度整理和精简，将复杂的类文件逻辑转化为了更加直观、易用的"分块式"源码结构。

## 📁 项目结构

项目按学位类型分为三个独立目录，请根据自己的情况选择对应目录：

```
cumtb-thesis/
├── 本科生/          # 本科毕业论文模版
│   ├── data/        # 核心工作区（源码、配置）
│   ├── figures/     # 图片素材区
│   └── docs_and_standards/  # 学校官方规范文档
│
├── 硕士生/          # 硕士学位论文模版
│   ├── data/        # 核心工作区
│   ├── figure/      # 图片素材区
│   ├── 3.学术型硕士学位论文模板及大摘要模板/
│   └── 4.专硕学位论文模板及大摘要模板/
│
└── 博士生/          # 博士学位论文模版
    ├── data/        # 核心工作区
    ├── figure/      # 图片素材区
    └── 博士学位论文word模板及大摘要模板/
```

## 📂 各学位文件结构说明

### 📘 本科生
```
本科生/data/
├── main.tex                 # 总控文件（配置个人信息）
├── 0封皮.tex
├── 1cover.tex
├── 2claim.tex
├── 3.1assignment.tex        # 毕业设计（论文）任务书
├── 3.2assignment.tex        # 毕业设计（论文）结合科研说明书
├── 4ResearchBrief.tex       # 中期检查报告
├── 5.1ChineseAbstract.tex   # 中文摘要
├── 5.2EnglishAbstract.tex   # 英文摘要
├── 6Body.tex                # 正文内容
├── 7References.tex          # 参考文献
├── 8Acknowledgments.tex     # 致谢
└── 9Appendix.tex            # 附录
```

### 📙 硕士生 & 📕 博士生
```
硕士生/data/ 或 博士生/data/
├── main.tex                 # 总控文件（配置个人信息）
├── 0封皮.tex
├── 1cover.tex
├── 2claim.tex
├── 3ChineseAbstract.tex     # 中文摘要
├── 4EnglishAbstract.tex     # 英文摘要
├── 5Nomenclature.tex        # 符号说明（可选）
├── 6Body.tex                # 正文内容
├── 7References.tex          # 参考文献
├── 8Appendix.tex            # 附录
├── 9Acknowledgments.tex     # 致谢
└── 10CV.tex                 # 个人简历（研究生必填）
```

## 🎯 快速开始

### 第一步：选择对应目录

根据您的学位类型，进入对应的目录：
- **本科** → 进入 `本科生/` 目录
- **学术型硕士** → 进入 `硕士生/` 目录，参考 `3.学术型硕士学位论文模板及大摘要模板/`
- **专业硕士** → 进入 `硕士生/` 目录，参考 `4.专硕学位论文模板及大摘要模板/`
- **博士** → 进入 `博士生/` 目录

### 第二步：修改个人信息

打开对应目录下的 `data/main.tex`，在文件开头的配置区域修改：
- 论文题目（中文、英文）
- 作者姓名、学号
- 学院、专业、指导教师
- 论文完成日期

### 第三步：撰写论文内容

根据您的学位类型，编辑对应文件：

**本科生**：编辑 `6Body.tex`（正文），参考示例内容学习：
- 数学公式排版
- 三线表制作
- 图片插入
- GB/T 7714 引用规范

**研究生**（硕士/博士）：依次编辑以下文件：
1. **6Body.tex**：撰写论文正文
2. **10CV.tex**：填写个人简历（研究生必填）
3. 其他文件按需编辑（摘要、致谢、附录等）

### 第四步：编译生成

**推荐方式**：使用编辑器（VS Code + LaTeX Workshop / TeXstudio / Overleaf）直接点击编译按钮

**命令行方式**：
```bash
cd 对应学位目录/data
xelatex main.tex
xelatex main.tex
bibtex main
xelatex main.tex
```

> ⚠️ **注意**：必须使用 **XeLaTeX** 引擎编译，建议至少编译 2-3 次以正确生成引用标号和目录

## ✨ 核心特性

- **开箱即用**：无需学习复杂的 `.cls` 宏定义，所有样式通过标准宏包控制
- **自动对齐**：致谢段落、参考文献、数学公式对齐均已调优
- **真实教程**：模版内容本身就是完整的论文案例，覆盖 90% 的毕业设计排版场景
- **学位分离**：本科、硕士、博士独立目录，避免混淆
- **标准规范**：严格遵循学校 2019 版《本科毕业设计（论文）撰写规范》要求

## 🛠️ 推荐工具

| 编辑器 | 推荐度 | 说明 |
|--------|--------|------|
| **VS Code** | ⭐⭐⭐⭐⭐ | 安装 LaTeX Workshop 插件，配置简单 |
| **TeXstudio** | ⭐⭐⭐⭐ | 专为 LaTeX 设计，开箱即用 |
| **Overleaf** | ⭐⭐⭐⭐ | 在线协作，无需本地安装 TeX 环境 |

## ⚠️ 常见问题 (FAQ)

<details>
<summary><b>引用显示 [?] 或 ??</b></summary>
连续编译 3 次，或运行完整的编译链：XeLaTeX → BibTeX → XeLaTeX → XeLaTeX
</details>

<details>
<summary><b>字体报错（找不到字体）</b></summary>
确保系统已安装：宋体、黑体、楷体、Times New Roman。Windows/macOS 通常已预装。
</details>

<details>
<summary><b>图片无法显示</b></summary>
检查图片路径是否正确，建议将图片放在 `figures/` 或 `figure/` 目录下
</details>

<details>
<summary><b>表格不美观</b></summary>
参考模版中的三线表示例，使用 `booktabs` 宏包的 `\toprule`、`\midrule`、`\bottomrule`
</details>

<details>
<summary><b>公式编号错误</b></summary>
确保使用 `equation` 或 `align` 环境，不要在公式后手动添加编号
</details>

## 📚 参考资料

- 学校官方规范请查看对应目录下的 `docs_and_standards/` 或 Word 模板文件夹
- LaTeX 入门教程：[lshort-zh-cn](https://github.com/ctex-org/lshort-zh-cn)
- 在线 LaTeX 社区：[TeX Stack Exchange](https://tex.stackexchange.com/)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request，帮助改进此模版！

---

**祝各位同学顺利完成学业，写出一篇排版精美的优秀毕业论文！** 🎓
