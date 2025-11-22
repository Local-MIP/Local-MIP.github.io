---
layout: default
title: Home
description: Local-MIP is an efficient local search solver for mixed integer programming.
keywords: MIP solver, mixed integer programming, local search, lift move operator, breakthrough move, mixed tight move, local feasible domain, dynamic weighting, MIPLIB, optimization solver
---

# Local-MIP

<div class="hero">
  <p class="hero-tagline">An efficient local search solver for mixed integer programming</p>

  <div class="hero-actions">
    <a class="btn btn-primary" href="/quick-start">Quick Start</a>
    <a class="btn btn-primary" href="/software">Software</a>
    <a class="btn btn-primary" href="https://github.com/shaowei-cai-group/Local-MIP">Source Code</a>
    <a class="btn btn-primary" href="/tutorials">Tutorials</a>
    <a class="btn btn-primary" href="/examples">Examples</a>
  </div>

  <div class="hero-section">
    <h4 class="hero-section-title"></h4>
    <div class="hero-links">
      <a class="hero-link" href="https://lcs.ios.ac.cn/~caisw/">
        <span class="hero-link-badge">Project Leader</span>
        <span class="hero-link-text">Shaowei Cai</span>
      </a>
      <a class="hero-link" href="https://linpeng0105.github.io/">
        <span class="hero-link-badge">Developer</span>
        <span class="hero-link-text">Peng Lin</span>
      </a>
    </div>
  </div>

  <div class="hero-section">
    <h4 class="hero-section-title"></h4>
    <div class="hero-links">
      <a class="hero-link" href="assets/pdf/best-paper.pdf">
        <span class="hero-link-badge">🏆 CP 2024 Best Paper Award</span>
        <span class="hero-link-text">Peng Lin, Mengchuan Zou, Shaowei Cai</span>
      </a>
      <a class="hero-link" href="https://www.sciencedirect.com/science/article/abs/pii/S0004370225001249?via%3Dihub">
        <span class="hero-link-badge">📄 Artificial Intelligence 2025</span>
        <span class="hero-link-text">Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin</span>
      </a>
    </div>
  </div>

  <div class="hero-section">
    <h4 class="hero-section-title">Customizable Modules</h4>
    <div class="hero-tags">
      <span class="hero-tag">Initialization</span>
      <span class="hero-tag">Restart Strategies</span>
      <span class="hero-tag">Neighbor Operators</span>
      <span class="hero-tag">Weighting Schemes</span>
      <span class="hero-tag">Scoring Functions</span>
    </div>
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
    <p>Zero third-party dependencies. Local-MIP natively supports standard MPS and LP formats and can be easily integrated into other solvers via C++ or Python interfaces.</p>
  </div>
</div>

## Quick Start

Start from the project root directory (after extracting or cloning the repository).

1. **Software:** Grab the latest release from the [software page](/software).
2. **Build:** Compile using the provided script:

    ```bash
    ./build.sh release
    ```

3. **Run:** Solve your first instance:

    ```bash
    cd build
    ./Local-MIP --model_file ../test-set/2club200v15p5scn.mps --time_limit 300
    ```

[Full Quick Start →](/quick-start)

---

## Software using Local-MIP

Local-MIP is integrated into several state-of-the-art optimization tools:

### 1. NVIDIA cuOpt
**NVIDIA cuOpt** is a GPU-accelerated solver.
* **Official Site:** [NVIDIA cuOpt Product Page](https://www.nvidia.com/en-us/ai-data-science/products/cuopt/)
* **Reference:** For technical details, refer to the preprint *[arXiv:2510.20499](https://arxiv.org/abs/2510.20499)*.

### 2. Exact
**Exact** is a leading Pseudo-Boolean (PB) solver.
* **Source Code:** [Exact on GitLab](https://gitlab.com/nonfiction-software/exact/-/tree/pb25/src/external/local-mip)
* **Reference:** See the solver description in *[Exact_PBComp_2025.pdf](https://www.cril.univ-artois.fr/PB25/descr/Exact_PBComp_2025.pdf)*.

---

## Documentation & Resources

### Getting Started
- [Quick Start](/quick-start) — Get up and running in 3 steps: download, build, and solve.
- [Software](/software) — Access the latest source code and release versions.

### Technical Documentation
- [Tutorials](/tutorials) — Comprehensive guides and technical references.
  - [Command-Line Usage](/tutorials#command-line-usage) — Installation, CLI usage, and library integration.
  - [Parameters Reference](/tutorials#parameters-reference) — A complete list of command-line flags and options.
  - [Callback System](/tutorials#callback-system) — Detailed guide on customizing solver behavior.
- [Examples](/examples) — Practical code examples and callback implementation walkthroughs.

### Performance & Research
- [MIPLIB Records](/miplib-records) — New best-found solutions for the MIPLIB open instances.
- [Papers](/papers) — Academic publications and research background.

---

**Latest Release:** v2.0 | **License:** [MIT License](https://github.com/shaowei-cai-group/Local-MIP/blob/main/LICENSE)
