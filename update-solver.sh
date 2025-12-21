#!/usr/bin/env bash
set -euo pipefail

# 更新 Local-MIP 求解器子模块脚本

SUBMODULE_PATH="submodules/solver"

echo "正在更新 Local-MIP 求解器（子模块：${SUBMODULE_PATH}）..."

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "错误：当前目录不是 Git 仓库，无法更新子模块。"
  exit 1
fi

if [[ ! -f ".gitmodules" ]]; then
  echo "错误：未找到 .gitmodules，当前仓库未配置子模块。"
  exit 1
fi

if ! git config -f .gitmodules --get "submodule.${SUBMODULE_PATH}.url" >/dev/null 2>&1; then
  echo "错误：.gitmodules 中未配置 ${SUBMODULE_PATH}。"
  exit 1
fi

# 同步子模块配置（避免 URL/分支变更导致更新失败）
git submodule sync --recursive

# 初始化并更新子模块到最新版本（首次克隆也可用）
git submodule update --init --remote --merge "${SUBMODULE_PATH}"

echo "✓ Local-MIP 求解器已更新到最新版本！"