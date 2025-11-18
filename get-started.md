---
layout: default
title: Get Started
---

**导航**: [首页](/) | [Get Started](get-started.md) | [下载](download.md)

# Get Started

快速开始使用Local-MIP。

## 安装

### 系统要求

- Python 3.8+
- 支持的操作系统：Windows, Linux, macOS

### 安装步骤

1. **下载软件**

   访问[下载页面](download.md)获取最新版本。

2. **安装依赖**

   ```bash
   pip install -r requirements.txt
   ```

3. **验证安装**

   ```bash
   python -m localmip --version
   ```

## 快速示例

### 基础用法

```python
from localmip import Solver

# 创建求解器实例
solver = Solver()

# 添加变量
x = solver.add_variable('x', lb=0, ub=10)
y = solver.add_variable('y', lb=0, ub=10)

# 添加约束
solver.add_constraint(x + y <= 15)
solver.add_constraint(2*x + y >= 10)

# 设置目标函数
solver.set_objective(3*x + 2*y, maximize=True)

# 求解
solution = solver.solve()

print(f"最优解: x={solution.x}, y={solution.y}")
print(f"目标值: {solution.objective_value}")
```

### 读取模型文件

```python
from localmip import Model

# 从MPS文件读取
model = Model.from_mps('problem.mps')

# 求解
solution = model.solve()
```

## 下一步

- 查看[完整文档](docs.md)了解更多功能
- 访问[下载页面](download.md)获取最新版本
- 查看[GitHub仓库](https://github.com/Local-MIP)获取源代码

## 获取帮助

如果遇到问题：

1. 查看[文档](docs.md)中的常见问题
2. 在[GitHub Issues](https://github.com/Local-MIP/issues)提交问题
3. 发送邮件至：your-email@example.com

[返回首页](/)
