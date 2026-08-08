# Local-MIP.github.io

Local-MIP 官方网站，使用 Jekyll 构建并通过 GitHub Pages 部署。

## 主要内容

- `index.md`: 首页、项目亮点与团队信息
- `software.md`: 稳定版本、安装方式与系统要求
- `quick-start.md`: Python 和 CLI 快速开始
- `tutorials.md`: CLI、C++/Python API、参数与回调教程
- `examples.md`: 与求解器仓库同步的可运行示例
- `papers.md`: 论文、引用与版本复现说明
- `miplib-records.md`: MIPLIB 2017 结果
- `submodules/solver`: 固定到稳定标签的 Local-MIP 源码子模块
- `_data/external_links.yml`: 稳定版本号及固定版本链接
- `assets/css/style.scss`: 站点样式

## 同步 Local-MIP 版本

当前网站与 Local-MIP `v2.0.9` 保持一致。

```bash
# 更新到指定稳定标签
./update-solver.sh v2.0.9

# 或选择远端最新稳定语义版本标签
./update-solver.sh
```

脚本只切换到形如 `vX.Y.Z` 的稳定标签，并在子模块存在未提交改动时停止。更新子模块后，还需要同步：

1. `_data/external_links.yml` 中的版本号和固定标签链接。
2. `software.md` 中的发布说明与 PyPI 支持范围。
3. `quick-start.md`、`tutorials.md` 和 `examples.md` 中的参数、API 与示例。

## 本地构建

```bash
bundle config set --local path "vendor/bundle"
bundle install
bundle exec jekyll build
bundle exec jekyll serve
```

本地预览地址为 `http://127.0.0.1:4000/`。

## 验证

```bash
# Jekyll 配置与构建
bundle exec jekyll doctor
bundle exec jekyll build

# 检查子模块版本
git -C submodules/solver describe --tags --exact-match HEAD

# 构建 Local-MIP
cd submodules/solver
./build.sh release
```

网站构建会排除求解器子模块、开发说明和本地构建产物。推送到 `main` 后，`.github/workflows/pages.yml` 会构建并部署 GitHub Pages。
