---
layout: default
title: 下载
---

**导航**: [首页](/) | [Get Started](get-started.md) | [下载](download.md)

# 下载

获取Local-MIP的最新版本和历史版本。

## 最新版本

### v1.0.0 (2025-01-18)

最新稳定版本，推荐下载。

| 平台 | 下载链接 | 文件大小 |
|------|---------|---------|
| Windows (64-bit) | [下载 .exe](#) | 25 MB |
| macOS (Intel) | [下载 .dmg](#) | 23 MB |
| macOS (Apple Silicon) | [下载 .dmg](#) | 22 MB |
| Linux (64-bit) | [下载 .tar.gz](#) | 21 MB |
| 源代码 | [GitHub Release](#) | - |

**更新内容**：
- 首次发布
- 支持标准MIP求解
- 包含预处理和割平面算法
- 提供Python和C++ API

## Python包安装

通过pip安装（推荐）：

```bash
pip install localmip
```

从源码安装：

```bash
git clone https://github.com/Local-MIP/localmip.git
cd localmip
pip install -e .
```

## 历史版本

### v0.9.0-beta (2024-12-15)

测试版本，用于早期用户反馈。

| 平台 | 下载链接 |
|------|---------|
| Windows | [下载](#) |
| macOS | [下载](#) |
| Linux | [下载](#) |

**更新内容**：
- Beta版功能预览
- 基础求解器实现

## 系统要求

### 最低配置
- 操作系统：Windows 10+, macOS 10.15+, Linux (Ubuntu 20.04+)
- 内存：4 GB RAM
- 处理器：双核 2.0 GHz
- 磁盘空间：100 MB

### 推荐配置
- 内存：8 GB RAM 或更多
- 处理器：四核 2.5 GHz 或更高
- 磁盘空间：500 MB

## 验证下载

所有发布文件都提供SHA256校验和，用于验证下载完整性：

```bash
# Linux/macOS
shasum -a 256 localmip-1.0.0.tar.gz

# Windows (PowerShell)
Get-FileHash localmip-1.0.0.exe -Algorithm SHA256
```

## 许可证

Local-MIP采用MIT许可证发布。详见[LICENSE](https://github.com/Local-MIP/LICENSE)文件。

## 下一步

- 查看[Get Started](get-started.md)快速入门指南
- 阅读[完整文档](docs.md)
- 访问[GitHub仓库](https://github.com/Local-MIP)

## 获取支持

- GitHub Issues: [提交问题](https://github.com/Local-MIP/issues)
- Email: your-email@example.com

[返回首页](/)
