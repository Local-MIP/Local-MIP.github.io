---
layout: default
title: Examples
description: Code examples demonstrating Local-MIP's callback system to customize operators, scoring functions, and search strategies for mixed integer programming.
keywords: Local-MIP examples, callback system, custom operators, lift scoring, neighbor scoring, MIP customization, C++ API
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Examples navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#simple-api">Simple API</a></li>
      <li><a href="#start-callback">Start Callback</a></li>
      <li><a href="#restart-callback">Restart Callback</a></li>
      <li><a href="#weight-callback">Weight Callback</a></li>
      <li><a href="#neighbor-config">Neighbor Config</a></li>
      <li><a href="#neighbor-userdata">Neighbor Userdata</a></li>
      <li><a href="#neighbor-scoring">Neighbor Scoring</a></li>
      <li><a href="#lift-scoring">Lift Scoring</a></li>
      <li><a href="#building-all-examples">Build</a></li>
      <li><a href="#running-examples">Running Examples</a></li>
      <li><a href="#next-steps">Next Steps</a></li>
    </ul>
  </nav>

  <div class="doc-content" markdown="1">

# Examples

Code examples and demonstrations for using Local-MIP's C++ API and callback system to customize search behavior.

---

## Overview

The `example/` directory contains standalone demonstration projects that showcase Local-MIP's features and callback system. Each example is buildable independently and includes complete source code.

**Setup:**

```bash
./build.sh release   # Builds solver and libLocalMIP.a (required by examples)
cd example
./prepare.sh         # Copies libLocalMIP.a, headers, and test instances
./build.sh           # Builds all examples
```

All examples should be run from the `example/` directory where `test-set/` resides.

---

## Simple API

**Location:** `example/simple-api/`

A minimal example demonstrating basic solver usage.

### What It Does

- Creates a solver instance
- Loads a MIP problem from file
- Sets basic parameters (time limit, solution output)
- Runs the solver
- Retrieves solution results

### Code Example

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

### Key API Methods

| Method | Description |
|--------|-------------|
| `set_model_file(path)` | Load MPS/LP file |
| `set_time_limit(seconds)` | Set time limit in seconds |
| `set_sol_path(path)` | Specify solution output file |
| `set_log_obj(true/false)` | Enable objective value logging |
| `run()` | Start solving |
| `is_feasible()` | Check if feasible solution found |
| `get_obj_value()` | Get objective value |

### Building

From the `example/simple-api/` directory:

```bash
g++ -O3 -std=c++20 simple_api.cpp -I../../src -L../../build -lLocalMIP -lpthread -o simple_api_demo
```

Or use the example build script.

### Running

```bash
cd example
./simple-api/simple_api_demo
```

### Expected Output

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

## Start Callback

**Location:** `example/start-callback/`

Demonstrates custom initialization strategies before search begins.

### Purpose

Initialize variable values using custom logic instead of the default start method.

### Key Features

- Access to all variables via context
- Use RNG for reproducible randomization
- Pass custom state via `user_data`

### Code Snippet

```cpp
int call_count = 0;

Local_Search::Start_Cbk cbk = [](Start::Start_Ctx& ctx, void* user_data)
{
  auto& values = ctx.m_var_current_value;
  auto& rng = ctx.m_rng;
  const auto& binary_vars = ctx.m_shared.m_binary_idx_list;

  if (user_data)
  {
    int* counter = static_cast<int*>(user_data);
    (*counter)++;
    printf("Callback called %d time(s)\n", *counter);
  }

  std::uniform_int_distribution<int> dist(0, 1);
  for (size_t var_idx : binary_vars)
  {
    values[var_idx] = dist(rng);
  }
};
```

### Use Cases

- Random initialization
- Heuristic-based initialization
- Using prior knowledge of problem structure

---

## Restart Callback

**Location:** `example/restart-callback/`

Demonstrates custom restart strategies when search stagnates.

