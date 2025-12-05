# latexmk configuration for CUMTB Thesis
# 中国矿业大学（北京）毕业论文 latexmk 配置文件

# 使用 XeLaTeX 编译
$pdf_mode = 5;  # 5 for xelatex

# 使用 biber 处理参考文献
$bibtex_use = 2;  # 使用 biber
$biber = 'biber %O %S';

# XeLaTeX 编译命令
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -synctex=1 %O %S';

# 设置 PDF 查看器（macOS）
$pdf_previewer = 'open -a Skim';

# 生成 PDF 的文件列表（用于清理）
$clean_ext = 'bbl bcf blg fls log nav out snm synctex.gz run.xml toc lof lot thm xdv';

# 清理所有辅助文件
$clean_full_ext = 'aux bbl bcf blg fls log nav out snm synctex.gz run.xml toc lof lot thm xdv fdb_latexmk';

# 连续编译模式的文件检查
@default_files = ('main.tex');

# 允许 shell 转义
$latex_silent_switch = '-interaction=batchmode';

# 自动处理依赖
$recorder = 1;

# 编译失败时继续
$force_mode = 0;
