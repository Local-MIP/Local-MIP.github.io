---
layout: default
title: Examples
description: Runnable Local-MIP examples for file-based solving, modeling, callbacks, neighbor configuration, and scoring.
keywords: Local-MIP examples, C++ API, Python bindings, callbacks, neighbor configuration, model API, MIP
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Examples navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#build-and-run">Build and Run</a></li>
      <li><a href="#example-map">Example Map</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#simple-api">Simple API</a></li>
          <li><a href="#model-api">Model API</a></li>
          <li><a href="#start-callback">Start</a></li>
          <li><a href="#restart-callback">Restart</a></li>
          <li><a href="#weight-callback">Weight</a></li>
          <li><a href="#neighbor-config">Neighbor Config</a></li>
          <li><a href="#neighbor-userdata">User Data</a></li>
          <li><a href="#neighbor-scoring">Neighbor Scoring</a></li>
          <li><a href="#lift-scoring">Lift Scoring</a></li>
        </ul>
      </li>
      <li><a href="#quick-recipes">Quick Recipes</a></li>
      <li><a href="#python-demos">Python Demos</a></li>
      <li><a href="#next-steps">Next Steps</a></li>
    </ul>
  </nav>

  <div class="doc-content examples-content" markdown="1">
# Examples

<section class="examples-hero">
  <div class="examples-hero-copy">
    <p class="examples-kicker">Runnable Examples</p>
    <h1>Example Gallery</h1>
    <p>Use the repository demos as small, isolated references for file-based solving, in-memory modeling, callback hooks, neighbor configuration, and custom scoring.</p>
  </div>
  <div class="examples-hero-links" aria-label="Example entry points">
    <a href="#build-and-run"><span>Build</span><strong>Prepare demos</strong></a>
    <a href="#simple-api"><span>Start</span><strong>Simple API</strong></a>
    <a href="#model-api"><span>Model</span><strong>Model API</strong></a>
    <a href="#neighbor-config"><span>Search</span><strong>Neighbor Config</strong></a>
  </div>
</section>

