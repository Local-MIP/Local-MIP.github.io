# Local-MIP Terminology Reference

本文档根据论文《Local-MIP: Efficient local search for mixed integer programming》定义了Local-MIP中使用的标准术语，确保网站上所有内容的术语表达一致性。

## 核心概念

### 问题定义

- **Mixed Integer Programming (MIP)** - 混合整数规划
  - 优化线性目标函数，受线性约束限制，部分变量限制为整数值

- **Objective function** - 目标函数
  - 表示为 $c^\top x$，需要最小化的线性函数

- **Constraint** - 约束
  - **General linear constraints** - 一般线性约束: $Ax \leq b$
  - **Global bounds** - 全局边界: $\ell \leq x \leq u$
  - **Integrality constraints** - 整数约束: $x_j \in \mathbb{Z}$ for $j \in I$

### 解的概念

- **Solution** - 解
  - 为每个变量分配值的向量，其中 $s_j$ 表示变量 $x_j$ 的赋值

- **Feasible solution** - 可行解
  - 满足所有约束的解（一般线性约束、全局边界和整数约束）

- **Infeasible solution** - 不可行解
  - 违反一个或多个约束的解

- **Best-found solution** - 最佳已找到解
  - 表示为 $s^*$，搜索过程中发现的最优可行解

- **Current solution** - 当前解
  - 表示为 $s^{cur}$，每次搜索步骤中正在修改的解

- **Objective value** - 目标值
  - 表示为 $obj(s)$，即 $obj(s) = c^\top s$

## Local-MIP架构

### 双模式架构 (Two-Mode Architecture)

Local-MIP根据当前解的可行性自适应地在两种模式之间切换：

#### 1. Feasible Mode (可行模式)

当前解是可行解时进入此模式。

**主要目标：** 在严格保持可行性的同时改进目标值

**关键概念：**

- **Local feasible domain** - 局部可行域
  - 表示为 $lfd(x_j, s)$
  - 变量可以在此域内变化而不违反任何约束的范围

- **Local feasible constraint domain** - 局部可行约束域
  - 表示为 $lfcd(x_j, con_i, s)$
  - 对于特定约束，变量可以变化的范围

- **Lift move operator** - 提升移动算子
  - 表示为 $lm(x_j, s)$
  - 在局部可行域内修改单个变量以最大化目标改进

- **Lift process** - 提升过程
  - 迭代应用提升移动操作以连续改进解，直到达到局部最优

- **Lift score** - 提升分数
  - 表示为 $score_{lift}(op)$
  - 测量目标函数的改进质量

#### 2. Infeasible Mode (不可行模式)

当前解违反一个或多个约束时进入此模式。

**两种场景：**
1. **Initial search** - 初始搜索：寻找第一个可行解
2. **Optimization search** - 优化搜索：寻找比最佳已找到解更好的可行解

**新型算子：**

- **Breakthrough move operator** - 突破移动算子
  - 表示为 $bm(x_j, s)$
  - 修改变量以超越最佳已知目标值

- **Mixed tight move operator** - 混合紧缩移动算子
  - 表示为 $mtm(x_j, con_i, s)$
  - 修改变量以满足和紧缩约束

### 评分系统

#### Two-Level Scoring Structure (二级评分函数结构)

**第一级：Progress Score (进展分数)**
- 表示为 $score_{progress}(op)$
- 测量操作的直接改进
- 组成部分：
  - $score_{progress}^{obj}(op)$ - 目标函数的进展分数
  - $score_{progress}^{con_i}(op)$ - 约束的进展分数

**第二级：Bonus Score (奖励分数)**
- 表示为 $score_{bonus}(op)$
- 提供战略指导和更精细的评估
- 组成部分：
  - **Breakthrough bonus** - 突破奖励: $bonus_{break}(op)$
    - 奖励超越最佳已找到目标值的情况
  - **Robustness bonus** - 鲁棒性奖励: $bonus_{robust}^{con_i}(op)$
    - 奖励保持严格不等式（更深层可行性）的情况

