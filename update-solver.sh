#!/usr/bin/env bash
set -euo pipefail

SUBMODULE_PATH="submodules/solver"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REQUESTED_VERSION="${1:-latest}"

if [[ $# -gt 1 ]]; then
  echo "用法：$0 [vX.Y.Z]"
  exit 1
fi

if [[ "${REQUESTED_VERSION}" != "latest" &&
      ! "${REQUESTED_VERSION}" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "错误：版本必须使用 vX.Y.Z 格式。"
  exit 1
fi

cd "${SCRIPT_DIR}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "错误：脚本目录不是 Git 仓库。"
  exit 1
fi

if [[ ! -f ".gitmodules" ]]; then
  echo "错误：未找到 .gitmodules。"
  exit 1
fi

if ! git config -f .gitmodules --get "submodule.${SUBMODULE_PATH}.url" >/dev/null 2>&1; then
  echo "错误：.gitmodules 中未配置 ${SUBMODULE_PATH}。"
  exit 1
fi

git submodule sync --recursive

if [[ ! -e "${SUBMODULE_PATH}/.git" ]]; then
  git submodule update --init "${SUBMODULE_PATH}"
fi

if [[ -n "$(git -C "${SUBMODULE_PATH}" status --porcelain)" ]]; then
  echo "错误：${SUBMODULE_PATH} 存在未提交改动，请先处理后再更新。"
  exit 1
fi

echo "正在读取 Local-MIP 远端标签..."
REMOTE_TAGS="$(git -C "${SUBMODULE_PATH}" ls-remote --refs --tags origin 'v[0-9]*')"

TARGET_VERSION="${REQUESTED_VERSION}"
if [[ "${REQUESTED_VERSION}" == "latest" ]]; then
  TARGET_VERSION=""
  BEST_MAJOR=-1
  BEST_MINOR=-1
  BEST_PATCH=-1

  while read -r _ ref; do
    candidate="${ref#refs/tags/}"
    if [[ "${candidate}" =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
      major=$((10#${BASH_REMATCH[1]}))
      minor=$((10#${BASH_REMATCH[2]}))
      patch=$((10#${BASH_REMATCH[3]}))

      if (( major > BEST_MAJOR ||
            (major == BEST_MAJOR && minor > BEST_MINOR) ||
            (major == BEST_MAJOR && minor == BEST_MINOR && patch > BEST_PATCH) )); then
        TARGET_VERSION="${candidate}"
        BEST_MAJOR="${major}"
        BEST_MINOR="${minor}"
        BEST_PATCH="${patch}"
      fi
    fi
  done <<< "${REMOTE_TAGS}"

  if [[ -z "${TARGET_VERSION}" ]]; then
    echo "错误：远端未找到形如 vX.Y.Z 的稳定标签。"
    exit 1
  fi
fi

if ! grep -Fq $'\t'"refs/tags/${TARGET_VERSION}" <<< "${REMOTE_TAGS}"; then
  echo "错误：远端不存在标签 ${TARGET_VERSION}。"
  exit 1
fi

echo "正在获取 ${TARGET_VERSION}..."
git -C "${SUBMODULE_PATH}" fetch --tags --prune origin
git -C "${SUBMODULE_PATH}" checkout --detach "${TARGET_VERSION}"

COMMIT="$(git -C "${SUBMODULE_PATH}" rev-parse --short=12 HEAD)"
echo "Local-MIP 子模块已更新到 ${TARGET_VERSION} (${COMMIT})。"
echo "请继续同步 _data/external_links.yml 和网站版本说明。"
