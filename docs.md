---
layout: default
title: 文档
---

**导航**: [首页](/) | [Get Started](get-started.md) | [下载](download.md)

# 文档

本页面展示如何使用Markdown编辑内容。

## Markdown基础语法

### 标题

使用 `#` 符号创建标题，数量表示级别：

```markdown
# 一级标题
## 二级标题
### 三级标题
```

### 文本格式

- **粗体文本**：使用 `**文本**` 或 `__文本__`
- *斜体文本*：使用 `*文本*` 或 `_文本_`
- ***粗斜体***：使用 `***文本***`
- ~~删除线~~：使用 `~~文本~~`

### 列表

无序列表使用 `-`、`*` 或 `+`：

- 项目1
- 项目2
  - 子项目2.1
  - 子项目2.2
- 项目3

有序列表使用数字：

1. 第一项
2. 第二项
3. 第三项

### 链接和图片

- 链接：`[链接文本](URL)`
- 图片：`![图片描述](图片URL)`

示例：
- [访问GitHub](https://github.com)
- [返回首页](/)

### 代码

行内代码使用单个反引号：`code`

代码块使用三个反引号：

```python
def hello_world():
    print("Hello, World!")
```

### 表格

| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 数据1 | 数据2 | 数据3 |
| 数据4 | 数据5 | 数据6 |

### 引用

> 这是一段引用文本。
> 可以跨越多行。

### 分隔线

使用三个或更多的 `-`、`*` 或 `_`：

---

## 添加新页面

要添加新页面，只需在项目根目录创建一个 `.md` 文件，添加YAML头部：

```yaml
---
layout: default
title: 页面标题
---
```

然后使用Markdown编写内容即可。

## 更多资源

- [Markdown官方指南](https://www.markdownguide.org/)
- [GitHub Flavored Markdown](https://github.github.com/gfm/)
- [Jekyll文档](https://jekyllrb.com/)

[返回首页](/)
