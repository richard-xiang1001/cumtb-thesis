% cumtbthesis.cls
% LaTeX Thesis Template for China University of Mining and Technology, Beijing (CUMTB)
% 中国矿业大学（北京）毕业论文 LaTeX 模板
%
% Version: 2.0
% Author: Template Development Team
% Date: 2025-12-05
%
% 适用于本科、硕士、博士学位论文
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cumtbthesis}[2025/12/05 v1.0 CUMTB Thesis Template]

% ============================================================================
% 选项处理 Options Processing
% ============================================================================

% 学位类型选项 Degree type options
\newif\ifcumtb@bachelor\cumtb@bachelorfalse  % 本科 Bachelor
\newif\ifcumtb@master\cumtb@masterfalse      % 硕士 Master
\newif\ifcumtb@doctor\cumtb@doctorfalse      % 博士 Doctor

\DeclareOption{bachelor}{\cumtb@bachelortrue}
\DeclareOption{master}{\cumtb@mastertrue}
\DeclareOption{doctor}{\cumtb@doctortrue}

% 盲审选项 Review option
\newif\ifcumtb@review\cumtb@reviewfalse
\DeclareOption{review}{\cumtb@reviewtrue}

% 其他选项传递给 ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 默认为硕士论文
\ifcumtb@bachelor\else
  \ifcumtb@master\else
    \ifcumtb@doctor\else
      \cumtb@mastertrue
    \fi
  \fi
\fi

% ============================================================================
% 加载基础文档类 Load Base Class
% ============================================================================

\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain]{ctexbook}

% ============================================================================
% 引入宏包 Load Packages
% ============================================================================

% 数学相关 Math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{mathrsfs}

% 页面布局 Page layout
\RequirePackage{geometry}
\RequirePackage{fancyhdr}

% 图表 Figures and tables
\RequirePackage{graphicx}
\RequirePackage{subcaption}  % 子图支持（替代 subfigure）
\RequirePackage{booktabs}    % 三线表
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{array}

% 颜色 Colors
\RequirePackage{xcolor}

% 超链接 Hyperlinks
\RequirePackage{hyperref}

% 参考文献 Bibliography
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}

% 目录 Table of contents
\RequirePackage{titletoc}

% 算法 Algorithms
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% 代码高亮 Code highlighting
\RequirePackage{listings}

% 其他工具 Other utilities
\RequirePackage{enumitem}     % 列表环境
\RequirePackage{calc}          % 计算
\RequirePackage{etoolbox}      % 编程工具

% ============================================================================
% 页面设置 Page Setup
% ============================================================================

\geometry{
  a4paper,
  top=2.54cm,
  bottom=2.54cm,
  left=3.17cm,
  right=3.17cm,
  headheight=1.5cm,
  footskip=1cm
}

% ============================================================================
% 字体设置 Font Setup
% ============================================================================

% 设置英文字体为 Times New Roman
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% 中文字体已由 ctex 处理

% ============================================================================
% 页眉页脚 Headers and Footers
% ============================================================================

\pagestyle{fancy}
\fancyhf{}  % 清空页眉页脚

% 页眉
\fancyhead[C]{\zihao{5}\songti 中国矿业大学（北京）\cumtb@degree 学位论文}

% 页脚
\fancyfoot[C]{\zihao{5}\thepage}

% 重定义 plain 样式（章节首页）
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\zihao{5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}

% 页眉横线
\renewcommand{\headrulewidth}{0.4pt}

% ============================================================================
% 章节标题格式 Chapter and Section Formats
% ============================================================================

\ctexset{
  chapter = {
    format = \centering\zihao{3}\heiti,
    nameformat = {},
    titleformat = {},
    number = \arabic{chapter},
    beforeskip = 20pt,
    afterskip = 18pt,
    pagestyle = plain,
  },
  section = {
    format = \raggedright\zihao{4}\heiti,
    beforeskip = 18pt,
    afterskip = 12pt,
  },
  subsection = {
    format = \raggedright\zihao{-4}\heiti,
    beforeskip = 12pt,
    afterskip = 6pt,
  },
  subsubsection = {
    format = \raggedright\zihao{-4}\heiti,
    beforeskip = 12pt,
    afterskip = 6pt,
  }
}

