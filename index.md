---
layout: default
title: Home
description: LLocal-MIP is an efficient local search solver for mixed integer programming.
keywords: MIP solver, mixed integer programming, local search, lift move operator, breakthrough move, mixed tight move, local feasible domain, dynamic weighting, MIPLIB, optimization solver
---

# Local-MIP

<div class="hero">
  <p style="font-size: 1.15em; margin: 0 0 0.4em;">Local-MIP is an efficient local search solver for mixed integer programming.</p>
  <div class="hero-actions">
    <a class="btn btn-primary" href="/quick-start">Quick Start</a>
    <a class="btn btn-primary" href="/download">Download Software</a>
    <a class="btn btn-primary" href="https://github.com/shaowei-cai-group/Local-MIP">Source Code</a>
    <a class="btn btn-primary" href="/documentation">Tutorials</a>
    <a class="btn btn-primary" href="/examples">Customization Examples</a>
  </div>
  <div class="stat-grid">
    <a class="pill" href="assets/pdf/best-paper.pdf">CP 2024 Best Paper</a>
    <a class="pill" href="https://www.sciencedirect.com/science/article/abs/pii/S0004370225001249?via%3Dihub">AIJ 2025</a>
  </div>
  <div class="stat-grid">
    <a class="pill" href="https://lcs.ios.ac.cn/~caisw/">Project Leader: Shaowei Cai</a>
    <a class="pill" href="https://linpeng0105.github.io/">Developer: Peng Lin</a>
  </div>
    <div class="stat-grid">
    <a class="pill" href="/examples">Customizable modules: Start, Restart, Neighbor Operators, Weighting Scheme, Scoring Functions</a>
  </div>
</div>

## Highlights

<div class="feature-grid">
  <div class="card">
    <h3>Fast Optimization</h3>
    <p>On the general benchmark MIPLIB, Local-MIP achieves top-tier performance among open-source solvers with second-level fast optimization capability</p>
  </div>
  <div class="card">
    <h3>Highly Customizable</h3>
    <p>Local-MIP provides rich APIs and callback functions, enabling users to design custom algorithm modules for their specific scenarios</p>
  </div>
  <div class="card">
    <h3>Independent and Easy Integration</h3>
    <p>No third-party dependencies. Accepts standard MPS and LP format files, and can be easily integrated into other solvers</p>
  </div>
</div>

## Quick Start

Work from the solver root (after extracting or cloning the repository).

1. **Download:** Grab the latest release from the [download page](/download).
2. **Build:** Compile with the provided script:

    ```bash
    ./build.sh release
    ```

3. **Run:** Solve your first instance:

    ```bash
    cd build
    ./Local-MIP -model_file ../test-set/2club200v15p5scn.mps --time_limit 300
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
