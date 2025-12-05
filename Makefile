# Makefile for CUMTB Thesis
# 中国矿业大学（北京）毕业论文 LaTeX 模板构建脚本

# 主文件名（不含扩展名）
THESIS = main
DOC = docs/cumtbthesis

# 编译引擎
LATEX = xelatex
BIBTEX = biber

# 编译选项
LATEXOPT = -interaction=nonstopmode -halt-on-error

# 默认目标
.PHONY: all thesis doc clean cleanall distclean wordcount help

# 显示帮助信息
help:
	@echo "CUMTB Thesis Makefile"
	@echo "===================="
	@echo ""
	@echo "make thesis    - 编译论文 PDF"
	@echo "make doc       - 编译使用手册 PDF"
	@echo "make all       - 编译论文和使用手册"
	@echo "make clean     - 清理辅助文件"
	@echo "make cleanall  - 清理所有生成文件（包括 PDF）"
	@echo "make distclean - 完全清理（清理所有生成文件和备份）"
	@echo "make wordcount - 统计论文字数"
	@echo "make help      - 显示此帮助信息"

# 编译论文
thesis: $(THESIS).pdf

# 编译使用手册
doc: $(DOC).pdf

# 编译所有文档
all: thesis doc

# 论文编译规则
$(THESIS).pdf: $(THESIS).tex cumtbthesis.cls data/*.tex ref/*.bib
	$(LATEX) $(LATEXOPT) $(THESIS)
	-$(BIBTEX) $(THESIS)
	$(LATEX) $(LATEXOPT) $(THESIS)
	$(LATEX) $(LATEXOPT) $(THESIS)
	@echo "论文编译完成: $(THESIS).pdf"

# 使用手册编译规则（如果存在）
$(DOC).pdf: $(DOC).tex
	@if [ -f $(DOC).tex ]; then \
		cd docs && $(LATEX) $(LATEXOPT) cumtbthesis && \
		cd .. && echo "使用手册编译完成: $(DOC).pdf"; \
	else \
		echo "使用手册源文件不存在，跳过编译"; \
	fi

# 清理辅助文件
clean:
	-@rm -f \
		$(THESIS).aux $(THESIS).bbl $(THESIS).bcf $(THESIS).blg \
		$(THESIS).log $(THESIS).out $(THESIS).toc $(THESIS).lof \
		$(THESIS).lot $(THESIS).fls $(THESIS).fdb_latexmk \
		$(THESIS).synctex.gz $(THESIS).nav $(THESIS).snm \
		$(THESIS).vrb $(THESIS).run.xml $(THESIS).xdv \
		$(THESIS).thm $(THESIS).listing $(THESIS).loe \
		$(THESIS).nlo $(THESIS).nls $(THESIS).ilg $(THESIS).ind \
		$(THESIS).gls $(THESIS).glo $(THESIS).glg $(THESIS).alg \
		$(THESIS).acr $(THESIS).acn $(THESIS).idx \
		data/*.aux \
		*.backup *~ \
		2>/dev/null
	-@rm -f docs/*.aux docs/*.log docs/*.out 2>/dev/null
	@echo "辅助文件已清理"

# 清理所有生成文件（包括 PDF）
cleanall: clean
	-@rm -f $(THESIS).pdf $(DOC).pdf 2>/dev/null
	@echo "所有生成文件已清理"

# 完全清理
distclean: cleanall
	-@rm -rf auto/ *.bak *.sav 2>/dev/null
	@echo "完全清理完成"

# 字数统计
wordcount:
	@echo "正在统计论文字数..."
	@texcount -ch -sum $(THESIS).tex 2>/dev/null || \
		echo "未安装 texcount，请使用: tlmgr install texcount"
