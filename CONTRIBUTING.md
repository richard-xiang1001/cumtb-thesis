# 贡献指南

感谢您对 CUMTB Thesis LaTeX 模板的关注！我们欢迎任何形式的贡献。

## 如何贡献

### 报告问题

如果您发现了bug或有改进建议：

1. 首先查看 [Issues](https://github.com/username/cumtb-thesis/issues) 中是否已有相关问题
2. 如果没有，请创建新的 Issue，并提供：
   - 清晰的问题描述
   - 复现步骤（如果是bug）
   - 您的环境信息（TeX Live版本、操作系统等）
   - 相关的错误信息或日志

### 提交代码

1. **Fork 项目**
   ```bash
   # 在 GitHub 上 Fork 项目到您的账号
   ```

2. **克隆到本地**
   ```bash
   git clone https://github.com/your-username/cumtb-thesis.git
   cd cumtb-thesis
   ```

3. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/your-bug-fix
   ```

4. **进行修改**
   - 保持代码风格一致
   - 添加必要的注释
   - 测试您的修改

5. **提交更改**
   ```bash
   git add .
   git commit -m "简短描述您的更改"
   ```

6. **推送到 GitHub**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **创建 Pull Request**
   - 在 GitHub 上创建 Pull Request
   - 描述您的更改内容和目的
   - 等待审核

## 代码规范

### LaTeX 代码

- 使用 2 空格缩进
- 每行不超过 80 字符（注释除外）
- 添加有意义的注释
- 使用英文注释，必要时添加中文说明

### 命名规范

- 命令使用 `\cumtb@` 前缀
- 环境使用小写字母
- 变量使用下划线分隔

### 示例

```latex
% Good
\newcommand{\cumtb@title}{论文题目}
\newenvironment{abstract}{...}{...}

% Bad
\newcommand{\mytitle}{论文题目}
\newenvironment{Abstract}{...}{...}
```

## 文档要求

如果您添加了新功能：

1. 在使用手册中添加相应说明
2. 更新 README.md
3. 在 CHANGELOG.md 中记录更改（如果有）
4. 提供示例代码

## 测试

提交前请确保：

- [ ] 代码能够成功编译
- [ ] 没有引入新的警告或错误
- [ ] 测试了主要功能
- [ ] 检查了不同学位类型（bachelor/master/doctor）
- [ ] 测试了盲审模式

## 版本发布

版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)：

- **主版本号**：不兼容的API修改
- **次版本号**：向下兼容的功能性新增
- **修订号**：向下兼容的问题修正

## 行为准则

- 尊重他人的观点和贡献
- 使用友善和包容的语言
- 接受建设性的批评
- 关注对社区最有利的事情

## 许可证

通过贡献代码，您同意根据 MIT 许可证授权您的贡献。

## 联系方式

如有任何问题，请通过以下方式联系：

- GitHub Issues
- GitHub Discussions（待开通）

---

再次感谢您的贡献！🎉
