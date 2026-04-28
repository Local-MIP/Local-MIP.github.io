---
layout: default
title: Software
description: Download, install, verify, and cite Local-MIP software releases, source code, and Python bindings.
keywords: Local-MIP software, MIP solver download, localmip PyPI, Local-MIP releases, C++20 MIP solver, Python bindings
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Software navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#latest-release">Release Channels</a></li>
      <li><a href="#installation-methods">Install Paths</a></li>
      <li><a href="#whats-included">What's Included</a></li>
      <li><a href="#system-requirements">Requirements</a></li>
      <li><a href="#version-history">Version Notes</a></li>
      <li><a href="#verification">Verification</a></li>
      <li><a href="#license-support">License & Help</a></li>
    </ul>
  </nav>

  <div class="doc-content software-content">
    <section class="software-hero">
      <div class="software-hero-copy">
        <p class="software-kicker">Software</p>
        <h1>Get Local-MIP</h1>
        <p>Use the published Python bindings through a local virtual environment, or download the source tree when you need the CLI solver, C++ API, examples, callbacks, or reproducible archived versions.</p>
        <div class="software-hero-actions">
          <a class="btn btn-primary" href="{{ site.data.external_links.repository.pypi }}">PyPI Package</a>
          <a class="btn btn-secondary" href="{{ site.data.external_links.repository.releases }}">GitHub Releases</a>
          <a class="btn btn-ghost" href="{{ site.data.external_links.repository.home }}">Source Code</a>
        </div>
      </div>

      <aside class="software-command-panel" aria-label="Fast install command">
        <span>Fastest path</span>
        <h2>Python bindings</h2>
        <div class="software-copy-command">
          <code>python3 -m venv .venv && .venv/bin/python -m pip install localmip</code>
          <button type="button" data-copy-text="python3 -m venv .venv && .venv/bin/python -m pip install localmip" aria-label="Copy pip install command">Copy</button>
        </div>
        <p>Documented for Linux x86_64 with Python 3.8+. Uses <code>venv</code> to avoid externally managed system Python installs.</p>
      </aside>
    </section>

    <section id="latest-release" class="software-panel">
      <div class="software-section-heading">
        <span>Release Channels</span>
        <h2>Choose the source that matches your workflow</h2>
      </div>

      <div class="software-channel-grid">
        <article class="software-channel-card software-channel-primary">
          <div class="card-kicker">Python</div>
          <h3>PyPI package</h3>
          <p>Install the published Python bindings in a local virtual environment when you want the shortest path to importing <code>localmip_py</code>.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.pypi }}">Open PyPI</a>
            <a href="{{ site.data.external_links.repository.python_readme }}">Python README</a>
          </div>
        </article>

        <article class="software-channel-card">
          <div class="card-kicker">Tagged source</div>
          <h3>GitHub Releases</h3>
          <p>Use tagged archives and release notes when you need a stable source snapshot.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.releases }}">View Releases</a>
          </div>
        </article>

        <article class="software-channel-card">
          <div class="card-kicker">Development</div>
          <h3>Repository</h3>
          <p>Clone or browse the main repository when you need the current development tree and full project history.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.home }}">Browse Source</a>
            <a href="{{ site.data.external_links.repository.readme }}">Solver README</a>
          </div>
        </article>
      </div>
    </section>

    <section id="installation-methods" class="software-panel software-install-panel">
      <div class="software-section-heading">
        <span>Install Paths</span>
        <h2>Three practical entry points</h2>
      </div>

      <div class="software-path-grid">
        <article class="software-path-card">
          <div class="software-path-number">01</div>
          <h3>Install Python bindings</h3>
          <p>For Linux x86_64, create a local virtual environment, install from PyPI, and import the module with the same interpreter.</p>
          <pre><code class="language-bash">python3 -m venv .venv && .venv/bin/python -m pip install localmip
