# 代码块渲染优化说明

本文档说明了对代码块 ```  ``` 渲染的全面优化。

## ✨ 优化特性

### 1. **自动复制按钮**
- ✅ 每个代码块右上角自动添加"Copy"按钮
- ✅ 点击后显示"Copied!"并变为绿色
- ✅ 2秒后自动恢复
- ✅ 使用浏览器剪贴板API

### 2. **语言标签显示**
- ✅ 自动检测代码语言（从Markdown语法）
- ✅ 在代码块右上角显示语言标签
- ✅ 不同语言使用不同颜色：
  - **Bash/Shell**: 绿色 `#10b981`
  - **Python**: 蓝色 `#3b82f6`
  - **JavaScript**: 橙色 `#f59e0b`
  - **C++/CPP**: 靛蓝 `#6366f1`
  - **YAML**: 紫色 `#8b5cf6`
  - **JSON**: 青色 `#14b8a6`
  - **其他**: 灰色 `#64748b`

### 3. **改进的视觉效果**
- ✅ 浅色背景（`#fafbff`）配深色鲜艳代码 - 高对比度
- ✅ 精致的双层阴影效果
- ✅ 圆角边框（14px）
- ✅ 柔和的边框颜色（`#e0e7ff`）

### 4. **更好的字体**
优先使用专业编程字体：
```
"JetBrains Mono" → "Fira Code" → "SF Mono" → "Cascadia Code" → "Consolas"
```

### 5. **响应式优化**
- **桌面端**: 完整尺寸，大按钮
- **移动端**:
  - 更小的按钮和标签
  - 更小的字体（0.85em）
  - 自动横向滚动

---

## 📝 使用方法

### Markdown中标记语言

```markdown
​```bash
./build.sh release
​```

​```python
def hello():
    print("Hello World")
​```

​```cpp
#include <iostream>
int main() {
    std::cout << "Hello" << std::endl;
}
​```
```

语言标签会自动检测并显示相应的颜色标记！

---

## 🎨 视觉设计

### 代码块结构
```
┌─────────────────────────────────────┐
│                    [BASH] [Copy]    │  ← 语言标签 + 复制按钮
│  ./build.sh release                 │
│  cd build                           │
│  ./Local-MIP -i model.mps           │
│                                     │
└─────────────────────────────────────┘
```

### 颜色方案
- **背景**: 浅蓝白色 `#fafbff` - 高对比度
- **边框**: 淡蓝灰 `#e0e7ff`
- **阴影**: 双层柔和阴影
- **文字**: 深灰 `#1e293b` - 鲜艳深色
- **行号**: 浅灰背景 `#f1f5f9` + 灰色文字 `#94a3b8`
- **按钮**: 白色背景 `#ffffff` + 靛蓝色 `#4f46e5`

---

## 🔧 技术实现

### CSS样式 (`assets/css/style.scss`)
- **行 443-611**: 代码块核心样式
  - 内联代码 `<code>`
  - 代码块 `<pre>`
  - 语法高亮容器 `.highlight`
  - 复制按钮样式

### JavaScript功能 (`_layouts/default.html`)
- **行 201-298**: 代码块增强脚本
  - 自动检测语言
  - 添加复制按钮
  - 智能复制（排除行号）
  - 状态反馈（Copied!）

---

## 🎨 语法高亮配色方案（深色鲜艳）

适配浅色背景的深色鲜艳配色：

- **关键字 (Keyword)**: `#2563eb` 鲜艳蓝色
- **字符串 (String)**: `#d97706` 橙金色
- **数字 (Number)**: `#0891b2` 青色
- **函数 (Function)**: `#059669` 绿色
- **类名 (Class)**: `#7c3aed` 紫色
- **变量 (Variable)**: `#dc2626` 红色
- **注释 (Comment)**: `#6b7280` 灰色（稍弱化）
- **操作符 (Operator)**: `#0f172a` 深黑

所有颜色都经过精心挑选，确保在浅色背景上具有高对比度和良好的可读性。

---

## 🌟 特殊效果

### 1. 复制按钮动画
```css
默认: 白色背景，靛蓝色图标
悬停: 淡蓝背景，深靛色图标 + 上浮效果
点击: 缩小动画（scale: 0.98）
复制后: 鲜绿色背景，白色对勾图标 + 发光效果
```

