# Overleaf 编译超时及常见排查指南

在 Overleaf 上使用本 LaTeX 模版时，由于免费账户有 **1~2 分钟的编译时间限制**，复杂的文档或不当的配置可能会导致编译超时（Timeout）并提示错误。

本文整理了常见的超时原因及不花钱的解决方法。

---

## 🛠️ 快速自助排查步骤

### 1. 清理 Overleaf 编译缓存（首选）
编译缓存损坏或臃肿是导致莫名其妙超时的最常见原因。
* **操作方法**：
  1. 点击 Overleaf 右侧编译按钮旁边的 **Logs and output files**（日志图标，位于 Recompile 按钮右侧）🔍。
  2. 滚动到弹出面板的最下方。
  3. 点击 **Clear cached files**（清理缓存文件，垃圾桶图标）。
  4. 重新点击 **Recompile** 进行编译。

---

### 2. 优化字体检测（本模版专属提速 ⚡）
本模版为了兼容 Windows、Mac 和 Overleaf 本地编译，在 `main.tex` 中使用了 `\IfFontExistsTF` 进行字体环境自动检测。
然而，在 Overleaf（Linux 环境）上，**频繁查找不存在的系统字体（如 SimSun、Songti SC 等）可能会引发全盘字体检索，耗费几十秒时间导致超时**。

* **优化方案**（如果只在 Overleaf 上编译，强烈建议）：
  1. 打开 `本科生/data/main.tex`（或者对应学位目录下的 `main.tex`）。
  2. 找到关于 `\songtidigit` 的定义（通常在第 64-77 行左右）：
     ```latex
     \IfFontExistsTF{SimSun}{
         \newfontfamily\songtidigit{SimSun}
     }{
         \IfFontExistsTF{Songti SC}{
             \newfontfamily\songtidigit{Songti SC}
         }{
             \IfFontExistsTF{STSong}{
                 \newfontfamily\songtidigit{STSong}
             }{
                 % Overleaf / TeX Live 默认使用 Fandol 字体
                 \newfontfamily\songtidigit{FandolSong}
             }
         }
     }
     ```
  3. 将以上代码直接修改/替换为一行，强行指定为 Overleaf 自带的 `Fandol` 字体：
     ```latex
     \newfontfamily\songtidigit{FandolSong}
     ```
  4. 保存并重新编译，这能大幅提升 Overleaf 的初始化速度。

---

### 3. 开启“遇错即停”模式（Stop on First Error）
默认情况下，Overleaf 遇到错误会尝试忽略并强行继续（Scroll past errors）。如果文档中有公式错误、未闭合的括号或重复定义的命令，LaTeX 会进入无限死循环报错，直到超时。

* **操作方法**：
  1. 点击 **Recompile** 按钮右侧的下拉箭头。
  2. 将 `Default Behavior` 从 *Scroll past errors* 改为 **Stop on first error**。
  3. 这样只要代码出错就会立刻停下，方便你修复，而不是卡死到超时。

---

### 4. 压缩论文中插入的图片
有些同学将手机原图（数 MB 到十几 MB）或超大分辨率的实验截图直接放入项目，XeLaTeX 在编译时需要实时压缩和处理这些图片，极度消耗算力和编译时间。

* **优化方案**：
  * 用图片压缩网站（如 TinyPNG）或本地工具将图片体积压缩到 **200KB 以下**。
  * 将大体积的 PNG 转换为 PDF 格式再插入，PDF 是矢量图格式且已被 LaTeX 预优化，编译效率更高。
  * 检查并清理项目中没有使用但上传了的超大图片。

---

### 5. 使用草稿模式编写（Draft Mode）
在撰写论文文字阶段，不需要频繁渲染高质量图片。

* **操作方法**：
  * 在 `main.tex` 的第二行文档类定义中临时加入 `draft` 参数：
    ```latex
    \documentclass[12pt, a4paper, AutoFakeBold=2.5, draft]{ctexart}
    ```
  * **效果**：所有插入的图片会变成带有文件名的空白方框，不占用任何图片渲染时间，编译速度提升数倍。
  * **提示**：最后提交或生成最终 PDF 前，记得把 `draft` 删掉。

---

### 6. 分章进行局部编译
随着论文篇幅变长（几十页以上），全量编译时间会指数级上升。

* **优化方案**：
  * 不要把所有内容写在同一个 `.tex` 文件里。本模版已将内容分块。
  * 可以在 `main.tex` 中使用 `\include{6Body}` 并配合 `\includeonly`。例如在导言区写上：
    ```latex
    \includeonly{6Body} % 仅编译正文，不渲染其他部分
    ```
  * 这能极大地缩短每次修改后的等待时间，且目录和页码交叉引用信息不会丢失。

---

## 📌 Overleaf 基本设置确认

在使用本模版前，请务必确认 Overleaf 编译引擎设置正确：
1. 点击左上角的 **Menu**（菜单）。
2. 在 **Compiler**（编译器）选项中，选择 **XeLaTeX**（严禁选择 PDFLaTeX，否则中文无法正常渲染）。
3. 在 **TeX Live Version** 中，建议选择最新的版本（如 2023 或 2024）。

---

> 💡 **终极备选**：如果论文实在太大（包含大量高精度矢量图、TikZ 绘图等），且以上方法仍无法在免费版 Overleaf 编译成功，建议将项目下载到本地，使用本地安装的 TeX Live + VS Code / TeXstudio 进行编译，本地编译没有任何时间限制。
