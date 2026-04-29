---
layout: default
title: Tutorials
description: Learn Local-MIP through CLI solving, C++ and Python APIs, in-memory modeling, parameters, and callback customization.
keywords: Local-MIP tutorials, MIP solver CLI, C++ API, Python bindings, Model API, callback system, local search, mixed integer programming
mathjax: true
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Tutorials navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#command-line-usage">Command Line</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#basic-usage">Basic Usage</a></li>
          <li><a href="#parameter-configuration-file">Parameter File</a></li>
        </ul>
      </li>
      <li><a href="#use-as-a-library">Use as a Library</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#c-static-library">C++ API</a></li>
          <li><a href="#python-bindings">Python</a></li>
          <li><a href="#modeling-api">Modeling API</a></li>
        </ul>
      </li>
      <li><a href="#algorithm-concepts">Concepts</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#mixed-integer-programming-mip">MIP</a></li>
          <li><a href="#local-search-for-mip">Local Search</a></li>
          <li><a href="#strategy-modules">Strategy Modules</a></li>
        </ul>
      </li>
      <li><a href="#parameters-reference">Parameters</a></li>
      <li><a href="#callback-system">Callbacks</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#callback-overview">Overview</a></li>
          <li><a href="#common-read-only-context">Common Context</a></li>
          <li><a href="#neighbor-configuration">Neighbor Configuration</a></li>
          <li><a href="#how-to-register-callbacks">Register</a></li>
        </ul>
      </li>
      <li><a href="#additional-resources">Resources</a></li>
    </ul>
  </nav>

  <div class="doc-content tutorials-content" markdown="1">
# Tutorials

<section class="tutorials-hero">
  <div class="tutorials-hero-copy">
    <p class="tutorials-kicker">Learning Path</p>
    <h1>Learn <span>Local-MIP</span></h1>
    <p>Start with file-based solving, then move to the C++ or Python APIs, in-memory modeling, and callback hooks for custom local-search behavior.</p>
  </div>
  <div class="tutorials-hero-links" aria-label="Tutorial entry points">
    <a href="#command-line-usage"><span>01</span><strong>Command Line</strong></a>
    <a href="#use-as-a-library"><span>02</span><strong>APIs</strong></a>
    <a href="#modeling-api"><span>03</span><strong>Modeling</strong></a>
    <a href="#callback-system"><span>04</span><strong>Callbacks</strong></a>
  </div>
</section>

<section id="overview" class="tutorials-panel tutorials-overview-panel">
  <div class="tutorials-section-heading">
    <span>Overview</span>
    <h2>Pick the path that matches your workflow</h2>
  </div>
  <p class="tutorials-panel-intro">This page follows the current public README, API headers, parameter template, and the public algorithm description.</p>
  <div class="tutorials-path-grid">
    <article class="tutorials-path-card">
      <span>Run files</span>
      <h3>CLI solver</h3>
      <p>Solve existing <code>.mps</code> or <code>.lp</code> models, use <code>.set</code> files, and script benchmark runs.</p>
      <a href="#command-line-usage">Open CLI tutorial</a>
    </article>
    <article class="tutorials-path-card">
      <span>Embed</span>
      <h3>C++ / Python APIs</h3>
      <p>Configure Local-MIP from code, run the solver, and query feasibility, objective value, and solution vectors.</p>
      <a href="#use-as-a-library">Open API tutorial</a>
    </article>
    <article class="tutorials-path-card">
      <span>Build models</span>
      <h3>Modeling API</h3>
      <p>Create variables, constraints, objective sense, integrality, and solve a model without reading a file.</p>
      <a href="#modeling-api">Open modeling tutorial</a>
    </article>
    <article class="tutorials-path-card">
      <span>Customize search</span>
      <h3>Callbacks</h3>
      <p>Customize starts, restarts, weights, neighbor generation, and feasible or infeasible scoring logic.</p>
      <a href="#callback-system">Open callback tutorial</a>
    </article>
  </div>
</section>

