---
layout: default
title: Documentation
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Documentation navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#user-guide">User Guide</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#installation--build">Installation &amp; Build</a></li>
          <li><a href="#command-line-usage">Command-Line Usage</a></li>
          <li><a href="#use-as-a-library">Use as a Library</a></li>
        </ul>
      </li>
      <li><a href="#technical-documentation">Technical Documentation</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#terminology--concepts">Terminology &amp; Concepts</a></li>
          <li><a href="#parameters-reference">Parameters Reference</a></li>
          <li><a href="#callback-system">Callback System</a></li>
        </ul>
      </li>
      <li><a href="#additional-resources">Additional Resources</a></li>
    </ul>
  </nav>

  <div class="doc-content" markdown="1">
# Documentation

Complete documentation for Local-MIP, including user guides, technical references, and API documentation.

---

## User Guide

### Installation & Build

#### System Requirements

- **CMake** ≥ 3.15
- **C++20 compiler** (GCC 10+ or Clang 12+) and pthreads
- bash, make, and standard POSIX utilities

#### Build Steps

**Release Build (Recommended):**

```bash
./build.sh release
```

This creates:

- `build/Local-MIP` - Optimized CLI binary
- `build/libLocalMIP.a` - Static library for integration

**Debug Build:**

```bash
./build.sh debug
```

Includes assertions, logging, and debug symbols for development.

**Clean Build Artifacts:**

```bash
./build.sh clean
```

#### Running Tests

Local-MIP includes comprehensive tests:

```bash
cd build

# Run unit tests
ctest --output-on-failure -R "^(api|callbacks|constraint_recognition|scoring|model_manager|reader|move_operations|neighbor_config)$"

# Run integration tests
ctest --output-on-failure -R "^integration$"

# Run all tests
ctest --output-on-failure
```

---

### Command-Line Usage

#### Basic Usage

Run the solver from the `build/` directory:

```bash
cd build
./Local-MIP -i ../test-set/2club200v15p5scn.mps -t 300 -b 1 -l 1
```

**Command Syntax:**

```bash
./Local-MIP -i <model_file> [options]
```

#### Parameter Configuration File

Use a `.set` file to configure parameters:

```bash
./Local-MIP --param_set_file ../default.set --model_file ../test-set/instance.mps
```

**Format Rules:**

- One parameter per line: `parameter_name = value`
- Lines starting with `#` or `;` are comments
- Command-line arguments override configuration file values
- See `default.set` for template and descriptions

**Example Configuration File:**

```
# Model file
model_file = test-set/problem.mps

# Time limit (seconds)
time_limit = 600

# Solution output
sol_path = solution.sol

# Bound strengthen level
bound_strengthen = 2

# Enable objective logging
log_obj = true
```

---

### Use as a Library

#### C++ Static Library

After building, the static library `build/libLocalMIP.a` and headers in `src/` are available for integration.

**Basic Example:**

```cpp
#include "local_mip/Local_MIP.h"

int main() {
  Local_MIP solver;

  // Configure solver
  solver.set_model_file("model.mps");
  solver.set_time_limit(60.0);
  solver.set_log_obj(true);

  // Run solver
  solver.run();

  // Check results
  if (solver.is_feasible()) {
    printf("Objective: %.10f\n", solver.get_obj_value());
  }

  return 0;
}
```

**Compile:**

```bash
g++ -O3 -std=c++20 my_program.cpp -I/path/to/src -L/path/to/build -lLocalMIP -lpthread -o my_program
```

See the [Examples page](/examples) for more detailed code examples.

#### Python Bindings

Located in `python-bindings/` directory.

**Build:**

```bash
cd python-bindings
./build.sh
```

**Use:**

```bash
export PYTHONPATH=$PWD/python-bindings/build:$PYTHONPATH
python3 python-bindings/sample.py
```

The Python module links against the core static library. See `python-bindings/sample.py` for usage examples.

---

## Technical Documentation

### Terminology & Concepts

#### Mixed Integer Programming (MIP)

**Problem Definition (following AIJ 2025 paper):**