### Purpose

Control what happens when the solver triggers a restart (perturb solution, reset weights, etc.).

### Key Features

- Modify current variable values
- Adjust constraint weights
- Implement custom restart strategies

### Code Snippet

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

### Use Cases

- Diversification strategies
- Weight reset schemes
- Hybrid restart approaches

---

## Weight Callback

**Location:** `example/weight-callback/`

Demonstrates custom constraint weight update methods.

### Purpose

Customize how constraint weights are updated during search to guide the solver.

### Key Features

- Increase weights on violated constraints
- Adjust objective weight when feasible
- Implement custom weight schemes

### Code Snippet

```cpp
struct WeightStats { int total_calls = 0; int triggered_updates = 0; };

Local_Search::Weight_Cbk weight_cbk = [](Weight::Weight_Ctx& ctx, void* user_data)
{
  auto& weights = ctx.m_con_weight;
  auto& rng = ctx.m_rng;
  const auto& unsat_idxs = ctx.m_shared.m_con_unsat_idxs;

  WeightStats* stats = static_cast<WeightStats*>(user_data);
  if (stats) stats->total_calls++;

  std::uniform_real_distribution<double> prob_dist(0.0, 1.0);
  if (prob_dist(rng) < 0.5)  // 50% chance to update
  {
    if (stats) stats->triggered_updates++;

    for (size_t con_idx : unsat_idxs)
    {
      weights[con_idx]++;          // Unsatisfied constraints
    }

    if (ctx.m_shared.m_is_found_feasible && unsat_idxs.empty())
    {
      weights[0]++;                // Objective weight (index 0)
    }
  }
};
```

### Use Cases

- Adaptive weight adjustment
- Problem-specific weight schemes
- Hybrid monotone/smooth strategies

---

## Neighbor Config

**Location:** `example/neighbor-config/`

Demonstrates how to configure the neighbor list: enable/disable built-ins, reorder them, and mix in custom neighbors with explicit BMS sizes.

### Purpose

Shape the search neighborhood by selecting which operators run, their order, and how many operations each produces.

### Key Features

- Default list (in order): `unsat_mtm_bm`, `sat_mtm`, `flip`, `easy`, `unsat_mtm_bm_random`
- `clear_neighbor_list()` to remove all operators, `reset_default_neighbor_list()` to restore
- `add_neighbor(name, bms_con, bms_op)` to add built-ins with BMS constraint/op counts
- `add_custom_neighbor(name, func, user_data)` to prepend/append user-defined operators
- Order matters: operators are invoked in the order added

### Code Snippet

```cpp
// Custom neighbors
void my_random_flip(Neighbor::Neighbor_Ctx& ctx, void*) { /* ... */ }
void my_gradient_descent(Neighbor::Neighbor_Ctx& ctx, void*) { /* ... */ }

int main(int argc, char** argv)
{
  const char* instance = (argc > 1) ? argv[1] : "test-set/2club200v15p5scn.mps";

  // Example 2: custom order with built-ins only
  {
    Local_MIP solver;
    solver.clear_neighbor_list();
    solver.add_neighbor("flip", /*bms_con=*/0, /*bms_op=*/12);
    solver.add_neighbor("easy", 0, 8);
    solver.set_model_file(instance);
    solver.run();
  }

  // Example 3: default list + custom neighbors appended
  {
    Local_MIP solver;
    solver.add_custom_neighbor("my_random_flip", my_random_flip);
    solver.add_custom_neighbor("my_gradient_descent", my_gradient_descent);
    solver.set_model_file(instance);
    solver.run();
  }

  // Example 5: mixed order (custom first, then built-ins, then custom)
  {
    Local_MIP solver;
    solver.clear_neighbor_list();
    solver.add_custom_neighbor("my_random_flip", my_random_flip);
    solver.add_neighbor("unsat_mtm_bm", 12, 8);
    solver.add_neighbor("flip", 0, 12);
    solver.add_custom_neighbor("my_gradient_descent", my_gradient_descent);
    solver.set_model_file(instance);
    solver.run();
  }
}
```

