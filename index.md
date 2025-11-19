---
layout: default
title: Home
description: Local-MIP is a local-search solver for mixed integer programming with a lightweight CLI, focused C++ API, and pybind11 bindings.
keywords: MIP求解器, 混合整数规划, 局部搜索算法, C++优化库, pybind11, MIPLIB, 整数规划求解, Local-MIP, optimization solver
---

# Local-MIP

<div class="hero">
  <p style="font-size: 1.15em; margin: 0 0 0.4em;">local search solver for mixed integer programming with a lightweight CLI, focused C++ API, and pybind11 bindings.</p>
  <div class="hero-actions">
    <a class="btn btn-primary" href="/quick-start">Quick Start</a>
    <a class="btn btn-primary" href="/download">Download</a>
    <a class="btn btn-primary" href="https://github.com/shaowei-cai-group/Local-MIP">GitHub</a>
  </div>
  <div class="stat-grid">
    <span class="pill">CP 2024 Best Paper</span>
    <span class="pill">C++20</span>
    <span class="pill">Callback-friendly API</span>
    <span class="pill">10 MIPLIB records</span>
  </div>
</div>

## What is Local-MIP?

Local-MIP is a local-search solver for mixed integer programming with an emphasis on customization. Use it as a self-contained command-line solver or embed it as a static library to control starts, restarts, weights, neighborhoods, and scoring functions.

## Highlights

<div class="feature-grid">
  <div class="card">
    <h3>Lean CLI</h3>
    <p>Ship a single binary for MPS/LP solving with sensible defaults and composable flags.</p>
    <code>./Local-MIP -i model.mps -t 300 -b 1 -l 1</code>
  </div>
  <div class="card">
    <h3>Callback System</h3>
    <p>Register start, restart, weight, neighbor, and scoring callbacks to tailor search behavior.</p>
  </div>
  <div class="card">
    <h3>Bindings &amp; API</h3>
    <p>pybind11 bindings and a focused C++ API keep integration straightforward.</p>
  </div>
</div>

## Get Started Fast

Work from the solver root (after extracting or cloning the repository).

1. **Download:** Grab the latest release from the [download page](/download).
2. **Build:** Compile with the provided script:

    ```bash
    ./build.sh release
    ```

3. **Run:** Solve your first instance:

    ```bash
    cd build
    ./Local-MIP -i ../test-set/2club200v15p5scn.mps -t 300 -b 1 -l 1
    ```

[Full Quick Start →](/quick-start)

## Documentation & Resources

- [Documentation](/documentation) — concepts, parameters, and callbacks.
- [Examples](/examples) — basic usage and callback walk-throughs.
- [Parameters Reference](/documentation#parameters-reference) — complete flag listing.
- [MIPLIB Records](/miplib-records) and [Papers](/papers) — performance and publications.

## Recognition & Citation

- CP 2024 Best Paper Award.
- 10 new records on the MIPLIB benchmark suite.
- Cite: **Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin.** *Local-MIP: Efficient local search for mixed integer programming.* Artificial Intelligence, 348 (2025), 104405. See [papers](/papers) for details.

---

**Latest Release:** v2.0 | **License:** [MIT License](https://github.com/shaowei-cai-group/Local-MIP/blob/main/LICENSE)