<section id="command-line-usage" class="tutorials-panel tutorials-command-panel">
  <div class="tutorials-section-heading">
    <span>Command Line</span>
    <h2>Solve MPS or LP files directly</h2>
  </div>
  <p class="tutorials-panel-intro">Use the CLI when your model already exists as a file. Build from the repository root, then run from <code>build/</code> so the bundled test-set paths resolve.</p>

  <div class="tutorials-command-grid">
    <article id="basic-usage" class="tutorials-step-card">
      <div class="card-kicker">Basic Usage</div>
      <h3>Build and run a 10 second solve</h3>
      <pre><code class="language-bash">./build.sh release
cd build
./Local-MIP -i ../test-set/2club200v15p5scn.mps -t 10</code></pre>
      <p>Short and long flags are both supported. For example, <code>-i</code> and <code>--model_file</code> refer to the same required input model parameter.</p>
    </article>

    <article id="parameter-configuration-file" class="tutorials-step-card">
      <div class="card-kicker">Parameter File</div>
      <h3>Keep solver settings in a .set file</h3>
      <pre><code class="language-bash">cd build
./Local-MIP --param_set_file ../default.set --model_file ../test-set/2club200v15p5scn.mps</code></pre>
      <p>A parameter file uses one <code>parameter_name = value</code> assignment per line. Lines beginning with <code>#</code> or <code>;</code> are comments. Command-line arguments override values loaded from the file.</p>
    </article>
  </div>

  <div class="tutorials-note-grid">
    <div><span>Input files</span><strong><code>.mps</code> and <code>.lp</code></strong><p>The current reader handles MPS <code>RANGES</code> sections; SOS data is rejected with an error.</p></div>
    <div><span>Inspect flags</span><strong><code>./Local-MIP --help</code></strong><p>Use the binary help output as the final source for flag names in the checked-out version.</p></div>
    <div><span>Template</span><strong><code>default.set</code></strong><p>The repository template lists every parameter with the current default and valid range.</p></div>
  </div>

  <div class="tutorials-config-example">
    <h3>Small configuration example</h3>
    <pre><code class="language-ini"># General control
time_limit = 10
random_seed = 42
log_obj = 1

# Built-in strategy choices
start = zero
restart = best
weight = monotone
lift_scoring = lift_age
neighbor_scoring = progress_bonus</code></pre>
  </div>
</section>

<section id="use-as-a-library" class="tutorials-panel">
  <div class="tutorials-section-heading">
    <span>Library Use</span>
    <h2>Embed Local-MIP from C++ or Python</h2>
  </div>
  <p class="tutorials-panel-intro">The public APIs expose the same core configuration used in normal runs, plus result queries, parameter-file loading, in-memory modeling, and callback registration.</p>

  <div class="tutorials-interface-grid">
    <article id="c-static-library" class="tutorials-code-card tutorials-code-card-wide">
      <div class="card-kicker">C++ static library</div>
      <h3>Minimal file-backed solve</h3>
      <p>The source build produces <code>build/libLocalMIP.a</code>; headers live under <code>src/</code>. The example projects under <code>example/</code> show standalone build commands.</p>
      <pre><code class="language-cpp">#include "local_mip/Local_MIP.h"

int main() {
  Local_MIP solver;
  solver.set_model_file("test-set/2club200v15p5scn.mps");
  solver.set_sol_path("example_simple.sol");
  solver.set_time_limit(10.0);
  solver.set_log_obj(true);

  solver.run();
  if (solver.is_feasible()) {
    printf("Objective value: %.10f\n", solver.get_obj_value());
  }
  return 0;
}</code></pre>
      <div class="tutorials-card-links">
        <a href="{{ site.data.external_links.repository.examples_tree }}">Example tree</a>
        <a href="{{ site.data.external_links.repository.readme }}">Build details</a>
      </div>
    </article>

    <article id="python-bindings" class="tutorials-code-card">
      <div class="card-kicker">Python bindings</div>
      <h3>Install in a local venv</h3>
      <p>For Linux x86_64, the published Python bindings are the shortest path. The venv command avoids system Python package restrictions.</p>
      <pre><code class="language-bash">python3 -m venv .venv && .venv/bin/python -m pip install localmip
.venv/bin/python -c "import localmip_py as lm; print(lm.LocalMIP)"</code></pre>
      <pre><code class="language-python">import localmip_py as lm