A Mixed Integer Programming (MIP) problem optimizes a linear objective function subject to linear constraints, with some variables restricted to integer values. Local-MIP solves problems in the canonical minimization form:

$$
\begin{aligned}
\min_{x} \quad & c^\top x \\
\text{s.t.} \quad & Ax \le b, \\
& \ell \le x \le u, \\
& x_j \in \mathbb{Z} \quad \forall j \in I,
\end{aligned}
$$

where:

- $x \in \mathbb{R}^n$ is the variable vector ($n$ variables)
- $c \in \mathbb{R}^n$ is the objective coefficient vector
- $A \in \mathbb{R}^{m \times n}$ is the constraint matrix ($m$ constraints)
- $b \in \mathbb{R}^m$ is the right-hand side vector
- $\ell, u \in \mathbb{R}^n$ are the lower and upper bound vectors
- $I \subseteq \{1, \ldots, n\}$ is the index set of integer variables

**Standard Form Components:**

1. **Objective function:** $c^\top x$ (linear function to minimize)
2. **General linear constraints:** $Ax \le b$ (row $i$ is $A_i \cdot x \le b_i$)
3. **Global bounds:** $\ell \le x \le u$ (variable-specific lower/upper bounds)
4. **Integrality constraints:** $x_j \in \mathbb{Z}$ for $j \in I$

**Solution Concepts:**

- **Solution $s$:** A vector assigning values to each variable, where $s_j$ denotes the value assigned to variable $x_j$
- **Feasible solution:** A solution satisfying all constraints:
  - General linear constraints: $A_i \cdot s \le b_i$ for all $i \in \{1, \ldots, m\}$
  - Global bounds: $\ell_j \le s_j \le u_j$ for all $j \in \{1, \ldots, n\}$
  - Integrality constraints: $s_j \in \mathbb{Z}$ for all $j \in I$
- **Infeasible solution:** A solution violating one or more constraints
- **Objective value:** For solution $s$, the objective value is $obj(s) = c^\top s$
- **Optimal solution:** A feasible solution with the minimum objective value among all feasible solutions
- **Best-found solution $s^*$:** The best feasible solution discovered during search
- **Current solution $s^{cur}$:** The solution being modified at each search step

**Constraint Classification:**

- **Satisfied constraint:** $A_i \cdot s \le b_i$ (constraint condition holds)
- **Violated constraint:** $A_i \cdot s > b_i$ (constraint condition fails)
- **Tight constraint:** $A_i \cdot s = b_i$ (equality holds)

**Problem Types:**

- **Pure Integer Programming (IP):** All variables are integers ($I = \{1, \ldots, n\}$)
- **Binary Integer Programming (BIP):** All variables are binary ($x_j \in \{0, 1\}$)
- **Mixed Integer Programming (MIP):** Some variables are integers, others continuous ($I \subset \{1, \ldots, n\}$)

#### Local Search for MIP

**Fundamental Components:**

- **Operator:** Defines how to modify variables to generate candidate solutions
- **Operation:** An instantiation of an operator on a specified variable
- **Scoring function:** Evaluates different candidate operations to select the most promising one for execution
- **Neighborhood:** The set of candidate moves considered from the current state

**Local Search Framework:**

Local search for MIP iteratively modifies the current solution $s^{cur}$ by applying operations that change variable values. At each step:

1. Generate candidate operations using operators
2. Evaluate operations using scoring functions
3. Select and execute the best operation
4. Update $s^{cur}$ and track $s^*$ (best feasible solution found)
5. Continue until termination criterion (time limit, local optimum, etc.)

**Local-MIP Architecture:**

Local-MIP employs a **two-mode architecture** that adapts based on the current solution's feasibility:

**1. Feasible Mode** (when $s^{cur}$ is feasible)

*Primary goal:* Improve objective value while strictly maintaining feasibility.

**Key Concepts:**

