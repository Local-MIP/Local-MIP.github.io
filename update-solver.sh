#!/bin/bash

# 更新 Local-MIP 求解器子模块脚本

echo "正在更新 Local-MIP 求解器..."

# 初始化子模块（如果是首次克隆）
git submodule init

# 更新子模块到最新版本
git submodule update --remote --merge submodules/solver

echo "✓ Local-MIP 求解器已更新到最新版本！"
