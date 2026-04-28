---
layout: default
title: Quick Start
description: Install and run Local-MIP, a local-search solver for mixed integer programming with CLI and C++/Python APIs.
keywords: Local-MIP installation, MIP solver tutorial, local search, MIP, C++20, CMake, MPS, LP, callbacks, API
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Quick start navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#fastest-path-python">Pip Install</a></li>
      <li><a href="#requirements">Requirements</a></li>
      <li><a href="#get-started-in-3-steps">Get Started</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#step-1-download-and-extract">Download</a></li>
          <li><a href="#step-2-build">Build</a></li>
          <li><a href="#step-3-run">Run</a></li>
        </ul>
      </li>
      <li><a href="#basic-usage">Basic Usage</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#command-line-parameters">Command-Line</a></li>
          <li><a href="#using-a-parameter-configuration-file">Parameter File</a></li>
        </ul>
      </li>
      <li><a href="#next-steps">Next Steps</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#explore-more">Explore More</a></li>
          <li><a href="#use-as-a-library">Use as a Library</a></li>
          <li><a href="#run-tests">Run Tests</a></li>
        </ul>
      </li>
      <li><a href="#troubleshooting">Troubleshooting</a></li>
      <li><a href="#getting-help">Getting Help</a></li>
    </ul>
  </nav>

  <div class="doc-content quickstart-content" markdown="1">
<section class="quickstart-hero">
  <div>
    <p class="quickstart-kicker">Quick Start</p>
    <h1>Run Local-MIP</h1>
    <p>Install the Python bindings in one line, or build the CLI solver from source when you need a local binary, C++ APIs, examples, or callbacks.</p>
  </div>
  <div class="quickstart-hero-links">
    <a href="{{ site.data.external_links.repository.pypi }}">PyPI Package</a>
    <a href="{{ site.data.external_links.repository.releases }}">GitHub Releases</a>
    <a href="{{ site.data.external_links.repository.readme }}">Solver README</a>
    <a href="{{ site.data.external_links.repository.python_readme }}">Python README</a>
  </div>
</section>

<section id="fastest-path-python" class="quickstart-panel quickstart-pip-panel">
  <div class="quickstart-section-heading">
    <span>Fastest Path</span>
    <h2>Install with pip</h2>
  </div>
  <p class="quickstart-panel-intro">For Linux x86_64, the published Python bindings are the quickest way to try Local-MIP.</p>
  <div class="quickstart-pip-grid">
    <article class="quickstart-pip-card">
      <span>Install</span>
      <pre><code class="language-bash">python3 -m pip install localmip</code></pre>
    </article>
    <article class="quickstart-pip-card">
      <span>Import check</span>
      <pre><code class="language-bash">python3 -c "import localmip_py as lm; print(lm.LocalMIP)"</code></pre>
    </article>
  </div>
  <p class="quickstart-note">Use the source build below when you need the standalone <code>Local-MIP</code> CLI, the static C++ library, or the repository examples.</p>
</section>

<section id="requirements" class="quickstart-panel">
  <div class="quickstart-section-heading">
    <span>Before Source Builds</span>
    <h2>Requirements</h2>
  </div>
  <p class="quickstart-panel-intro">The source CLI path needs the build tools below. The PyPI path above only needs Python 3.8+ on Linux x86_64.</p>
  <div class="quickstart-requirements">
    <div class="quickstart-requirement"><span>CMake</span><strong>3.15+</strong></div>
    <div class="quickstart-requirement"><span>Compiler</span><strong>C++20 GCC/Clang</strong></div>
    <div class="quickstart-requirement"><span>Tools</span><strong>bash, make, POSIX utilities</strong></div>
  </div>
</section>

