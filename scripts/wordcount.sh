#!/bin/bash
# wordcount.sh
# 中国矿业大学（北京）毕业论文字数统计脚本

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印标题
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   CUMTB 论文字数统计${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# 检查 texcount 是否安装
if ! command -v texcount &> /dev/null; then
    echo -e "${RED}错误: texcount 未安装${NC}"
    echo -e "${YELLOW}请运行以下命令安装:${NC}"
    echo -e "  tlmgr install texcount"
    exit 1
fi

# 主文件
MAIN_FILE="main.tex"

if [ ! -f "$MAIN_FILE" ]; then
    echo -e "${RED}错误: 找不到 ${MAIN_FILE}${NC}"
    exit 1
fi

# 统计总字数（包含中英文）
echo -e "${GREEN}━━━ 总体统计 ━━━${NC}"
texcount -ch -sum -1 "$MAIN_FILE" 2>/dev/null | grep -E "Words in text|Words in headers|Words in float captions|Number of headers|Number of floats|Number of math"

echo ""
echo -e "${GREEN}━━━ 详细统计 ━━━${NC}"

# 统计各章节字数
echo -e "${YELLOW}各章节字数:${NC}"
for chapter in data/chap*.tex; do
    if [ -f "$chapter" ]; then
        filename=$(basename "$chapter")
        words=$(texcount -ch -brief "$chapter" 2>/dev/null | head -1 | awk '{print $1}')
        echo -e "  ${filename}: ${words} 字"
    fi
done

echo ""
echo -e "${YELLOW}摘要字数:${NC}"
if [ -f "data/abstract.tex" ]; then
    cn_words=$(texcount -ch -brief data/abstract.tex 2>/dev/null | head -1 | awk '{print $1}')
    echo -e "  中文摘要: ${cn_words} 字"
fi
if [ -f "data/abstract_en.tex" ]; then
    en_words=$(texcount -ch -brief data/abstract_en.tex 2>/dev/null | head -1 | awk '{print $1}')
    echo -e "  英文摘要: ${en_words} 词"
fi

# 统计图表数量
echo ""
echo -e "${YELLOW}图表统计:${NC}"
figure_count=$(grep -r "\\begin{figure}" data/ 2>/dev/null | wc -l | tr -d ' ')
table_count=$(grep -r "\\begin{table}" data/ 2>/dev/null | wc -l | tr -d ' ')
equation_count=$(grep -r "\\begin{equation}" data/ 2>/dev/null | wc -l | tr -d ' ')

echo -e "  图片数量: ${figure_count}"
echo -e "  表格数量: ${table_count}"
echo -e "  公式数量: ${equation_count}"

# 统计参考文献数量
echo  ""
echo -e "${YELLOW}参考文献:${NC}"
if [ -f "ref/refs.bib" ]; then
    ref_count=$(grep -c "^@" ref/refs.bib 2>/dev/null)
    echo -e "  文献条目: ${ref_count}"
fi

echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}统计完成！${NC}"
echo -e "${BLUE}================================${NC}"