### Use Cases

- Reorder or prune default operators for faster iteration
- Tune BMS sampling (`bms_con`, `bms_op`) to balance breadth vs. depth
- Mix problem-specific operations with built-ins without recompiling core code

---

## Neighbor Userdata

**Location:** `example/neighbor-userdata/`

Demonstrates passing custom state through callbacks via `user_data`.

### Purpose

Show how to maintain custom statistics or state across callback invocations.

### Key Features

- Pass custom data structures to callbacks
- Track statistics across calls
- Implement stateful strategies

### Code Snippet

```cpp
struct NeighborStats { size_t total_calls = 0; size_t binary_flips = 0; };

void smart_flip_neighbor(Neighbor::Neighbor_Ctx& ctx, void* user_data)
{
  auto* stats = static_cast<NeighborStats*>(user_data);
  if (stats) stats->total_calls++;

  const auto& binary_list = ctx.m_shared.m_binary_idx_list;
  if (binary_list.empty()) { ctx.m_op_size = 0; return; }

  size_t var_idx = binary_list[ctx.m_rng() % binary_list.size()];
  ctx.m_op_size = 1;
  ctx.m_op_var_idxs[0] = var_idx;
  ctx.m_op_var_deltas[0] = (ctx.m_shared.m_var_current_value[var_idx] < 0.5) ? 1.0 : -1.0;

  if (stats) stats->binary_flips++;
}

int main()
{
  Local_MIP solver;
  NeighborStats stats{};

  solver.clear_neighbor_list();
  solver.add_custom_neighbor("smart_flip", smart_flip_neighbor, &stats);
  solver.set_model_file("test-set/2club200v15p5scn.mps");
  solver.set_time_limit(30.0);
  solver.run();

  printf("Total calls: %zu, binary flips: %zu\n", stats.total_calls, stats.binary_flips);
}
```

### Use Cases

- Adaptive strategies based on history
- Statistics collection
- Complex stateful algorithms

---

## Neighbor Scoring

**Location:** `example/scoring-neighbor/`

Demonstrates custom scoring functions for the infeasible phase (seeking feasibility).

### Purpose

Customize how candidate operations are ranked when the current solution is infeasible.

### Key Features

- Multi-level tie-breaking with random third-level
- Binary duplicate filtering via stamp tokens
- Bonus scores for breakthrough operations
- Tracks variable age for reporting

### Code Snippet

```cpp
struct NeighborStats
{
  std::mt19937 rng{std::random_device{}()};
};

void my_neighbor_scoring(Scoring::Neighbor_Ctx& ctx, size_t var_idx, double delta, void* user_data)
{
  auto& shared = ctx.m_shared;

  // Skip duplicate binary evaluations using stamp mechanism
  const auto& var = shared.m_model_manager.var(var_idx);
  if (var.is_binary())
  {
    if (ctx.m_binary_op_stamp[var_idx] == ctx.m_binary_op_stamp_token)
      return;
    ctx.m_binary_op_stamp[var_idx] = ctx.m_binary_op_stamp_token;
  }

  // Calculate custom score based on constraint violation reduction
  double score = /* compute score */;
  double subscore = /* compute subscore for tie-breaking */;
  size_t age = std::max(shared.m_var_last_dec_step[var_idx],
                        shared.m_var_last_inc_step[var_idx]);

  // Update best candidate if this is better
  if (score > ctx.m_best_neighbor_score ||
      (score == ctx.m_best_neighbor_score && subscore > ctx.m_best_neighbor_subscore))
  {
    ctx.m_best_var_idx = var_idx;
    ctx.m_best_delta = delta;
    ctx.m_best_neighbor_score = score;
    ctx.m_best_neighbor_subscore = subscore;
    ctx.m_best_age = age;
  }
  // Random tie-break when both scores equal
  else if (score == ctx.m_best_neighbor_score &&
           subscore == ctx.m_best_neighbor_subscore)
  {
    auto* stats = static_cast<NeighborStats*>(user_data);
    auto& rng = stats ? stats->rng
                      : []() -> std::mt19937&
    {
      static thread_local std::mt19937 fallback(std::random_device{}());
      return fallback;
    }();
    if ((rng() & 1U) != 0)
    {
      ctx.m_best_var_idx = var_idx;
      ctx.m_best_delta = delta;
      ctx.m_best_neighbor_score = score;
      ctx.m_best_neighbor_subscore = subscore;
      ctx.m_best_age = age;
    }
  }
}
```