<section id="get-started-in-3-steps" class="quickstart-panel">
  <div class="quickstart-section-heading">
    <span>Source CLI Path</span>
    <h2>Build and Run in 3 Steps</h2>
  </div>
  <p class="quickstart-panel-intro">These commands were verified against the current solver tree and keep the first run to 10 seconds.</p>

  <div class="quickstart-steps">
    <article id="step-1-download-and-extract" class="quickstart-step-card">
      <div class="card-kicker">Step 1</div>
      <h3>Download</h3>
      <p>Use a tagged source archive for a stable snapshot, or clone the repository for the latest development version.</p>
      <div class="quickstart-link-row">
        <a href="{{ site.data.external_links.repository.releases }}">GitHub Releases</a>
        <a href="{{ site.data.external_links.repository.home }}">Repository</a>
      </div>
    </article>

    <article id="step-2-build" class="quickstart-step-card">
      <div class="card-kicker">Step 2</div>
      <h3>Build</h3>
      <p>From the repository root, start with the release build. Use <code>./build.sh all</code> when you also need examples and Python bindings.</p>
    </article>

    <article id="step-3-run" class="quickstart-step-card">
      <div class="card-kicker">Step 3</div>
      <h3>Run</h3>
      <p>Run from <code>build/</code> so bundled test-set paths resolve correctly.</p>
    </article>
  </div>

  <div class="quickstart-command-strip">
    <div>
      <span>Build</span>
      <pre><code class="language-bash">./build.sh release</code></pre>
    </div>
    <div>
      <span>Run</span>
      <pre><code class="language-bash">cd build
./Local-MIP -i ../test-set/2club200v15p5scn.mps -t 10</code></pre>
    </div>
  </div>

  <p class="quickstart-note">The build writes the solver binary and static library under <code>build/</code>. Use <code>./Local-MIP --help</code> for the exact CLI flags in your version.</p>
</section>

<section id="basic-usage" class="quickstart-panel quickstart-usage-panel">
  <div class="quickstart-section-heading">
    <span>Basic Usage</span>
    <h2>Command-Line Parameters</h2>
  </div>

  <p>A representative CLI invocation looks like this:</p>
  <pre><code class="language-bash">./Local-MIP --model_file &lt;model_file&gt; [options]</code></pre>
  <p>CLI flags support both short and long forms, for example <code>-i</code> and <code>--model_file</code>.</p>

  <div id="command-line-parameters" class="quickstart-table-note">Representative options from the current CLI:</div>
  <div class="table-wrapper">
    <table>
      <thead>
        <tr>
          <th>Flag</th>
          <th>Parameter</th>
          <th>Description</th>
          <th>Default</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>-i</code></td>
          <td><code>model_file</code></td>
          <td>Path to input model file (.mps/.lp)</td>
          <td>Required</td>
        </tr>
        <tr>
          <td><code>-t</code></td>
          <td><code>time_limit</code></td>
          <td>Time limit in seconds</td>
          <td>10</td>
        </tr>
        <tr>
          <td><code>-s</code></td>
          <td><code>sol_path</code></td>
          <td>Path to output solution file (.sol)</td>
          <td><code>""</code></td>
        </tr>
        <tr>
          <td><code>-l</code></td>
          <td><code>log_obj</code></td>
          <td>Log objective values during search</td>
          <td>1</td>
        </tr>
        <tr>
          <td><code>-S</code></td>
          <td><code>random_seed</code></td>
          <td>Random seed (0 uses default)</td>
          <td>0</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="quickstart-subheading">Example</div>
  <pre><code class="language-bash"># Solve the bundled sample for 10 seconds and save a solution
cd build
./Local-MIP --model_file ../test-set/2club200v15p5scn.mps --time_limit 10 --sol_path quickstart.sol --log_obj 1</code></pre>

  <div id="using-a-parameter-configuration-file" class="quickstart-subheading">Using a Parameter Configuration File</div>
  <p>Instead of passing all parameters via command line, you can use a configuration file:</p>
  <pre><code class="language-bash">cd build
./Local-MIP --param_set_file ../default.set --model_file ../test-set/2club200v15p5scn.mps</code></pre>
  <p>The repository includes <code>default.set</code> as a template with all available parameters and their default values. Its default time limit is 10 seconds.</p>

  <div class="quickstart-format-list">
    <span>Configuration file format</span>
    <ul>
      <li>One parameter per line: <code>parameter_name = value</code></li>
      <li>Lines starting with <code>#</code> or <code>;</code> are comments</li>
      <li>Command-line arguments override values from the configuration file</li>
    </ul>
  </div>

</section>