solver = lm.LocalMIP()
solver.set_model_file("test-set/2club200v15p5scn.mps")
solver.set_time_limit(10.0)
solver.set_log_obj(True)
solver.run()

if solver.is_feasible():
    print("Objective:", solver.get_obj_value())</code></pre>
      <div class="tutorials-card-links">
        <a href="{{ site.data.external_links.repository.pypi }}">PyPI package</a>
        <a href="{{ site.data.external_links.repository.python_readme }}">Python README</a>
      </div>
    </article>
  </div>
</section>

<section id="modeling-api" class="tutorials-panel tutorials-model-panel">
  <div class="tutorials-section-heading">
    <span>Modeling API</span>
    <h2>Build a model in memory</h2>
  </div>
  <p class="tutorials-panel-intro">Use the Model API when you want to add variables and constraints from code instead of reading a model file. Build the model once, call <code>run()</code> once, and create a fresh solver instance for another solve.</p>

  <div class="tutorials-model-grid">
    <article class="tutorials-code-card">
      <div class="card-kicker">Python sketch</div>
      <h3>Variables, bounds, objective, constraints</h3>
      <pre><code class="language-python">import math
import localmip_py as lm

solver = lm.LocalMIP()
solver.enable_model_api()
solver.set_sense(lm.Sense.minimize)
solver.set_time_limit(1.0)

x1 = solver.add_var("x1", 0.0, 1.0, 1.0, lm.VarType.real)
x2 = solver.add_var("x2", 0.0, 10.0, -0.5, lm.VarType.general_integer)

# x1 + 2*x2 <= 20
solver.add_con(-math.inf, 20.0, [x1, x2], [1.0, 2.0])

solver.run()
if solver.is_feasible():
    sol = solver.get_solution()
    print("Objective:", solver.get_obj_value())
    print("x1:", sol[x1], "x2:", sol[x2])</code></pre>
    </article>

    <article class="tutorials-api-list">
      <div class="card-kicker">API surface</div>
      <h3>Selected methods</h3>
      <div class="tutorials-method-grid">
        <span><code>enable_model_api()</code><em>Enable programmatic modeling first.</em></span>
        <span><code>set_sense(Sense)</code><em>Choose minimize or maximize.</em></span>
        <span><code>add_var(name, lb, ub, cost, type)</code><em>Add a variable and objective coefficient.</em></span>
        <span><code>add_con(lb, ub, cols, coefs)</code><em>Add a bounded linear constraint.</em></span>
        <span><code>set_integrality(col/name, type)</code><em>Change variable type when needed.</em></span>
        <span><code>get_solution()</code><em>Read the incumbent vector after a run.</em></span>
      </div>
      <p class="tutorials-note">Constraint bounds use <code>lb <= expression <= ub</code>. Use infinity for one-sided constraints and equal bounds for equality constraints.</p>
      <div class="tutorials-card-links">
        <a href="{{ site.data.external_links.repository.model_api_readme }}">Model API README</a>
        <a href="/examples#model-api">Examples</a>
      </div>
    </article>
  </div>
</section>