**Key Writable Fields:**

- `ctx.m_best_var_idx`, `ctx.m_best_delta`, `ctx.m_best_neighbor_score`,
  `ctx.m_best_neighbor_subscore`, `ctx.m_best_age`
- `ctx.m_binary_op_stamp` / `ctx.m_binary_op_stamp_token` for binary dedup

### Use Cases

- Progress bonus strategies
- Randomized tie-breaking for diversification
- Problem-specific scoring

---

## Lift Scoring

**Location:** `example/scoring-lift/`

Demonstrates custom scoring functions for the feasible phase (optimizing objective).

### Purpose

Customize how candidate operations are ranked when the current solution is feasible and we're optimizing.

### Key Features

- Objective-based scoring
- Variable degree tie-breaking
- Custom optimization criteria

### Code Snippet

```cpp
struct LiftStats { int total_lift_calls = 0; int degree_tie_breaks = 0; int score_improvements = 0; };

Local_Search::Lift_Scoring_Cbk lift_cbk = [](Scoring::Lift_Ctx& ctx, size_t var_idx, double delta, void* user_data)
{
  double lift_score = -ctx.m_shared.m_var_obj_cost[var_idx] * delta;
  size_t age = std::max(ctx.m_shared.m_var_last_dec_step[var_idx],
                        ctx.m_shared.m_var_last_inc_step[var_idx]);
  size_t degree = ctx.m_shared.m_model_manager.var(var_idx).term_num();

  auto* stats = static_cast<LiftStats*>(user_data);
  if (stats) stats->total_lift_calls++;

  bool should_update = false;

  if (ctx.m_best_lift_score + k_opt_tolerance < lift_score)
  {
    should_update = true;
    if (stats) stats->score_improvements++;
  }
  else if (ctx.m_best_lift_score <= lift_score)
  {
    if (ctx.m_best_var_idx == SIZE_MAX)
    {
      should_update = true;
    }
    else
    {
      size_t best_degree = ctx.m_shared.m_model_manager.var(ctx.m_best_var_idx).term_num();
      if (degree < best_degree)
      {
        should_update = true;
        if (stats) stats->degree_tie_breaks++;
      }
      else if (degree == best_degree && age < ctx.m_best_age)
      {
        should_update = true;
      }
    }
  }

  if (should_update)
  {
    ctx.m_best_var_idx = var_idx;
    ctx.m_best_delta = delta;
    ctx.m_best_lift_score = lift_score;
    ctx.m_best_age = age;
  }
};
```

### Use Cases

- Custom objective prioritization
- Tie-breaking strategies
- Problem-specific optimization

---

## Building All Examples

From the site repository root:

```bash
cd Local-MIP-2.0
./build.sh release   # or ./build.sh all
cd example
./prepare.sh
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

- **[Tutorials](/tutorials)** - Detailed callback reference and API documentation
- **[Papers](/papers)** - Academic publications describing the algorithms
- **[GitHub](https://github.com/shaowei-cai-group/Local-MIP)** - Source code and issues

---

[← Back to Home](/) | [Tutorials](/tutorials) | [Papers →](/papers)

  </div>
</div>