- **Local feasible domain** $lfd(x_j, s)$: The range within which variable $x_j$ can be modified without violating any constraints, given current solution $s$. For constraint $i$:

  $$lfcd(x_j, con_i, s) = \begin{cases}
  [\ell_j, u_j] & \text{if } A_{ij} = 0 \\
  [\ell_j, s_j + \frac{b_i - A_i \cdot s}{A_{ij}}] & \text{if } A_{ij} > 0 \\
  [s_j + \frac{b_i - A_i \cdot s}{A_{ij}}, u_j] & \text{if } A_{ij} < 0
  \end{cases}$$

  Then $lfd(x_j, s) = \bigcap_i lfcd(x_j, con_i, s)$ (intersection of all constraint domains).

- **Lift move operator** $lm(x_j, s)$: Modifies variable $x_j$ to a new value within $lfd(x_j, s)$ that maximizes objective improvement while maintaining feasibility:

  $$lm(x_j, s) = \arg\min_{v \in lfd(x_j, s)} c_j \cdot v$$

- **Lift process:** Iteratively applies lift moves until no further objective improvement is possible (local optimum reached).

- **Lift scoring:** $score_{lift}(op)$ measures the objective improvement of operation $op$.

**2. Infeasible Mode** (when $s^{cur}$ violates one or more constraints)

*Two scenarios:*

- **Initial search:** Find the first feasible solution
- **Optimization search:** Find feasible solutions better than $s^*$

**Novel Operators:**

- **Breakthrough move operator** $bm(x_j, s)$: Modifies variable $x_j$ to surpass the best-known objective value $obj(s^*)$:

  $$\text{Target: } c_j \cdot (s_j + \delta) < obj(s^*) - c^\top s + c_j \cdot s_j$$

- **Mixed tight move operator** $mtm(x_j, con_i, s)$: Modifies variable $x_j$ to satisfy and tighten constraint $con_i$:

  $$\text{Target: } s_j' = s_j + \frac{b_i - A_i \cdot s}{A_{ij}} \quad \text{(makes } A_i \cdot s' = b_i \text{)}$$

**Dynamic Weighting Scheme:**

- Objective weight: $w(obj)$
- Constraint weights: $w(con_i)$ for each constraint $i$
- Weight update: Increase weights of violated constraints; occasional smoothing prevents excessive accumulation
- Balances priority between objective optimization and constraint satisfaction

**Two-Level Scoring Structure:**

1. **Progress score** $score_{progress}(op)$ (first level):
   - $score_{progress}^{obj}(op)$: Progress toward better objective
   - $score_{progress}^{con_i}(op)$: Progress toward satisfying constraint $i$
   - Weighted combination: $w(obj) \cdot score_{progress}^{obj}(op) + \sum_i w(con_i) \cdot score_{progress}^{con_i}(op)$

2. **Bonus score** $score_{bonus}(op)$ (second level):
   - **Breakthrough bonus** $bonus_{break}(op)$: Rewards surpassing $obj(s^*)$
   - **Robustness bonus** $bonus_{robust}^{con_i}(op)$: Rewards maintaining strict inequality (deeper feasibility)
   - Provides strategic guidance and finer-grained tie-breaking

**Additional Components:**

- **Best-from-Multiple-Selection (BMS):** Samples a small set of operations and selects the best to balance exploration and exploitation
- **Tabu strategy:** Prohibits reversing recent moves for a tenure period to prevent cycling
- **Restart mechanism:** Periodic perturbation to escape stagnation (triggered after specified no-improvement steps)
- **Weight update:** Increases weights of frequently violated constraints; occasional smoothing prevents excessive accumulation

---

### Parameters Reference

Complete list of all command-line parameters and configuration options.

#### General Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `model_file` | Path to input model file (.mps/.lp). **Required.** | `-i` | string | - | `""` |
| `sol_path` | Path to output solution file (.sol) | `-s` | string | - | `""` |
| `param_set_file` | Path to parameter configuration file (.set) | `-c` | string | - | `""` |
| `time_limit` | Time limit in seconds | `-t` | double | [0, 1e8] | `10` |
| `random_seed` | Random seed for local search (0 uses default) | `-S` | int | [0, 2147483647] | `0` |

#### Tolerance Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `feas_tolerance` | Feasibility tolerance | `-F` | double | [0, 1e-2] | `1e-6` |
| `opt_tolerance` | Optimality tolerance | `-O` | double | [0, 1] | `1e-4` |
| `zero_tolerance` | Zero value tolerance | `-Z` | double | [0, 1e-3] | `1e-9` |