<section id="next-steps" class="quickstart-panel">
  <div class="quickstart-section-heading">
    <span>After the First Run</span>
    <h2>Next Steps</h2>
  </div>

  <div class="quickstart-next-grid">
    <article id="explore-more" class="quickstart-next-card">
      <div class="card-kicker">Explore More</div>
      <h3>Docs and examples</h3>
      <p>Use the website pages for releases, tutorials, and runnable examples.</p>
      <div class="quickstart-link-row">
        <a href="/software">Software</a>
        <a href="/tutorials">Tutorials</a>
        <a href="/examples">Examples</a>
      </div>
    </article>

    <article id="use-as-a-library" class="quickstart-next-card">
      <div class="card-kicker">Use as a Library</div>
      <h3>C++ and Python</h3>
      <p>Use the PyPI package for Python, or integrate Local-MIP through the C++ API and repository examples.</p>
      <div class="quickstart-link-row">
        <a href="{{ site.data.external_links.repository.pypi }}">PyPI Package</a>
        <a href="{{ site.data.external_links.repository.readme }}">Solver README</a>
        <a href="{{ site.data.external_links.repository.python_readme }}">Python README</a>
      </div>
    </article>

    <article id="run-tests" class="quickstart-next-card">
      <div class="card-kicker">Run Tests</div>
      <h3>CTest workflow</h3>
      <p>Start with the fast unit-test subset from <code>build/</code>; reserve full CTest runs for longer development sweeps.</p>
      <pre><code class="language-bash">ctest --output-on-failure -R "^(api|callbacks|constraint_recognition|scoring|model_manager|reader|move_operations|neighbor_config)$"</code></pre>
      <div class="quickstart-link-row">
        <a href="{{ site.data.external_links.repository.readme }}">Test instructions</a>
      </div>
    </article>
  </div>
</section>

<section class="quickstart-panel quickstart-reference-panel">
  <div class="quickstart-section-heading">
    <span>References</span>
    <h2>Where to Look Next</h2>
  </div>
  <p>These files contain the full setup details:</p>
  <div class="quickstart-reference-grid">
    <a href="{{ site.data.external_links.repository.pypi }}"><span>PyPI package</span><strong>One-line Python installation for Linux x86_64</strong></a>
    <a href="{{ site.data.external_links.repository.readme }}"><span>Solver README</span><strong>CLI build, run, parameter-file usage, and tests</strong></a>
    <a href="{{ site.data.external_links.repository.python_readme }}"><span>Python bindings README</span><strong>Python installation, demos, and development builds</strong></a>
    <a href="{{ site.data.external_links.repository.model_api_readme }}"><span>Model API example README</span><strong>Example-specific build and run notes</strong></a>
    <a href="{{ site.data.external_links.repository.examples_tree }}"><span>Example directory</span><strong>Per-demo README files and source code</strong></a>
    <a href="{{ site.data.external_links.repository.releases }}"><span>GitHub Releases</span><strong>Download a packaged source archive</strong></a>
    <a href="{{ site.data.external_links.repository.home }}"><span>Repository home</span><strong>Browse the project online</strong></a>
  </div>
</section>

<section id="troubleshooting" class="quickstart-panel">
  <div class="quickstart-section-heading">
    <span>Checks</span>
    <h2>Troubleshooting</h2>
  </div>

  <div class="quickstart-troubleshooting-grid">
    <article class="quickstart-trouble-card">
      <span>Build issue</span>
      <h3>CMake version too old</h3>
      <p>Install CMake 3.15 or later.</p>
    </article>
    <article class="quickstart-trouble-card">
      <span>Build issue</span>
      <h3>C++20 compiler not found</h3>
      <p>Install a C++20-capable compiler (GCC or Clang) and ensure it is on your PATH.</p>
    </article>
    <article class="quickstart-trouble-card">
      <span>Runtime issue</span>
      <h3>Cannot find input file</h3>
      <p>Run from the <code>build/</code> directory or use absolute paths.</p>
    </article>
    <article class="quickstart-trouble-card">
      <span>Runtime issue</span>
      <h3>Slow performance</h3>
      <p>Prefer a release build when you want the best runtime performance.</p>
    </article>
  </div>
</section>

<section id="getting-help" class="quickstart-panel quickstart-help-panel">
  <div class="quickstart-section-heading">
    <span>Support</span>
    <h2>Getting Help</h2>
  </div>
  <div class="quickstart-help-grid">
    <a href="/tutorials">Tutorials</a>
    <a href="/examples">Examples</a>
    <a href="{{ site.data.external_links.repository.home }}">GitHub repository</a>
    <a href="{{ site.data.external_links.repository.issues }}">Open an issue</a>
  </div>
</section>

<div class="quickstart-page-nav">
  <a href="/">Back to Home</a>
  <a href="/software">Software</a>
</div>

  </div>
</div>
