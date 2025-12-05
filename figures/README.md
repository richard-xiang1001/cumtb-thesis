# Logo 使用说明

## 学校 Logo 文件

本目录用于存放图片文件，包括学校logo和论文中使用的图片。

### Logo 文件说明

- **cumtb-logo.png**: 中国矿业大学（北京）校徽（PNG格式）
- **cumtb-logo.pdf**: 中国矿业大学（北京）校徽（PDF矢量格式，推荐）

### 使用官方Logo

如果您有学校官方提供的logo文件，请：

1. 将官方logo文件命名为 `cumtb-logo.pdf`（矢量格式）或 `cumtb-logo.png`（位图格式）
2. 放置在本目录下
3. 模板会自动在封面中使用

### Logo 显示规则

- **正常模式**：封面顶部显示学校logo
- **盲审模式**：可选择隐藏logo（当前设置为隐藏）
- **自动检测**：优先使用PDF格式，如不存在则使用PNG格式
- **缺失处理**：如果logo文件不存在，封面仍可正常生成

### 获取官方Logo

访问中国矿业大学（北京）官网：
- 官网：http://www.cumtb.edu.cn/
- 学校标识页面：通常在"关于学校" → "学校标识"栏目

### Logo 尺寸

模板中logo默认高度为 3.5cm，您可以在 `cumtbthesis.cls` 的 `\makecover` 命令中调整：

```latex
\includegraphics[height=3.5cm]{figures/cumtb-logo.pdf}
            调整此处尺寸 ↑
```

### 其他图片

论文中使用的其他图片也建议放在此目录，按章节或类型分组：

```
figures/
├── cumtb-logo.png              # 学校logo
├── chap01/                     # 第一章图片
│   ├── architecture.pdf
│   └── flowchart.pdf
├── chap02/                     # 第二章图片
│   ├── result1.png
│   └── result2.png
└── common/                     # 通用图片
    └── example.pdf
```

### 图片格式建议

- **矢量图**：推荐使用 PDF、SVG（转PDF）
- **位图**：使用 PNG（推荐）或 JPG
- **避免**：BMP、TIFF 等格式

### 图片分辨率

- **位图**：至少 300 DPI
- **矢量图**：无分辨率限制（推荐）

---

*最后更新：2025年12月5日*