### 权重管理

- **Dynamic weighting scheme** - 动态权重方案
  - 调整目标函数和约束之间的优先级
  - 权重表示为 $w(obj)$ 和 $w(con_i)$
  - **Diversification** - 多样化：增加违反约束的权重
  - **Smoothing** - 平滑：偶尔降低权重以防止过度累积

## 局部搜索组件

### 基本组件

- **Operator** - 算子
  - 定义如何修改变量以生成候选解

- **Operation** - 操作
  - 算子在指定变量上的实例化

- **Scoring function** - 评分函数
  - 评估不同的候选操作以选择最有前途的执行操作

- **Neighborhood** - 邻域
  - 从当前状态考虑的候选移动集合

### 辅助策略

- **Best-from-Multiple-Selection (BMS)** - 多重选择最佳采样
  - 采样一小组操作并选择最佳的以平衡探索和利用

- **Tabu strategy** - 禁忌策略
  - 在一定任期内禁止逆转最近的移动以防止循环
  - **Tabu tenure** - 禁忌任期：禁止期的长度

- **Restart mechanism** - 重启机制
  - 周期性扰动以逃离停滞
  - **No-improvement steps** - 无改进步数：触发重启前的步数

### 约束处理

- **Constraint violation** - 约束违反
  - 约束被破坏的程度

- **Constraint weight** - 约束权重
  - 表示为 $w(con_i)$，偏向违反约束的注意力

- **Satisfied constraint** - 满足的约束
  - 满足约束条件的约束（$A_i \cdot s \leq b_i$）

- **Violated constraint** - 违反的约束
  - 不满足约束条件的约束（$A_i \cdot s > b_i$）

- **Tight constraint** - 紧约束
  - 相等成立的约束（$A_i \cdot s = b_i$）

## 方法论术语

### 完整性分类

- **Complete methods** - 完全方法
  - 寻求计算精确最优解并证明其最优性
  - 例如：Branch-and-bound (分支定界)

- **Incomplete methods** - 不完全方法
  - 努力在合理时间内获得高质量解
  - 例如：Local search (局部搜索)

### 解决器对比

- **Branch-and-bound** - 分支定界
  - 递归分区可行域并基于目标函数边界修剪节点

- **Commercial solvers** - 商业求解器
  - Gurobi, CPLEX

- **Academic solvers** - 学术求解器
  - SCIP, HiGHS

- **LP-free algorithms** - 无LP算法
  - 不依赖于求解线性规划松弛的算法

## 实现细节

### 术语表达规范

当在网站或文档中描述Local-MIP时，应遵循以下原则：

1. **一致性**：始终使用论文中定义的标准术语
2. **精确性**：使用准确的数学符号和定义
3. **完整性**：提及新概念时给出完整定义
4. **清晰性**：在英文和中文之间保持术语对应关系

### 常见表达

**正确表达：**
- "Local-MIP is an efficient local search algorithm for MIP"
- "employs a two-mode architecture"
- "integrates novel operators"
- "lift move operator"
- "breakthrough move operator"
- "mixed tight move operator"
- "local feasible domain"
- "two-level scoring structure"
- "dynamic weighting scheme"

**避免的表达：**
- "local search solver" (应说 "local search algorithm")
- "neighborhood operators" (应明确说 "lift move", "breakthrough move", or "mixed tight move")
- "constraint weights" without context (应说明是 "dynamic weighting scheme")

## 引用格式

**论文完整引用：**

Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin. *Local-MIP: Efficient local search for mixed integer programming.* Artificial Intelligence, 348 (2025), 104405.

**简短引用：**

Lin et al., "Local-MIP: Efficient local search for mixed integer programming," AIJ 2025.

---

**最后更新日期：** 2025-01-19

**参考论文：** Artificial Intelligence 348 (2025) 104405