% ============================================================================
% 目录格式 Table of Contents Format
% ============================================================================

\titlecontents{chapter}[0pt]{\vspace{0.5em}\heiti\zihao{4}}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}

\titlecontents{section}[2em]{\vspace{0.15em}\songti\zihao{-4}}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}

\titlecontents{subsection}[4em]{\vspace{0.10em}\songti\zihao{-4}}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*[5pt]{$\cdot$}\contentspage}

% ============================================================================
% 浮动体设置 Float Settings
% ============================================================================

% 图表标题格式
\RequirePackage{caption}
\DeclareCaptionFont{song}{\songti\zihao{5}}
\DeclareCaptionFont{hei}{\heiti\zihao{5}}
\captionsetup{
  labelsep=quad,
  font=song,
  labelfont=hei
}
\captionsetup[figure]{position=bottom}
\captionsetup[table]{position=top}

% 图表编号格式（章节-序号）
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% ============================================================================
% 代码高亮设置 Code Listing Settings
% ============================================================================

\lstset{
  basicstyle=\small\ttfamily,
  keywordstyle=\color{blue}\bfseries,
  commentstyle=\color{gray},
  stringstyle=\color{red},
  showstringspaces=false,
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=10pt,
  frame=single,
  breaklines=true,
  breakatwhitespace=false,
  tabsize=4
}

% ============================================================================
% 超链接设置 Hyperlink Settings
% ============================================================================

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfstartview=FitH
}

% ============================================================================
% 定义变量 Define Variables
% ============================================================================

\newcommand{\cumtb@degree}{硕士}  % 默认学位

\ifcumtb@bachelor
  \renewcommand{\cumtb@degree}{学士}
\fi
\ifcumtb@master
  \renewcommand{\cumtb@degree}{硕士}
\fi
\ifcumtb@doctor
  \renewcommand{\cumtb@degree}{博士}
\fi

% 论文信息变量
\def\cumtb@title{论文题目}
\def\cumtb@author{作者姓名}
\def\cumtb@studentid{学号}
\def\cumtb@school{学院名称}
\def\cumtb@major{专业名称}
\def\cumtb@advisor{导师姓名}
\def\cumtb@advisortitle{导师职称}
\def\cumtb@date{\today}

% 英文信息
\def\cumtb@entitle{Thesis Title}
\def\cumtb@enauthor{Author Name}
\def\cumtb@enschool{School Name}
\def\cumtb@enmajor{Major}
\def\cumtb@enadvisor{Advisor Name}

% 摘要关键词
\def\cumtb@keywords{}
\def\cumtb@enkeywords{}

