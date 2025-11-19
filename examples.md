---
layout: default
title: Examples
---

# Examples

Code examples and demonstrations for using Local-MIP's C++ API and callback system.

---

## Overview

The `example/` directory contains standalone demonstration projects that showcase Local-MIP's features and callback system. Each example is buildable independently and includes complete source code.

**Setup:**

```bash
cd example
./prepare.sh   # Copies libLocalMIP.a, headers, and test instances
./build.sh     # Builds all examples
```

All examples should be run from the `example/` directory where `test-set/` resides.

---

## Table of Contents

1. [Basic Example](#basic-example)
   - [Simple API](#simple-api)
2. [Callback Examples](#callback-examples)
   - [Start Callback](#start-callback)
   - [Restart Callback](#restart-callback)
   - [Weight Callback](#weight-callback)
3. [Advanced Customization](#advanced-customization)
   - [Neighbor Config](#neighbor-config)
   - [Neighbor Userdata](#neighbor-userdata)
   - [Neighbor Scoring](#neighbor-scoring)
   - [Lift Scoring](#lift-scoring)

---

## Basic Example

### Simple API

**Location:** `example/simple-api/`

A minimal example demonstrating basic solver usage.

#### What It Does

- Creates a solver instance
- Loads a MIP problem from file
- Sets basic parameters (time limit, solution output)
- Runs the solver
- Retrieves solution results

#### Code Example

```cpp
#include "local_mip/Local_MIP.h"

int main()
{
  Local_MIP solver;

  // Configure solver
  solver.set_model_file("test-set/2club200v15p5scn.mps");
  solver.set_sol_path("example_simple.sol");
  solver.set_time_limit(60.0);
  solver.set_log_obj(true);

  // Run solver
  solver.run();

  // Check results
  if (solver.is_feasible())
  {
    printf("Objective value: %.10f\n", solver.get_obj_value());
  }

  return 0;
}
```

#### Key API Methods

| Method | Description |
|--------|-------------|
| `set_model_file(path)` | Load MPS/LP file |
| `set_time_limit(seconds)` | Set time limit in seconds |
| `set_sol_path(path)` | Specify solution output file |
| `set_log_obj(true/false)` | Enable objective value logging |
| `run()` | Start solving |
| `is_feasible()` | Check if feasible solution found |
| `get_obj_value()` | Get objective value |

#### Building

From the `example/simple-api/` directory:

```bash
g++ -O3 -std=c++20 simple_api.cpp -I../../src -L../../build -lLocalMIP -lpthread -o simple_api_demo
```

Or use the example build script.

#### Running

```bash
cd example
./simple-api/simple_api_demo
```

#### Expected Output

```
c model name: 2club200v15p5scn
c reading mps file takes 0.14 seconds.
c original problem has 200 variables and 17013 constraints
...
c [     60.00] local search is terminated by timeout.
o best objective: -69
Solution is feasible!
Objective value: -69.0000000000
Solution written to: example_simple.sol
```

---

## Callback Examples

### Start Callback

**Location:** `example/start-callback/`

Demonstrates custom initialization strategies before search begins.

#### Purpose

Initialize variable values using custom logic instead of the default start method.

#### Key Features

- Access to all variables via context
- Use RNG for reproducible randomization
- Pass custom state via `user_data`

#### Code Snippet

```cpp
void my_start_callback(Start::Start_Ctx& ctx, void* user_data)
{
  // Access read-only context
  auto& shared = ctx.m_shared;

  // Initialize binary variables randomly
  for (size_t idx : shared.m_binary_idx_list)
  {
    ctx.m_var_current_value[idx] = ctx.m_rng() % 2;
  }

  // Initialize other variables to zero
  for (size_t i = 0; i < shared.m_model_manager.get_num_vars(); ++i)
  {
    if (/* not binary */)
    {
      ctx.m_var_current_value[i] = 0.0;
    }
  }
}
```

#### Use Cases

- Random initialization
- Heuristic-based initialization
- Using prior knowledge of problem structure

---

### Restart Callback

**Location:** `example/restart-callback/`

Demonstrates custom restart strategies when search stagnates.

#### Purpose

Control what happens when the solver triggers a restart (perturb solution, reset weights, etc.).

#### Key Features

- Modify current variable values
- Adjust constraint weights
- Implement custom restart strategies

#### Code Snippet

```cpp
void my_restart_callback(Restart::Restart_Ctx& ctx, void* user_data)
{
  auto& shared = ctx.m_shared;

  // Flip a subset of binary variables
  for (size_t idx : shared.m_binary_idx_list)
  {
    if (ctx.m_rng() % 100 < 30)  // 30% probability
    {
      ctx.m_var_current_value[idx] = 1.0 - ctx.m_var_current_value[idx];
    }
  }

  // Reset all constraint weights
  for (size_t i = 0; i < ctx.m_con_weight.size(); ++i)
  {
    ctx.m_con_weight[i] = 1.0;
  }
}
```

#### Use Cases

- Diversification strategies
- Weight reset schemes
- Hybrid restart approaches

---

### Weight Callback

**Location:** `example/weight-callback/`

Demonstrates custom constraint weight update methods.

#### Purpose

Customize how constraint weights are updated during search to guide the solver.

#### Key Features

- Increase weights on violated constraints
- Adjust objective weight when feasible
- Implement custom weight schemes

#### Code Snippet

```cpp
void my_weight_callback(Weight::Weight_Ctx& ctx, void* user_data)
{
  auto& shared = ctx.m_shared;

  if (shared.m_is_found_feasible)
  {
    // Increase objective weight when feasible
    ctx.m_con_weight[0] += 1.0;
  }
  else
  {
    // Increase weights on unsatisfied constraints
    for (size_t con_idx : shared.m_con_unsat_idxs)
    {
      ctx.m_con_weight[con_idx + 1] += 1.0;
    }
  }
}
```

#### Use Cases

- Adaptive weight adjustment
- Problem-specific weight schemes
- Hybrid monotone/smooth strategies

---

## Advanced Customization

### Neighbor Config

**Location:** `example/neighbor-config/`

Demonstrates custom neighborhood operation configuration.

#### Purpose

Mix built-in neighborhood operators with custom ones to define the search neighborhood.

#### Key Features

- Configure which built-in operators to use
- Add custom neighbor generation logic
- Control operator probabilities

#### Code Snippet

```cpp
void my_neighbor_callback(Neighbor::Neighbor_Ctx& ctx, void* user_data)
{
  auto& shared = ctx.m_shared;

  // Define a custom 2-variable flip operation
  if (shared.m_binary_idx_list.size() >= 2)
  {
    size_t idx1 = shared.m_binary_idx_list[ctx.m_rng() % shared.m_binary_idx_list.size()];
    size_t idx2 = shared.m_binary_idx_list[ctx.m_rng() % shared.m_binary_idx_list.size()];

    ctx.m_op_size = 2;
    ctx.m_op_var_idxs[0] = idx1;
    ctx.m_op_var_idxs[1] = idx2;
    ctx.m_op_var_deltas[0] = 1.0 - 2.0 * ctx.m_var_current_value[idx1];
    ctx.m_op_var_deltas[1] = 1.0 - 2.0 * ctx.m_var_current_value[idx2];
  }
}
```

#### Use Cases

- Problem-specific neighborhood structures
- Large neighborhood search
- Hybrid operator strategies

---

### Neighbor Userdata

**Location:** `example/neighbor-userdata/`

Demonstrates passing custom state through callbacks via `user_data`.

#### Purpose

Show how to maintain custom statistics or state across callback invocations.

#### Key Features

- Pass custom data structures to callbacks
- Track statistics across calls
- Implement stateful strategies

#### Code Snippet

```cpp
struct MyData {
  int call_count;
  std::vector<double> stats;
};

void my_callback(Neighbor::Neighbor_Ctx& ctx, void* user_data)
{
  MyData* data = static_cast<MyData*>(user_data);
  data->call_count++;

  // Use custom data for decisions
  // ...
}

int main()
{
  Local_MIP solver;
  MyData my_data = {0, {}};

  solver.set_neighbor_cbk(my_callback, &my_data);
  solver.run();

  printf("Callback called %d times\n", my_data.call_count);
}
```

#### Use Cases

- Adaptive strategies based on history
- Statistics collection
- Complex stateful algorithms

---

### Neighbor Scoring

**Location:** `example/scoring-neighbor/`

Demonstrates custom scoring functions for the infeasible phase (seeking feasibility).

#### Purpose

Customize how candidate moves are ranked when the current solution is infeasible.

#### Key Features

- Multi-level tie-breaking
- Bonus scores for breakthrough moves
- Custom scoring criteria

#### Code Snippet

```cpp
void my_neighbor_scoring(Scoring::Neighbor_Ctx& ctx, size_t var_idx, double delta, void* user_data)
{
  auto& shared = ctx.m_shared;

  // Calculate custom score based on constraint violation reduction
  double score = /* compute score */;
  double subscore = /* compute subscore for tie-breaking */;

  // Update best candidate if this is better
  if (score > ctx.m_best_neighbor_score ||
      (score == ctx.m_best_neighbor_score && subscore > ctx.m_best_neighbor_subscore))
  {
    ctx.m_best_var_idx = var_idx;
    ctx.m_best_delta = delta;
    ctx.m_best_neighbor_score = score;
    ctx.m_best_neighbor_subscore = subscore;
  }
}
```

#### Use Cases

- Progress bonus strategies
- Age-based tie-breaking
- Problem-specific scoring

---

### Lift Scoring

**Location:** `example/scoring-lift/`

Demonstrates custom scoring functions for the feasible phase (optimizing objective).

#### Purpose

Customize how candidate moves are ranked when the current solution is feasible and we're optimizing.

#### Key Features

- Objective-based scoring
- Variable degree tie-breaking
- Custom optimization criteria

#### Code Snippet

```cpp
void my_lift_scoring(Scoring::Lift_Ctx& ctx, size_t var_idx, double delta, void* user_data)
{
  auto& shared = ctx.m_shared;

  // Calculate objective improvement
  double obj_improvement = /* compute improvement */;

  // Use variable degree as tie-breaker
  int degree = /* get variable degree */;

  // Update best candidate
  if (obj_improvement > ctx.m_best_lift_score ||
      (obj_improvement == ctx.m_best_lift_score && degree < ctx.m_best_age))
  {
    ctx.m_best_var_idx = var_idx;
    ctx.m_best_delta = delta;
    ctx.m_best_lift_score = obj_improvement;
    ctx.m_best_age = degree;
  }
}
```

#### Use Cases

- Custom objective prioritization
- Tie-breaking strategies
- Problem-specific optimization

---

## Building All Examples

From the repository root:

```bash
# Prepare example environment
cd example
./prepare.sh

# Build all examples
./build.sh
```

This creates a binary for each example in its respective directory.

---

## Running Examples

All examples should be run from the `example/` directory:

```bash
cd example

# Run specific example
./simple-api/simple_api_demo
./start-callback/start_callback_demo
./restart-callback/restart_callback_demo
# ... etc
```

---

## Next Steps

- **[Documentation](/documentation)** - Detailed callback reference and API documentation
- **[Papers](/papers)** - Academic publications describing the algorithms
- **[GitHub](https://github.com/shaowei-cai-group/Local-MIP)** - Source code and issues

---

[← Back to Home](/) | [Documentation](/documentation) | [Papers →](/papers)