<section id="algorithm-concepts" class="tutorials-panel tutorials-concepts-panel">
  <div class="tutorials-section-heading">
    <span>Concepts</span>
    <h2>The search model in one page</h2>
  </div>

  <article id="mixed-integer-programming-mip" class="tutorials-theory-card">
    <h3>Mixed Integer Programming (MIP)</h3>
    <p>In the canonical minimization form used by the algorithmic description, a MIP is:</p>
    $$
    \min_x \ c^\top x \quad \text{s.t.} \quad Ax \le b, \quad \ell \le x \le u, \quad x_j \in \mathbb{Z} \ \forall j \in I.
    $$
    <p>A solution assigns values to all variables. It is feasible when it satisfies the linear constraints, variable bounds, and integrality restrictions. Among feasible solutions, the objective value determines solution quality.</p>
  </article>

  <div id="local-search-for-mip" class="tutorials-phase-grid">
    <article class="tutorials-phase-card">
      <span>Feasible mode</span>
      <h3>Improve while preserving feasibility</h3>
      <p>When the current solution is feasible, Local-MIP maintains local feasible domains and uses lift moves to improve the objective without violating constraints.</p>
    </article>
    <article class="tutorials-phase-card">
      <span>Infeasible mode</span>
      <h3>Balance feasibility and objective progress</h3>
      <p>When constraints are violated, the search uses mixed tight and breakthrough move candidates, weighted progress scoring, and tie-breaking bonuses.</p>
    </article>
  </div>

  <div id="strategy-modules" class="tutorials-module-panel">
    <h3>Six strategy modules</h3>
    <p>The current implementation exposes these modules through parameters and callbacks. Each module links to its runnable example.</p>
    <div class="tutorials-module-grid">
      <a href="/examples#start-callback"><span>Start</span><strong><code>zero</code>, <code>random</code></strong><em>Start Callback example</em></a>
      <a href="/examples#restart-callback"><span>Restart</span><strong><code>random</code>, <code>best</code>, <code>hybrid</code></strong><em>Restart Callback example</em></a>
      <a href="/examples#lift-scoring"><span>Lift scoring</span><strong><code>lift_age</code>, <code>lift_random</code></strong><em>Lift Scoring example</em></a>
      <a href="/examples#neighbor-config"><span>Neighbor generation</span><strong>built-in and custom neighbors</strong><em>Neighbor Config example</em></a>
      <a href="/examples#neighbor-scoring"><span>Neighbor scoring</span><strong><code>progress_bonus</code>, <code>progress_age</code></strong><em>Neighbor Scoring example</em></a>
      <a href="/examples#weight-callback"><span>Weighting</span><strong><code>monotone</code>, <code>smooth</code></strong><em>Weight Callback example</em></a>
    </div>
  </div>
</section>

