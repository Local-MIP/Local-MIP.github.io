---
layout: default
title: Home
description: Local-MIP is an efficient local search solver for mixed integer programming.
keywords: MIP solver, mixed integer programming, local search, lift move operator, breakthrough move, mixed tight move, local feasible domain, dynamic weighting, MIPLIB, optimization solver
---

# Local-MIP

<div class="hero">
  <p style="font-size: 1.15em; margin: 0 0 0.4em;">Local-MIP is an efficient local search solver for mixed integer programming.</p>
  <div class="hero-actions">
    <a class="btn btn-primary" href="/quick-start">Quick Start</a>
    <a class="btn btn-primary" href="/download">Download</a>
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
    <a class="pill" href="/examples">Customizable Modules: Initialization, Restart Strategies, Neighbor Operators, Weighting Schemes, Scoring Functions</a>
  </div>
</div>

## Highlights

<div class="feature-grid">
  <div class="card">
    <h3>Rapid Optimization</h3>
    <p>Local-MIP delivers top-tier performance among open-source solvers on the general MIPLIB benchmark, capable of finding high-quality solutions within seconds.</p>
  </div>
  <div class="card">
    <h3>Highly Customizable</h3>
    <p>Featuring a comprehensive API and flexible callback system, Local-MIP empowers users to design and tailor algorithm modules for specific scenarios.</p>
  </div>
  <div class="card">
    <h3>Seamless Integration</h3>
    <p>Zero third-party dependencies. Local-MIP natively supports standard MPS and LP formats and can be easily integrated into other solvers as a component.</p>
  </div>
</div>

## Quick Start

Start from the project root directory (after extracting or cloning the repository).

1. **Download:** Grab the latest release from the [download page](/download).
2. **Build:** Compile using the provided script:

    ```bash
    ./build.sh release
    ```

3. **Run:** Solve your first instance:

    ```bash
    cd build
    ./Local-MIP -model_file ../test-set/2club200v15p5scn.mps --time_limit 300
    ```

[Full Quick Start →](/quick-start)

---

## Software using Local-MIP

Local-MIP is integrated into several state-of-the-art optimization tools:

### 1. NVIDIA cuOpt
**NVIDIA cuOpt** is a world-record-holding GPU-accelerated solver for route optimization and logistics. It utilizes Local-MIP to enhance its solving capabilities.
* **Official Site:** [NVIDIA cuOpt Product Page](https://www.nvidia.com/en-us/ai-data-science/products/cuopt/)
* **Reference:** For technical details, refer to the preprint *[arXiv:2510.20499](https://arxiv.org/abs/2510.20499)*.

### 2. Exact (PB Solver)
**Exact** is a leading Pseudo-Boolean (PB) solver. It integrates Local-MIP as a external component to boost performance in the PB Competition 2025.
* **Source Code:** [Exact on GitLab](https://gitlab.com/nonfiction-software/exact/-/tree/pb25/src/external/local-mip)
* **Reference:** See the solver description in *[Exact_PBComp_2025.pdf](https://www.cril.univ-artois.fr/PB25/descr/Exact_PBComp_2025.pdf)*.

---

## Documentation & Resources

- [Documentation](/documentation) — Core concepts, parameters, and callbacks.
- [Examples](/examples) — Basic usage and callback implementation walkthroughs.
- [Parameters Reference](/documentation#parameters-reference) — A complete list of command-line flags.
- [MIPLIB Records](/miplib-records) and [Papers](/papers) — Performance benchmarks and academic publications.

---

**Latest Release:** v2.0 | **License:** [MIT License](https://github.com/shaowei-cai-group/Local-MIP/blob/main/LICENSE)