<section id="overview" class="examples-panel examples-overview-panel">
  <div class="examples-section-heading">
    <span>Overview</span>
    <h2>One demo per extension point</h2>
  </div>
  <p class="examples-panel-intro">The solver repository keeps C++ examples under <code>example/</code> and Python demos under <code>python-bindings/</code>. Each demo focuses on one public interface so it can be copied into experiments with minimal context.</p>
  <div class="examples-overview-grid">
    <article><span>File-backed solving</span><strong><code>example/simple-api/</code></strong><p>Load an MPS/LP file, set common parameters, run, and query results.</p></article>
    <article><span>Programmatic modeling</span><strong><code>example/model-api/</code></strong><p>Build a small MIP from variables and bounded linear constraints.</p></article>
    <article><span>Callbacks</span><strong><code>example/*-callback/</code></strong><p>Replace starts, restarts, weights, neighbors, and scoring behavior.</p></article>
    <article><span>Python</span><strong><code>python-bindings/*.py</code></strong><p>Use the pybind11 module for file-based runs, Model API demos, and smoke tests.</p></article>
  </div>
</section>

<section id="build-and-run" class="examples-panel examples-build-panel">
  <div class="examples-section-heading">
    <span>Build and Run</span>
    <h2>Prepare examples from the solver root</h2>
  </div>
  <p class="examples-panel-intro">Use <code>./build.sh all</code> from the solver root when you want the core library, examples, and Python bindings prepared together. For the example-only path, build the core library first, then prepare and compile the demos.</p>
  <div class="examples-build-grid">
    <article class="examples-command-card">
      <div class="card-kicker">All-in-one</div>
      <h3>Build everything</h3>
      <pre><code class="language-bash">./build.sh all</code></pre>
    </article>
    <article class="examples-command-card">
      <div class="card-kicker">Example-only</div>
      <h3>Prepare and build demos</h3>
      <pre><code class="language-bash">./build.sh release
cd example
./prepare.sh
./build.sh</code></pre>
    </article>
    <article class="examples-command-card">
      <div class="card-kicker">Representative runs</div>
      <h3>Run a short demo first</h3>
      <pre><code class="language-bash">cd example
./model-api/model_api_demo</code></pre>
    </article>
  </div>
  <p class="examples-note">Run these commands from the solver repository root. The in-memory Model API demo finishes quickly; file-backed demos resolve the bundled sample instance and use their source-defined time limits, often 30-60 seconds. Pass a custom model path as <code>argv[1]</code> when needed.</p>
</section>

<section id="example-map" class="examples-panel examples-map-panel">
  <div class="examples-section-heading">
    <span>Example Map</span>
    <h2>Find the demo that matches the module</h2>
  </div>
  <p class="examples-panel-intro">This map mirrors the strategy modules in Tutorials and points to runnable repository directories.</p>
  <div class="examples-map-grid">
    <article id="simple-api" class="examples-map-card examples-primary-card">
      <span>File-backed solving</span>
      <h3>Simple API</h3>
      <p>Minimal C++ flow: create <code>Local_MIP</code>, set a model file, set a time limit and output path, run, then query feasibility and objective value.</p>
      <div class="examples-meta"><code>example/simple-api/</code><code>simple_api.cpp</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/simple-api">GitHub directory</a><a href="/tutorials#use-as-a-library">API tutorial</a></div>
    </article>

    <article id="model-api" class="examples-map-card examples-primary-card">
      <span>Programmatic modeling</span>
      <h3>Model API</h3>
      <p>Build a small MIP in memory with objective sense, variables, bounds, constraint ranges, integrality, and solution queries.</p>
      <div class="examples-meta"><code>example/model-api/</code><code>python-bindings/model_api_demo.py</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.model_api_readme }}">Model API README</a><a href="/tutorials#modeling-api">Modeling tutorial</a></div>
    </article>

    <article id="start-callback" class="examples-map-card">
      <span>Start module</span>
      <h3>Start Callback</h3>
      <p>Customize initial values before search begins. The demo accesses current values, binary variable indices, RNG, and optional user data.</p>
      <div class="examples-meta"><code>example/start-callback/</code><code>set_start_cbk</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/start-callback">GitHub directory</a><a href="/tutorials#callback-system">Callback tutorial</a></div>
    </article>

    <article id="restart-callback" class="examples-map-card">
      <span>Restart module</span>
      <h3>Restart Callback</h3>
      <p>Customize restart behavior after stagnation, including current assignment perturbation and weight changes.</p>
      <div class="examples-meta"><code>example/restart-callback/</code><code>set_restart_cbk</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/restart-callback">GitHub directory</a><a href="/tutorials#callback-system">Callback tutorial</a></div>
    </article>

    <article id="weight-callback" class="examples-map-card">
      <span>Weighting module</span>
      <h3>Weight Callback</h3>
      <p>Customize constraint and objective weights. Use this when the default <code>monotone</code> or <code>smooth</code> behavior needs problem-specific changes.</p>
      <div class="examples-meta"><code>example/weight-callback/</code><code>set_weight_cbk</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/weight-callback">GitHub directory</a><a href="/tutorials#strategy-modules">Strategy modules</a></div>
    </article>

    <article id="neighbor-config" class="examples-map-card examples-primary-card">
      <span>Neighbor generation</span>
      <h3>Neighbor Config</h3>
      <p>Reset or reorder the built-in neighbor list, tune BMS counts, and mix predefined operators with custom neighbors.</p>
      <div class="examples-meta"><code>example/neighbor-config/</code><code>clear_neighbor_list</code><code>add_neighbor</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/neighbor-config">GitHub directory</a><a href="/tutorials#neighbor-configuration">Neighbor tutorial</a></div>
    </article>

    <article id="neighbor-userdata" class="examples-map-card">
      <span>Stateful neighbor</span>
      <h3>Neighbor Userdata</h3>
      <p>Pass custom state into neighbor callbacks to collect statistics or make adaptive decisions across invocations.</p>
      <div class="examples-meta"><code>example/neighbor-userdata/</code><code>add_custom_neighbor</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/neighbor-userdata">GitHub directory</a><a href="/tutorials#callback-system">Callback tutorial</a></div>
    </article>

    <article id="neighbor-scoring" class="examples-map-card">
      <span>Neighbor scoring</span>
      <h3>Neighbor Scoring</h3>
      <p>Replace infeasible-phase move ranking with a custom scoring function and tie-breaking logic.</p>
      <div class="examples-meta"><code>example/scoring-neighbor/</code><code>set_neighbor_scoring_cbk</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/scoring-neighbor">GitHub directory</a><a href="/tutorials#callback-system">Callback tutorial</a></div>
    </article>

    <article id="lift-scoring" class="examples-map-card">
      <span>Lift scoring</span>
      <h3>Lift Scoring</h3>
      <p>Replace feasible-phase lift move ranking, for example to keep objective improvement while changing tie-breaking behavior.</p>
      <div class="examples-meta"><code>example/scoring-lift/</code><code>set_lift_scoring_cbk</code></div>
      <div class="examples-card-links"><a href="{{ site.data.external_links.repository.examples_tree }}/scoring-lift">GitHub directory</a><a href="/tutorials#strategy-modules">Strategy modules</a></div>
    </article>
  </div>
</section>

<section id="quick-recipes" class="examples-panel examples-recipes-panel">
  <div class="examples-section-heading">
    <span>Quick Recipes</span>
    <h2>Copy the small pattern, not the whole page</h2>
  </div>
  <div class="examples-recipe-grid">
    <article class="examples-code-card">
      <div class="card-kicker">Simple API</div>
      <h3>File-backed C++ solve</h3>
      <pre><code class="language-cpp">Local_MIP solver;
solver.set_model_file("test-set/2club200v15p5scn.mps");
solver.set_sol_path("example_simple.sol");
solver.set_time_limit(10.0);
solver.set_log_obj(true);
solver.run();

if (solver.is_feasible()) {
  printf("Objective value: %.10f\n", solver.get_obj_value());
}</code></pre>
    </article>

    <article class="examples-code-card">
      <div class="card-kicker">Model API</div>
      <h3>Range constraints in memory</h3>
      <pre><code class="language-cpp">Local_MIP solver;
const double inf = std::numeric_limits&lt;double&gt;::infinity();

solver.enable_model_api();
solver.set_sense(Model_API::Sense::maximize);

int x1 = solver.add_var("x1", 0.0, 40.0, 1.0, Var_Type::real);
int x4 = solver.add_var("x4", 2.0, 3.0, 1.0, Var_Type::general_integer);

solver.add_con(-inf, 20.0,
               std::vector&lt;int&gt;{x1, x4},
               std::vector&lt;double&gt;{-1.0, 10.0});
solver.run();</code></pre>
    </article>

    <article class="examples-code-card">
      <div class="card-kicker">Neighbor Config</div>
      <h3>Change the neighbor list</h3>
      <pre><code class="language-cpp">Local_MIP solver;
solver.clear_neighbor_list();
solver.add_custom_neighbor("my_random_flip", my_random_flip_neighbor);
solver.add_neighbor("unsat_mtm_bm", 12, 8);
solver.add_neighbor("flip", 0, 12);
solver.add_custom_neighbor("my_gradient_descent", my_gradient_descent_neighbor);
solver.set_model_file("test-set/2club200v15p5scn.mps");
solver.set_time_limit(10.0);
solver.run();</code></pre>
    </article>
  </div>
</section>

<section id="python-demos" class="examples-panel examples-python-panel">
  <div class="examples-section-heading">
    <span>Python Demos</span>
    <h2>Use the pybind11 module when scripting</h2>
  </div>
  <p class="examples-panel-intro">The Python bindings expose core configuration, result queries, parameter-file loading, Model API methods, and structured callback contexts. For a venv-safe install command, start from Quick Start.</p>
  <div class="examples-python-grid">
    <article><span>File run</span><strong><code>python-bindings/sample.py</code></strong><p>Loads a bundled sample model, runs the solver, and writes <code>py_example.sol</code>.</p></article>
    <article><span>Modeling</span><strong><code>python-bindings/model_api_demo.py</code></strong><p>Mirrors the C++ Model API demo using <code>lm.LocalMIP</code>, <code>lm.Sense</code>, and <code>lm.VarType</code>.</p></article>
    <article><span>Smoke tests</span><strong><code>python-bindings/test_python_api.py</code></strong><p>Covers parameter files, callback contexts, and exposed API methods.</p></article>
  </div>
</section>

<section id="next-steps" class="examples-panel examples-resources-panel">
  <div class="examples-section-heading">
    <span>Next Steps</span>
    <h2>Connect examples back to the docs</h2>
  </div>
  <div class="examples-resource-grid">
    <a href="/tutorials#strategy-modules"><span>Tutorials</span><strong>Strategy Modules</strong></a>
    <a href="/tutorials#callback-system"><span>Tutorials</span><strong>Callback System</strong></a>
    <a href="/tutorials#modeling-api"><span>Tutorials</span><strong>Modeling API</strong></a>
    <a href="/quick-start"><span>Start</span><strong>Quick Start</strong></a>
    <a href="{{ site.data.external_links.repository.examples_tree }}"><span>Source</span><strong>Example Tree</strong></a>
    <a href="{{ site.data.external_links.repository.readme }}"><span>Source</span><strong>Solver README</strong></a>
  </div>
</section>

<nav class="examples-page-nav" aria-label="Examples page navigation">
  <a href="/tutorials"><span>Previous</span><strong>Tutorials</strong></a>
  <a href="/papers"><span>Next</span><strong>Papers</strong></a>
</nav>

  </div>
</div>