<section id="parameters-reference" class="tutorials-panel tutorials-reference-panel">
  <div class="tutorials-section-heading">
    <span>Parameters Reference</span>
    <h2>CLI flags and .set keys</h2>
  </div>
  <p class="tutorials-panel-intro">The table below mirrors the current <code>default.set</code>, <code>src/utils/paras.h</code>, and <code>./Local-MIP --help</code> output. The input model is required for CLI runs.</p>

  <h3>General parameters</h3>
  <div class="tutorials-table-wrap">
    <table class="tutorials-parameter-table">
      <thead>
        <tr><th>Parameter</th><th>Description</th><th>Flag</th><th>Type</th><th>Range</th><th>Default</th></tr>
      </thead>
      <tbody>
        <tr><td data-label="Parameter"><code>model_file</code></td><td data-label="Description">Path to input model file (<code>.mps</code>/<code>.lp</code>). Required for CLI runs.</td><td data-label="Flag"><code>-i</code></td><td data-label="Type">string</td><td data-label="Range">-</td><td data-label="Default"><code>""</code></td></tr>
        <tr><td data-label="Parameter"><code>sol_path</code></td><td data-label="Description">Path to output solution file (<code>.sol</code>).</td><td data-label="Flag"><code>-s</code></td><td data-label="Type">string</td><td data-label="Range">-</td><td data-label="Default"><code>""</code></td></tr>
        <tr><td data-label="Parameter"><code>param_set_file</code></td><td data-label="Description">Path to parameter configuration file (<code>.set</code>).</td><td data-label="Flag"><code>-c</code></td><td data-label="Type">string</td><td data-label="Range">-</td><td data-label="Default"><code>""</code></td></tr>
        <tr><td data-label="Parameter"><code>time_limit</code></td><td data-label="Description">Time limit in seconds.</td><td data-label="Flag"><code>-t</code></td><td data-label="Type">double</td><td data-label="Range"><code>[0, 1e8]</code></td><td data-label="Default"><code>10</code></td></tr>
        <tr><td data-label="Parameter"><code>random_seed</code></td><td data-label="Description">Random seed for local search. <code>0</code> uses the default behavior.</td><td data-label="Flag"><code>-S</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 2147483647]</code></td><td data-label="Default"><code>0</code></td></tr>
      </tbody>
    </table>
  </div>

  <h3>Numerical and search parameters</h3>
  <div class="tutorials-table-wrap">
    <table class="tutorials-parameter-table">
      <thead>
        <tr><th>Parameter</th><th>Description</th><th>Flag</th><th>Type</th><th>Range</th><th>Default</th></tr>
      </thead>
      <tbody>
        <tr><td data-label="Parameter"><code>feas_tolerance</code></td><td data-label="Description">Feasibility tolerance.</td><td data-label="Flag"><code>-F</code></td><td data-label="Type">double</td><td data-label="Range"><code>[0, 1e-2]</code></td><td data-label="Default"><code>1e-6</code></td></tr>
        <tr><td data-label="Parameter"><code>opt_tolerance</code></td><td data-label="Description">Optimality tolerance.</td><td data-label="Flag"><code>-O</code></td><td data-label="Type">double</td><td data-label="Range"><code>[0, 1]</code></td><td data-label="Default"><code>1e-4</code></td></tr>
        <tr><td data-label="Parameter"><code>zero_tolerance</code></td><td data-label="Description">Zero value tolerance.</td><td data-label="Flag"><code>-Z</code></td><td data-label="Type">double</td><td data-label="Range"><code>[0, 1e-3]</code></td><td data-label="Default"><code>1e-9</code></td></tr>
        <tr><td data-label="Parameter"><code>bound_strengthen</code></td><td data-label="Description">Bound strengthening level: <code>0</code> off, <code>1</code> IP, <code>2</code> MIP.</td><td data-label="Flag"><code>-b</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 2]</code></td><td data-label="Default"><code>1</code></td></tr>
        <tr><td data-label="Parameter"><code>log_obj</code></td><td data-label="Description">Log objective values during search.</td><td data-label="Flag"><code>-l</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 1]</code></td><td data-label="Default"><code>1</code></td></tr>
        <tr><td data-label="Parameter"><code>split_eq</code></td><td data-label="Description">Split equality constraints into two inequalities.</td><td data-label="Flag"><code>-j</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 1]</code></td><td data-label="Default"><code>1</code></td></tr>
        <tr><td data-label="Parameter"><code>activity_period</code></td><td data-label="Description">Constraint activity recompute period.</td><td data-label="Flag"><code>-H</code></td><td data-label="Type">int</td><td data-label="Range"><code>[1, 100000000]</code></td><td data-label="Default"><code>100000</code></td></tr>
        <tr><td data-label="Parameter"><code>break_eq_feas</code></td><td data-label="Description">Break feasibility on equality constraints in the lift process.</td><td data-label="Flag"><code>-z</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 1]</code></td><td data-label="Default"><code>0</code></td></tr>
        <tr><td data-label="Parameter"><code>restart_step</code></td><td data-label="Description">No-improvement steps before restart. <code>0</code> disables restarts.</td><td data-label="Flag"><code>-r</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>1000000</code></td></tr>
        <tr><td data-label="Parameter"><code>smooth_prob</code></td><td data-label="Description">Weight smoothing probability in units of <code>1/10000</code>.</td><td data-label="Flag"><code>-0</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 10000]</code></td><td data-label="Default"><code>1</code></td></tr>
      </tbody>
    </table>
  </div>

  <h3>BMS and tabu parameters</h3>
  <div class="tutorials-table-wrap">
    <table class="tutorials-parameter-table">
      <thead>
        <tr><th>Parameter</th><th>Description</th><th>Flag</th><th>Type</th><th>Range</th><th>Default</th></tr>
      </thead>
      <tbody>
        <tr><td data-label="Parameter"><code>bms_unsat_con</code></td><td data-label="Description">BMS unsatisfied constraint sample size.</td><td data-label="Flag"><code>-u</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>12</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_unsat_ops</code></td><td data-label="Description">BMS MTM unsatisfied operations.</td><td data-label="Flag"><code>-p</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>2250</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_sat_con</code></td><td data-label="Description">BMS satisfied constraint sample size.</td><td data-label="Flag"><code>-v</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>1</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_sat_ops</code></td><td data-label="Description">BMS MTM satisfied operations.</td><td data-label="Flag"><code>-o</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>80</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_flip_ops</code></td><td data-label="Description">BMS flip operations.</td><td data-label="Flag"><code>-x</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>0</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_easy_ops</code></td><td data-label="Description">BMS easy operations.</td><td data-label="Flag"><code>-q</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>5</code></td></tr>
        <tr><td data-label="Parameter"><code>bms_random_ops</code></td><td data-label="Description">BMS random operations.</td><td data-label="Flag"><code>-g</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>250</code></td></tr>
        <tr><td data-label="Parameter"><code>tabu_base</code></td><td data-label="Description">Base tabu tenure.</td><td data-label="Flag"><code>-a</code></td><td data-label="Type">int</td><td data-label="Range"><code>[0, 100000000]</code></td><td data-label="Default"><code>4</code></td></tr>
        <tr><td data-label="Parameter"><code>tabu_var</code></td><td data-label="Description">Tabu tenure variation.</td><td data-label="Flag"><code>-e</code></td><td data-label="Type">int</td><td data-label="Range"><code>[1, 100000000]</code></td><td data-label="Default"><code>7</code></td></tr>
      </tbody>
    </table>
  </div>

  <h3>Strategy selectors</h3>
  <div class="tutorials-table-wrap">
    <table class="tutorials-parameter-table tutorials-strategy-table">
      <thead>
        <tr><th>Parameter</th><th>Description</th><th>Flag</th><th>Values</th><th>Default</th></tr>
      </thead>
      <tbody>
        <tr><td data-label="Parameter"><code>start</code></td><td data-label="Description">Start method.</td><td data-label="Flag"><code>-m</code></td><td data-label="Values"><code>zero</code>, <code>random</code></td><td data-label="Default"><code>zero</code></td></tr>
        <tr><td data-label="Parameter"><code>restart</code></td><td data-label="Description">Restart strategy.</td><td data-label="Flag"><code>-y</code></td><td data-label="Values"><code>random</code>, <code>best</code>, <code>hybrid</code></td><td data-label="Default"><code>best</code></td></tr>
        <tr><td data-label="Parameter"><code>weight</code></td><td data-label="Description">Constraint weight update method.</td><td data-label="Flag"><code>-w</code></td><td data-label="Values"><code>smooth</code>, <code>monotone</code></td><td data-label="Default"><code>monotone</code></td></tr>
        <tr><td data-label="Parameter"><code>lift_scoring</code></td><td data-label="Description">Feasible-phase lift scoring method.</td><td data-label="Flag"><code>-f</code></td><td data-label="Values"><code>lift_age</code>, <code>lift_random</code></td><td data-label="Default"><code>lift_age</code></td></tr>
        <tr><td data-label="Parameter"><code>neighbor_scoring</code></td><td data-label="Description">Infeasible-phase neighbor scoring method.</td><td data-label="Flag"><code>-n</code></td><td data-label="Values"><code>progress_bonus</code>, <code>progress_age</code></td><td data-label="Default"><code>progress_bonus</code></td></tr>
      </tbody>
    </table>
  </div>