#### Search Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `bound_strengthen` | Bound strengthen level (0-off, 1-ip, 2-mip) | `-b` | int | [0, 2] | `1` |
| `log_obj` | Log objective values during search | `-l` | boolean | - | `true` |
| `restart_step` | No-improvement steps before restart (0 disables) | `-r` | int | [0, 100000000] | `1000000` |
| `smooth_prob` | Weight smoothing probability (in 1/10000) | `-0` | int | [0, 10000] | `1` |

#### BMS Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `bms_unsat_con` | BMS unsatisfied constraint sample size | `-u` | int | [0, 100000000] | `12` |
| `bms_unsat_ops` | BMS MTM unsatisfied operations | `-p` | int | [0, 100000000] | `2250` |
| `bms_sat_con` | BMS satisfied constraint sample size | `-v` | int | [0, 100000000] | `1` |
| `bms_sat_ops` | BMS MTM satisfied operations | `-o` | int | [0, 100000000] | `80` |
| `bms_flip_ops` | BMS flip operations | `-x` | int | [0, 100000000] | `0` |
| `bms_easy_ops` | BMS easy operations | `-q` | int | [0, 100000000] | `5` |
| `bms_random_ops` | BMS random operations | `-g` | int | [0, 100000000] | `250` |

#### Tabu Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `tabu_base` | Base tabu tenure | `-a` | int | [0, 100000000] | `4` |
| `tabu_var` | Tabu tenure variation (minimum 1) | `-e` | int | [1, 100000000] | `7` |

#### Other Parameters

| Parameter | Description | Flag | Type | Range | Default |
|-----------|-------------|------|------|-------|---------|
| `activity_period` | Constraint activity recompute period | `-h` | int | [1, 100000000] | `100000` |
| `break_eq_feas` | Break feasibility on equality constraints | `-z` | boolean | - | `false` |
| `split_eq` | Split equality constraints into two inequalities | `-j` | boolean | - | `true` |

#### Strategy Parameters

| Parameter | Description | Flag | Type | Values | Default |
|-----------|-------------|------|------|--------|---------|
| `start` | Start method | `-m` | enum | `zero`, `random` | `zero` |
| `restart` | Restart strategy | `-y` | enum | `random`, `best`, `hybrid` | `best` |
| `weight` | Constraint weight update method | `-w` | enum | `smooth`, `monotone` | `monotone` |
| `lift_scoring` | Feasible-phase lift scoring | `-f` | enum | `lift_age`, `lift_random` | `lift_age` |
| `neighbor_scoring` | Infeasible-phase neighbor scoring | `-n` | enum | `progress_bonus`, `progress_age` | `progress_bonus` |

---

### Callback System

Local-MIP exposes multiple callback hooks to customize solver behavior.

#### Callback Overview

All callbacks share a common read-only context that provides access to the current search state.

**Available Callbacks:**

1. Start Callback - Initialize variable values
2. Restart Callback - Control restart behavior
3. Weight Callback - Customize weight updates
4. Neighbor Callback - Generate custom neighbor moves
5. Neighbor Scoring Callback - Score moves in infeasible phase
6. Lift Scoring Callback - Score moves in feasible phase

#### Common Read-only Context (`Readonly_Ctx`)

Available in every callback via `ctx.m_shared`:

**Model Data:**

- `m_model_manager` - Model metadata (variables, constraints, bounds, coefficients)
- `m_obj_var_num` - Objective dimension
- `m_var_obj_cost` - Objective coefficients

**Current State:**

- `m_var_current_value` - Current variable values
- `m_var_best_value` - Best solution found so far
- `m_con_activity` / `m_con_constant` / `m_con_is_equality` - Constraint activities, RHS, equality flags
- `m_con_weight` - Constraint weights (index 0 is objective)

**Constraint Sets:**

- `m_con_unsat_idxs` - Unsatisfied constraint indices
- `m_con_pos_in_unsat_idxs` - Positions in unsatisfied list
- `m_con_sat_idxs` - Satisfied constraint indices

**Search State:**

