#!/bin/bash

# 更新 Local-MIP 求解器子模块脚本

echo "正在更新 Local-MIP 求解器..."

# 初始化子模块（如果是首次克隆）
git submodule init

# 更新子模块到最新版本
git submodule update --remote --merge submodules/solver

echo "✓ Local-MIP 求解器已更新到最新版本！"

 # Local-MIP-2.0是最新版本的代码仓库， AIJ-Local-MIP.pdf 是1.0版本的论文（主要提供术语参考），你需要结合代码仓库、论文、相关页面内容，仔细检查 index.md 页面，确保所有内容准确无误，高度一致性。给出质量提升的意见，若没有任何提升空间，则回答我完美无缺。
 