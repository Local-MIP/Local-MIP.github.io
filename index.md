---
layout: default
title: Home
description: Local-MIP is an open-source local search solver for mixed integer programming.
keywords: MIP solver, mixed integer programming, local search, lift move operator, breakthrough move, mixed tight move, local feasible domain, dynamic weighting, MIPLIB, optimization solver
---

<div class="hero">
  <div class="hero-main">
    <div class="hero-logo-panel" aria-hidden="true">
      <img src="{{ '/assets/images/localmip.png' | relative_url }}" alt="" class="hero-logo">
    </div>

    <div class="hero-intro">
      <p class="hero-eyebrow">Open-source MIP solver</p>
      <h1 class="hero-title">Local-MIP</h1>
      <p class="hero-tagline">Local search for mixed integer programming.</p>
      <p class="hero-copy">CLI, C++/Python APIs, and callbacks for custom search workflows.</p>

      <div class="hero-actions">
        <a class="btn btn-primary" href="/quick-start">Quick Start</a>
        <a class="btn btn-secondary" href="/software">Software</a>
        <a class="btn btn-secondary" href="{{ site.data.external_links.repository.home }}">Source Code</a>
        <a class="btn btn-ghost" href="/tutorials">Tutorials</a>
        <a class="btn btn-ghost" href="/examples">Examples</a>
      </div>

      <div class="hero-people">
        <a href="https://lcs.ios.ac.cn/~caisw/"><span>Project Leader</span><strong>Shaowei Cai</strong></a>
        <a href="https://linpeng0105.github.io/"><span>Developer</span><strong>Peng Lin</strong></a>
      </div>
    </div>
  </div>

  <div class="hero-proof-grid">
    <a class="hero-proof" href="assets/pdf/best-paper.pdf">
      <span>CP 2024 Best Paper Award</span>
      <strong>Peng Lin, Mengchuan Zou, Shaowei Cai</strong>
    </a>
    <a class="hero-proof" href="https://www.sciencedirect.com/science/article/abs/pii/S0004370225001249?via%3Dihub">
      <span>Artificial Intelligence 2025</span>
      <strong>Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin</strong>
    </a>
  </div>

  <div class="hero-modules">
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
    <h3>High-Quality Feasible Solutions</h3>
    <p>Local-MIP targets rapid discovery of high-quality feasible solutions, especially under short time budgets.</p>
  </div>
  <div class="card">
    <h3>Extensible APIs and Callbacks</h3>
    <p>C++ and Python APIs support file-based solving, in-memory modeling, and callback-based customization.</p>
  </div>
  <div class="card">
    <h3>Ready to Embed</h3>
    <p>Use Local-MIP as a standalone solver or integrate it as a warm-start primal heuristic.</p>
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

<div class="resource-grid">
  <div class="resource-card resource-card-start">
    <div class="card-kicker">Start Here</div>
    <h3>Getting Started</h3>
    <p>Install, build, and run Local-MIP with the shortest path to a first successful solve.</p>
    <div class="resource-links">
      <a href="/quick-start">Quick Start</a>
      <a href="/software">Software</a>
    </div>
  </div>

  <div class="resource-card resource-card-docs">
    <div class="card-kicker">Interfaces</div>
    <h3>Technical Documentation</h3>
    <p>Use the main interfaces for CLI solving, in-memory modeling, parameters, callbacks, and examples.</p>
    <div class="resource-links resource-links-grid">
      <a href="/tutorials">Tutorials</a>
      <a href="/tutorials#command-line-usage">Command Line</a>
      <a href="/tutorials#modeling-api">Modeling API</a>
      <a href="/tutorials#parameters-reference">Parameters</a>
      <a href="/tutorials#callback-system">Callbacks</a>
      <a href="/examples">Examples</a>
    </div>
  </div>

  <div class="resource-card resource-card-results">
    <div class="card-kicker">Results</div>
    <h3>Performance and Research</h3>
    <p>Benchmark records, research papers, and the broader context behind Local-MIP.</p>
    <div class="resource-links">
      <a href="/miplib-records">MIPLIB Records</a>
      <a href="/papers">Papers</a>
    </div>
  </div>
</div>

<div class="release-meta">
  <a href="{{ site.data.external_links.repository.releases }}"><span>Latest Release</span><strong>GitHub Releases</strong></a>
  <a href="{{ site.data.external_links.repository.license }}"><span>License</span><strong>MIT License</strong></a>
</div>