% 用户接口命令 User Interface Commands
\newcommand{\ctitle}[1]{\def\cumtb@title{#1}}
\newcommand{\cauthor}[1]{\def\cumtb@author{#1}}
\newcommand{\studentid}[1]{\def\cumtb@studentid{#1}}
\newcommand{\school}[1]{\def\cumtb@school{#1}}
\newcommand{\major}[1]{\def\cumtb@major{#1}}
\newcommand{\advisor}[1]{\def\cumtb@advisor{#1}}
\newcommand{\advisortitle}[1]{\def\cumtb@advisortitle{#1}}
\newcommand{\cdate}[1]{\def\cumtb@date{#1}}

\newcommand{\etitle}[1]{\def\cumtb@entitle{#1}}
\newcommand{\eauthor}[1]{\def\cumtb@enauthor{#1}}
\newcommand{\eschool}[1]{\def\cumtb@enschool{#1}}
\newcommand{\emajor}[1]{\def\cumtb@enmajor{#1}}
\newcommand{\eadvisor}[1]{\def\cumtb@enadvisor{#1}}

\newcommand{\keywords}[1]{\def\cumtb@keywords{#1}}
\newcommand{\enkeywords}[1]{\def\cumtb@enkeywords{#1}}

% ============================================================================
% 封面 Cover Page
% ============================================================================

\newcommand{\makecover}{
  \begin{titlepage}
    \centering
    
    % 学校 Logo（如果存在）
    \ifcumtb@review
      % 盲审模式下可选择隐藏logo
      \vspace*{0.5cm}
    \else
      \IfFileExists{figures/cumtb-logo.pdf}{
        \includegraphics[height=3.5cm]{figures/cumtb-logo.pdf}
        \vspace{0.3cm}
      }{
        \IfFileExists{figures/cumtb-logo.png}{
          \includegraphics[height=3.5cm]{figures/cumtb-logo.png}
          \vspace{0.3cm}
        }{
          \vspace*{0.5cm}
        }
      }
    \fi
    
    {\zihao{-0}\songti\bfseries 中国矿业大学（北京）\par}
    \vspace{0.5cm}
    {\zihao{0}\songti\bfseries \cumtb@degree 学位论文\par}
    
    \vspace{3cm}
    
    {\zihao{2}\heiti\bfseries \cumtb@title\par}
    
    \vfill
    
    {\zihao{-3}\songti
    \begin{tabular}{rl}
      \ifcumtb@review
        \makebox[6em][s]{作者姓名：} & \underline{\makebox[10em]{}} \\[1em]
        \makebox[6em][s]{学号：} & \underline{\makebox[10em]{}} \\[1em]
      \else
        \makebox[6em][s]{作者姓名：} & \underline{\makebox[10em]{\cumtb@author}} \\[1em]
        \makebox[6em][s]{学号：} & \underline{\makebox[10em]{\cumtb@studentid}} \\[1em]
      \fi
      \makebox[6em][s]{学院：} & \underline{\makebox[10em]{\cumtb@school}} \\[1em]
      \makebox[6em][s]{专业：} & \underline{\makebox[10em]{\cumtb@major}} \\[1em]
      \ifcumtb@review
        \makebox[6em][s]{指导教师：} & \underline{\makebox[10em]{}} \\[1em]
        \makebox[6em][s]{职称：} & \underline{\makebox[10em]{}} \\[1em]
      \else
        \makebox[6em][s]{指导教师：} & \underline{\makebox[10em]{\cumtb@advisor}} \\[1em]
        \makebox[6em][s]{职称：} & \underline{\makebox[10em]{\cumtb@advisortitle}} \\[1em]
      \fi
    \end{tabular}
    \par}
    
    \vspace{2cm}
    
    {\zihao{-3}\songti \cumtb@date\par}
    
  \end{titlepage}
  \cleardoublepage
}

% ============================================================================
% 中文摘要 Chinese Abstract
% ============================================================================

\newenvironment{abstract}{%
  \chapter*{摘\quad 要}
  \addcontentsline{toc}{chapter}{摘要}
}{%
  \par
  \vspace{1em}
  \noindent\textbf{关键词：}\cumtb@keywords
  \cleardoublepage
}

% ============================================================================
% 英文摘要 English Abstract
% ============================================================================

\newenvironment{enabstract}{%
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}{%
  \par
  \vspace{1em}
  \noindent\textbf{Keywords: }\cumtb@enkeywords
  \cleardoublepage
}

% ============================================================================
% 致谢 Acknowledgements
% ============================================================================

\newenvironment{acknowledgements}{%
  \ifcumtb@review
    % 盲审模式下不显示致谢
  \else
    \chapter*{致\quad 谢}
    \addcontentsline{toc}{chapter}{致谢}
  \fi
}{%
  \ifcumtb@review\else
    \cleardoublepage
  \fi
}

% ============================================================================
% 符号说明 Notation
% ============================================================================

\newenvironment{notation}{%
  \chapter*{符号说明}
  \addcontentsline{toc}{chapter}{符号说明}
  \begin{longtable}{cp{10cm}}
    \toprule
    \textbf{符号} & \textbf{说明} \\
    \midrule
    \endfirsthead
    \toprule
    \textbf{符号} & \textbf{说明} \\
    \midrule
    \endhead
    \bottomrule
    \endfoot
}{%
  \end{longtable}
  \cleardoublepage
}

% ============================================================================
% 附录 Appendix
% ============================================================================

% 重定义附录命令
\let\cumtb@appendix\appendix
\renewcommand{\appendix}{%
  \cumtb@appendix
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
  \renewcommand{\thetable}{\Alph{chapter}-\arabic{table}}
  \renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
}

% ============================================================================
% 结束 End of Class
% ============================================================================

\endinput