</section>

<section id="callback-system" class="tutorials-panel tutorials-callback-panel">
  <div class="tutorials-section-heading">
    <span>Callback System</span>
    <h2>Customize search without changing the solver kernel</h2>
  </div>
  <p class="tutorials-panel-intro">Callbacks replace selected strategy behavior while the solver owns the main control flow. The C++ API uses typed contexts and optional <code>void* user_data</code>. Python callbacks use structured context objects and can also receive optional user data.</p>

  <div id="callback-overview" class="tutorials-callback-grid">
    <article><span>Initialization</span><strong><code>Start::Start_Ctx</code></strong><p>Modify initial variable values and use the solver RNG.</p></article>
    <article><span>Restart</span><strong><code>Restart::Restart_Ctx</code></strong><p>Perturb the current assignment and adjust weights after restart triggers.</p></article>
    <article><span>Weight</span><strong><code>Weight::Weight_Ctx</code></strong><p>Update constraint and objective weights.</p></article>
    <article><span>Neighbor</span><strong><code>Neighbor::Neighbor_Ctx</code></strong><p>Generate custom move candidates with helper methods.</p></article>
    <article><span>Neighbor scoring</span><strong><code>Scoring::Neighbor_Ctx</code></strong><p>Rank infeasible-phase candidates using progress and tie-breaking state.</p></article>
    <article><span>Lift scoring</span><strong><code>Scoring::Lift_Ctx</code></strong><p>Rank feasible-phase lift moves.</p></article>
  </div>

  <article id="common-read-only-context" class="tutorials-context-panel">
    <h3>Common read-only context</h3>
    <p>Every callback receives access to a shared snapshot through <code>ctx.m_shared</code> in C++ or the corresponding structured object in Python.</p>
    <div class="tutorials-context-grid">
      <div><span>Model data</span><p><code>m_model_manager</code>, objective coefficients, variable and constraint metadata.</p></div>
      <div><span>Current state</span><p>Current values, best values, activities, constants, equality flags, and weights.</p></div>
      <div><span>Constraint sets</span><p>Unsatisfied and satisfied constraint index lists used by neighbor and scoring logic.</p></div>
      <div><span>Search status</span><p>Current step, last improvement step, incumbent objective, feasibility status, and breakthrough status.</p></div>
    </div>
  </article>

  <article id="neighbor-configuration" class="tutorials-neighbor-panel">
    <div>
      <h3>Neighbor configuration</h3>
      <p>Neighbor generation can be reset, reordered, mixed with built-in operators, or extended with user-defined generators. Custom generators should emit moves through the context helpers.</p>
    </div>
    <pre><code class="language-cpp">Local_MIP solver;
