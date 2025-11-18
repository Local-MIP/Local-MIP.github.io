# Local-MIP.github.io

这是Local-MIP项目的GitHub Pages网站，采用极简学术风格设计。

## 网站结构

```
Local-MIP.github.io/
├── _config.yml           # Jekyll配置文件
├── index.md              # 首页
├── docs.md               # 文档页面（Markdown使用指南）
├── about.md              # 关于页面
├── assets/
│   └── css/
│       └── style.scss    # 自定义样式（极简黑白风格）
├── .github/
│   └── workflows/
│       └── pages.yml     # GitHub Pages自动部署
├── Gemfile               # Ruby依赖
└── .gitignore            # Git忽略文件
```

## 快速开始

### 1. 启用GitHub Pages

在你的仓库设置中启用GitHub Pages：

1. 进入仓库的 **Settings** → **Pages**
2. 在 **Source** 中选择 **GitHub Actions**
3. 保存设置

### 2. 推送代码

```bash
git add .
git commit -m "初始化网站"
git push origin main
```

推送后，GitHub Actions会自动构建和部署你的网站。几分钟后，你可以通过 `https://local-mip.github.io` 访问。

### 3. 本地预览（可选）

如果你想在本地预览网站：

```bash
# 安装依赖
bundle install

# 启动本地服务器
bundle exec jekyll serve

# 访问 http://localhost:4000
```

## 如何编辑内容

### 添加新页面

1. 在项目根目录创建一个新的 `.md` 文件，例如 `research.md`
2. 添加YAML头部：

```yaml
---
layout: default
title: 研究内容
---
```

3. 使用Markdown编写内容
4. 在 `index.md` 中添加链接：`[研究内容](research.md)`

### 编辑现有页面

直接编辑对应的 `.md` 文件即可，支持完整的Markdown语法。

### 修改样式

编辑 `assets/css/style.scss` 文件来自定义网站样式。

## 功能特点

- ✅ **极简设计**：黑白配色，专注内容
- ✅ **Markdown编辑**：使用熟悉的Markdown语法
- ✅ **响应式布局**：自适应各种屏幕尺寸
- ✅ **自动部署**：推送代码自动更新网站
- ✅ **SEO优化**：内置SEO插件

## 技术栈

- [Jekyll](https://jekyllrb.com/) - 静态网站生成器
- [GitHub Pages](https://pages.github.com/) - 托管服务
- [Minima](https://github.com/jekyll/minima) - Jekyll主题
- Markdown - 内容编辑

## 许可证

MIT License