**智能复制功能**：
- 自动排除行号（`.gutter`）元素
- 仅复制纯代码内容
- 支持多种Jekyll语法高亮结构

### 2. 语言标签
```
位置: 右上角
样式: 小型大写字母
颜色: 根据语言动态变化
圆角: 左下角8px
```

---

## 📱 响应式断点

| 屏幕尺寸 | 代码字体 | 按钮大小 | 内边距 |
|---------|---------|---------|--------|
| 桌面 (>768px) | 0.9rem | 正常 | 1.25rem |
| 移动 (≤768px) | 0.85em | 更小 | 1rem |
| 小屏 (≤480px) | 0.85em | 最小 | 1rem |

---

## 🚀 性能优化

1. **延迟加载**: 使用`DOMContentLoaded`事件
2. **防重复**: 检查是否已添加按钮
3. **现代API**: 使用原生`Clipboard API`
4. **CSS优先**: 尽可能使用CSS伪元素

---

## 🎯 支持的语言

以下语言会显示彩色标签：

- ✅ Bash/Shell (绿色)
- ✅ Python (蓝色)
- ✅ JavaScript/JS (橙色)
- ✅ C++/CPP (靛蓝)
- ✅ YAML/YML (紫色)
- ✅ JSON (青色)
- ⚪ 其他语言 (灰色)

---

## 📦 文件清单

### 修改的文件
1. **`assets/css/style.scss`**
   - 行 443-611: 代码块样式
   - 行 963-987: 移动端优化

2. **`_layouts/default.html`**
   - 行 143-286: JavaScript功能

---

## 🔍 示例效果

### Bash代码块
```bash
./build.sh release
cd build
./Local-MIP -i ../test-set/model.mps -t 300
```
- 显示绿色"BASH"标签
- 右上角有复制按钮
- 点击复制所有代码

### Python代码块
```python
def solve_mip(model_file):
    solver = LocalMIP()
    solver.set_model_file(model_file)
    solver.run()
    return solver.get_obj_value()
```
- 显示蓝色"PYTHON"标签
- 语法高亮自动应用

### C++代码块
```cpp
#include "local_mip/Local_MIP.h"

int main() {
    Local_MIP solver;
    solver.run();
    return 0;
}
```
- 显示靛蓝色"CPP"标签
- 专业的等宽字体

---

## 💡 最佳实践

1. **总是指定语言**
   ```markdown
   ​```bash  ← 推荐
   ​```      ← 不推荐（显示为灰色"code"）
   ```

2. **使用标准语言名称**
   - `bash`, `shell`, `sh`
   - `python`, `py`
   - `cpp`, `c++`
   - `javascript`, `js`

3. **保持代码简洁**
   - 过长的代码会自动横向滚动
   - 建议每行不超过80-100字符

---

## 🎨 自定义扩展

### 添加新语言的颜色标签

在 `style.scss` 中添加：

```scss
.highlight[data-lang="rust"]::before {
  background: #f74c00;
  color: #ffffff;
  border-color: #d43700;
}
```

### 修改按钮位置

在 JavaScript 中修改：

```javascript
copyButton.style.top = '1rem';    // 调整垂直位置
copyButton.style.right = '1rem';  // 调整水平位置
```

---

## ✅ 测试清单

重新构建网站后检查：

- [ ] 代码块显示复制按钮
- [ ] 点击复制按钮工作正常
- [ ] **复制内容不包含行号**（关键！）
- [ ] 复制后显示"Copied!"绿色提示
- [ ] 语言标签正确显示
- [ ] 不同语言显示不同颜色
- [ ] **浅色背景 + 深色鲜艳代码（高对比度）**
- [ ] 移动端按钮尺寸合适
- [ ] 横向滚动在长代码时工作
- [ ] 语法高亮正常应用且颜色鲜艳

---

## 🚀 部署

```bash
# 本地测试
bundle exec jekyll serve

# 访问页面，查看代码块效果
open http://localhost:4000/quick-start
open http://localhost:4000/examples
```

所有代码块现在都具有：
- ✅ 专业的视觉效果
- ✅ 一键复制功能
- ✅ 自动语言检测
- ✅ 彩色语言标签
- ✅ 完美的响应式设计

代码块渲染优化完成！🎉