solver.clear_neighbor_list();
solver.add_custom_neighbor("my_random_flip", my_neighbor_cbk);
solver.add_neighbor("unsat_mtm_bm", 12, 8);
solver.add_neighbor("flip", 0, 12);
solver.set_model_file("test-set/2club200v15p5scn.mps");
solver.run();</code></pre>
  </article>

  <article id="how-to-register-callbacks" class="tutorials-register-panel">
    <h3>Registration methods</h3>
    <div class="tutorials-method-grid tutorials-register-grid">
      <span><code>set_start_cbk(callback, user_data)</code><em>Custom initialization.</em></span>
      <span><code>set_restart_cbk(callback, user_data)</code><em>Custom restart action.</em></span>
      <span><code>set_weight_cbk(callback, user_data)</code><em>Custom weight update.</em></span>
      <span><code>add_custom_neighbor(name, callback, user_data)</code><em>User-defined neighbor generator.</em></span>
      <span><code>set_neighbor_scoring_cbk(callback, user_data)</code><em>Infeasible-phase scoring.</em></span>
      <span><code>set_lift_scoring_cbk(callback, user_data)</code><em>Feasible-phase scoring.</em></span>
    </div>
    <p class="tutorials-note">Use repository examples as the runnable source of truth: <code>start-callback/</code>, <code>restart-callback/</code>, <code>weight-callback/</code>, <code>neighbor-config/</code>, <code>neighbor-userdata/</code>, <code>scoring-neighbor/</code>, and <code>scoring-lift/</code>.</p>
  </article>
</section>

<section id="additional-resources" class="tutorials-panel tutorials-resources-panel">
  <div class="tutorials-section-heading">
    <span>Resources</span>
    <h2>Where to go next</h2>
  </div>
  <div class="tutorials-resource-grid">
    <a href="/quick-start"><span>Start</span><strong>Quick Start</strong></a>
    <a href="/software"><span>Install</span><strong>Software</strong></a>
    <a href="/examples"><span>Code</span><strong>Examples</strong></a>
    <a href="{{ site.data.external_links.repository.readme }}"><span>Source</span><strong>Solver README</strong></a>
    <a href="{{ site.data.external_links.repository.python_readme }}"><span>Python</span><strong>Bindings README</strong></a>
    <a href="/papers"><span>Research</span><strong>Papers</strong></a>
  </div>
</section>

<nav class="tutorials-page-nav" aria-label="Tutorial page navigation">
  <a href="/quick-start"><span>Previous</span><strong>Quick Start</strong></a>
  <a href="/examples"><span>Next</span><strong>Examples</strong></a>
</nav>

  </div>
</div>