- `m_var_last_*` - Last improve/decrease steps for variables
- `m_var_allow_*` - Allowed steps for variables
- `m_cur_step` - Current search step
- `m_last_improve_step` - Last improvement step

**Solution Status:**

- `m_is_found_feasible` - Whether feasible solution found
- `m_best_obj` - Best objective value
- `m_current_obj_breakthrough` - Current objective breakthrough

**Variable Sets:**

- `m_binary_idx_list` - Binary variable indices
- `m_non_fixed_var_idx_list` - Non-fixed variable indices

#### Start Callback

**Purpose:** Initialize variable values before search begins.

**Signature:**

```cpp
void callback(Start::Start_Ctx& ctx, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_var_current_value` - Set starting assignment
- `ctx.m_rng` - Random number generator for reproducible initialization

**Example Use Case:** Random initialization of binary variables

#### Restart Callback

**Purpose:** Control actions at restart (e.g., perturb solutions, reset weights).

**Signature:**

```cpp
void callback(Restart::Restart_Ctx& ctx, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_var_current_value` - Current assignment (can perturb)
- `ctx.m_con_weight` - Constraint weights (index 0 = objective)
- `ctx.m_rng` - Random number generator

**Example Use Case:** Flip subset of binaries and reset weights

#### Weight Callback

**Purpose:** Customize constraint weight updates.

**Signature:**

```cpp
void callback(Weight::Weight_Ctx& ctx, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_con_weight` - Adjust weights (index 0 = objective)
- `ctx.m_rng` - Random number generator

**Example Use Case:** Increase weights for violated constraints

#### Neighbor Callback

**Purpose:** Generate custom neighbor moves.

**Signature:**

```cpp
void callback(Neighbor::Neighbor_Ctx& ctx, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_op_size` - Number of variables in move
- `ctx.m_op_var_idxs[]` - Variable indices
- `ctx.m_op_var_deltas[]` - Change amounts
- `ctx.m_rng` - Random number generator

**Example Use Case:** Mix built-in neighbors with custom operators

#### Neighbor Scoring Callback (Infeasible Phase)

**Purpose:** Rank neighbor candidates while seeking feasibility.

**Signature:**

```cpp
void callback(Scoring::Neighbor_Ctx& ctx, size_t var_idx, double delta, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_best_var_idx` - Best candidate variable index
- `ctx.m_best_delta` - Best candidate delta
- `ctx.m_best_neighbor_score` - Best neighbor score
- `ctx.m_best_neighbor_subscore` - Best neighbor subscore

**Example Use Case:** Multi-level tie-breaker with bonus scores

#### Lift Scoring Callback (Feasible Phase)

**Purpose:** Score candidate moves in feasible optimization phase.

**Signature:**

```cpp
void callback(Scoring::Lift_Ctx& ctx, size_t var_idx, double delta, void* user_data)
```

**Key Writable Fields:**

- `ctx.m_best_var_idx` - Best candidate variable index
- `ctx.m_best_delta` - Best candidate delta
- `ctx.m_best_lift_score` - Best lift score
- `ctx.m_best_age` - Best age

**Example Use Case:** Use variable degree as tie-breaker

#### How to Register Callbacks

**C++ API:**

- `set_start_cbk(callback, user_data)`
- `set_restart_cbk(callback, user_data)`
- `set_weight_cbk(callback, user_data)`
- `set_neighbor_cbk(callback, user_data)`
- `set_neighbor_scoring_cbk(callback, user_data)`
- `set_lift_scoring_cbk(callback, user_data)`

**Python Bindings:**

- Analogous registration functions with opaque context capsules
- Extend binding for field-level access

#### Callback Tips

- Use `user_data` to pass custom state across calls
- `ctx.m_shared` is read-only; mutate only the writable fields
- Run from `example/` after `prepare.sh` to use shipped test instances

---

## Additional Resources

- [Examples](/examples) - Code examples demonstrating all callbacks
- [Papers](/papers) - Academic publications and citations
- [GitHub Repository](https://github.com/shaowei-cai-group/Local-MIP) - Source code and issues

---

[← Back to Home](/) | [Examples →](/examples)

  </div>
</div>