.venv/bin/python -c "import localmip_py as lm; print(lm.LocalMIP)"</code></pre>
        </article>

        <article class="software-path-card">
          <div class="software-path-number">02</div>
          <h3>Build the CLI solver</h3>
          <p>From the repository root, the release build writes the binary and static library under <code>build/</code>.</p>
          <pre><code class="language-bash">./build.sh release</code></pre>
        </article>

        <article class="software-path-card">
          <div class="software-path-number">03</div>
          <h3>Build everything</h3>
          <p>Use the full build when you also need examples and the local pybind11 module.</p>
          <pre><code class="language-bash">./build.sh all</code></pre>
        </article>
      </div>

      <p class="software-note">For runnable first commands and a 10-second smoke test, use the <a href="/quick-start">Quick Start</a>.</p>
    </section>

    <section id="whats-included" class="software-panel">
      <div class="software-section-heading">
        <span>Distribution Contents</span>
        <h2>What the current source tree provides</h2>
      </div>

      <div class="software-included-grid">
        <div><span>CLI</span><strong><code>build/Local-MIP</code></strong><p>Standalone solver binary for file-based runs.</p></div>
        <div><span>C++</span><strong><code>build/libLocalMIP.a</code></strong><p>Static library with headers under <code>src/</code>.</p></div>
        <div><span>Python</span><strong><code>localmip_py</code></strong><p>pybind11 bindings with result queries, parameter files, and modeling support.</p></div>
        <div><span>Examples</span><strong><code>example/</code></strong><p>C++ API demos for simple usage, model building, callbacks, and custom search components.</p></div>
        <div><span>Tests</span><strong><code>tests/</code></strong><p>CTest targets for unit, integration, and instance-driven checks.</p></div>
        <div><span>Data</span><strong><code>test-set/</code></strong><p>Bundled sample <code>.mps</code> and <code>.lp</code> instances for demos and smoke tests.</p></div>
      </div>
    </section>

    <section id="system-requirements" class="software-panel software-requirements-panel">
      <div class="software-section-heading">
        <span>Requirements</span>
        <h2>Keep the environment explicit</h2>
      </div>

      <div class="software-requirement-grid">
        <article>
          <span>PyPI path</span>
          <h3>Python 3.8+ on Linux x86_64</h3>
          <p>The package metadata requires Python 3.8+ and is documented for Linux x86_64. On Debian/Ubuntu, use a virtual environment rather than installing into the system Python.</p>
        </article>
        <article>
          <span>Source builds</span>
          <h3>CMake 3.15+ and C++20</h3>
          <p>The source tree requires CMake 3.15 or later and a C++20-compatible GCC or Clang toolchain.</p>
        </article>
        <article>
          <span>Build tools</span>
          <h3>bash, make, POSIX utilities</h3>
          <p>The repository build scripts use standard shell tooling and write generated artifacts under <code>build/</code>.</p>
        </article>
      </div>
    </section>

    <section id="version-history" class="software-panel software-version-panel">
      <div class="software-section-heading">
        <span>Version Notes</span>
        <h2>Use the right snapshot for the right purpose</h2>
      </div>

      <div class="software-version-grid">
        <article>
          <span>Software snapshots</span>
          <h3>Releases and main repository</h3>
          <p>Use GitHub Releases for tagged source archives, or the repository for the current development tree.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.releases }}">GitHub Releases</a>
            <a href="{{ site.data.external_links.repository.home }}">Repository</a>
          </div>
        </article>

        <article id="previous-versions">
          <span>Paper reproduction</span>
          <h3>Local-MIP 1.0 archive</h3>
          <p>The experimental results reported in the CP 2024 and Artificial Intelligence 2025 papers were obtained using Local-MIP 1.0.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.archive_v1_0_1 }}">Archived v1.0.1</a>
            <a href="/papers">Papers</a>
          </div>
        </article>
      </div>
    </section>

    <section id="verification" class="software-panel software-verify-panel">
      <div class="software-section-heading">
        <span>Verification</span>
        <h2>Check the install before moving on</h2>
      </div>

      <div class="software-verify-grid">
        <article>
          <h3>Python import check</h3>
          <pre><code class="language-bash">.venv/bin/python -c "import localmip_py as lm; print(lm.LocalMIP)"</code></pre>
        </article>
        <article>
          <h3>Source build smoke test</h3>
          <p>Use the Quick Start for a verified 10-second CLI run on a bundled instance.</p>
          <div class="software-card-links">
            <a href="/quick-start">Open Quick Start</a>
            <a href="{{ site.data.external_links.repository.readme }}">Solver README</a>
          </div>
        </article>
      </div>
    </section>

    <section id="license-support" class="software-panel software-support-panel">
      <div class="software-section-heading">
        <span>License & Help</span>
        <h2>Open source, permissive, and inspectable</h2>
      </div>

      <div class="software-support-grid">
        <article id="license">
          <div class="card-kicker">License</div>
          <h3>MIT License</h3>
          <p>Local-MIP is released under the MIT License.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.license }}">View License</a>
          </div>
        </article>

        <article id="getting-help">
          <div class="card-kicker">Support</div>
          <h3>Issues and documentation</h3>
          <p>Use GitHub Issues for bugs or feature requests, and the documentation pages for setup and examples.</p>
          <div class="software-card-links">
            <a href="{{ site.data.external_links.repository.issues }}">GitHub Issues</a>
            <a href="/tutorials">Tutorials</a>
            <a href="/examples">Examples</a>
          </div>
        </article>
      </div>
    </section>

    <nav class="software-page-nav" aria-label="Software page navigation">
      <a href="/"><span>Previous</span><strong>Home</strong></a>
      <a href="/quick-start"><span>Next</span><strong>Quick Start</strong></a>
    </nav>
  </div>
</div>
