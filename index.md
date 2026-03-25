---
layout: default
title: Home
description: Local-MIP is an open-source local search library for mixed integer programming.
keywords: MIP solver, mixed integer programming, local search, lift move operator, breakthrough move, mixed tight move, local feasible domain, dynamic weighting, MIPLIB, optimization solver
---

# Local-MIP

<div class="hero">
  <p class="hero-tagline">Open-Source Local Search for Mixed Integer Programming</p>

  <div class="hero-actions">
    <a class="btn btn-primary" href="/quick-start">Quick Start</a>
    <a class="btn btn-primary" href="/software">Software</a>
    <a class="btn btn-primary" href="{{ site.data.external_links.repository.home }}">Source Code</a>
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
    <h3>Fast Feasible Solutions</h3>
    <p>Local-MIP is designed to find high-quality feasible solutions quickly, especially under short time budgets.</p>
  </div>
  <div class="card">
    <h3>Flexible APIs and Callbacks</h3>
    <p>C++ and Python APIs support file-based solving, in-memory modeling, and callback-based customization of the search.</p>
  </div>
  <div class="card">
    <h3>Ready to Embed</h3>
    <p>Use Local-MIP as a standalone solver or integrate it into larger systems as a warm-start primal heuristic.</p>
  </div>
</div>

## Quick Start

<div class="feature-grid">
  <div class="card">
    <div class="card-kicker">Step 1</div>
    <h3>Get the Code</h3>
    <p>Start with a release archive, the source repository, or an archived version for paper reproduction.</p>
    <div class="card-links">
      <a href="/software">Open Software →</a>
    </div>
  </div>
  <div class="card">
    <div class="card-kicker">Step 2</div>
    <h3>Choose a Path</h3>
    <p>Use Local-MIP from the command line, embed it from C++, call it from Python, or customize the search with callbacks.</p>
    <div class="card-links">
      <a href="/tutorials">Browse Tutorials →</a>
    </div>
  </div>
  <div class="card">
    <div class="card-kicker">Step 3</div>
    <h3>Build and Run</h3>
    <p>Use the <a href="{{ site.data.external_links.repository.readme }}">solver README</a> for the core workflow and the <a href="{{ site.data.external_links.repository.python_readme }}">Python bindings README</a> for Python setup and demos.</p>
    <div class="card-links">
      <a href="/quick-start">Full Quick Start →</a>
    </div>
  </div>
</div>

---

## Software using Local-MIP

<div class="feature-grid">
  <div class="card">
    <div class="card-kicker">Integrated Solver</div>
    <h3>NVIDIA cuOpt</h3>
    <p>cuOpt uses Local-MIP as part of its GPU-accelerated optimization stack.</p>
    <div class="card-links">
      <a href="https://www.nvidia.com/en-us/ai-data-science/products/cuopt/">Official Site</a>
      <a href="https://arxiv.org/abs/2510.20499">Technical Reference</a>
    </div>
  </div>
  <div class="card">
    <div class="card-kicker">Integrated Solver</div>
    <h3>Exact</h3>
    <p>Exact includes Local-MIP in its pseudo-Boolean solving workflow.</p>
    <div class="card-links">
      <a href="https://gitlab.com/nonfiction-software/exact/-/tree/pb25/src/external/local-mip">Source Code</a>
      <a href="https://www.cril.univ-artois.fr/PB25/descr/Exact_PBComp_2025.pdf">Solver Description</a>
    </div>
  </div>
</div>

---

## Documentation & Resources

<div class="feature-grid">
  <div class="card">
    <div class="card-kicker">Start Here</div>
    <h3>Getting Started</h3>
    <p>Use these pages when you want the shortest path from downloading Local-MIP to a first successful run.</p>
    <div class="card-links">
      <a href="/quick-start">Quick Start</a>
      <a href="/software">Software</a>
    </div>
  </div>
  <div class="card">
    <div class="card-kicker">Interfaces</div>
    <h3>Technical Documentation</h3>
    <p>Learn the main interfaces for file-based solving, in-memory modeling, parameter control, and callback customization.</p>
    <div class="card-links">
      <a href="/tutorials">Tutorials</a>
      <a href="/tutorials#command-line-usage">Command-Line Usage</a>
      <a href="/tutorials#modeling-api">Modeling API</a>
      <a href="/tutorials#parameters-reference">Parameters Reference</a>
      <a href="/tutorials#callback-system">Callback System</a>
      <a href="/examples">Examples</a>
    </div>
  </div>
  <div class="card">
    <div class="card-kicker">Results</div>
    <h3>Performance and Research</h3>
    <p>See benchmark records, research papers, and the broader context behind Local-MIP.</p>
    <div class="card-links">
      <a href="/miplib-records">MIPLIB Records</a>
      <a href="/papers">Papers</a>
    </div>
  </div>
</div>

---

**Latest Release:** [GitHub Releases]({{ site.data.external_links.repository.releases }}) | **License:** [MIT License]({{ site.data.external_links.repository.license }})
