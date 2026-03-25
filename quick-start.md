---
layout: default
title: Quick Start
description: Build and run Local-MIP, a local-search solver for mixed integer programming with CLI and C++/Python APIs.
keywords: Local-MIP installation, MIP solver tutorial, local search, MIP, C++20, CMake, MPS, LP, callbacks, API
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Quick start navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
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

  <div class="doc-content" markdown="1">
# Quick Start

Get started with Local-MIP as a standalone solver, embedded library, or research prototype.

---

## Requirements

Before you begin, ensure your system meets these requirements:

- **CMake** ≥ 3.15
- **C++20 compiler** (GCC or Clang)
- **bash**, make, and standard POSIX utilities

---

## Get Started in 3 Steps

### Step 1: Download and Extract

Choose the source that matches your workflow:

- **Stable release:** [GitHub Releases]({{ site.data.external_links.repository.releases }})
- **Repository checkout:** [Local-MIP repository]({{ site.data.external_links.repository.home }})

Use a release archive if you want a tagged snapshot, or clone the repository if you want the latest development version.

### Step 2: Build

Start with the [solver README]({{ site.data.external_links.repository.readme }}) for the full build workflow.

**Common first build:**

```bash
./build.sh release
```

For examples and Python bindings, the same README covers `./build.sh all`, and the [Python bindings README]({{ site.data.external_links.repository.python_readme }}) covers the Python-specific setup path.

The main outputs remain the same at a high level: a solver binary and a static library under `build/`.

### Step 3: Run

Run the solver from the generated `build/` directory against a sample `.mps` or `.lp` instance:

```bash
cd build
./Local-MIP --model_file ../test-set/2club200v15p5scn.mps --time_limit 300
```

Use the [solver README]({{ site.data.external_links.repository.readme }}) for more build/run variants and `--help` for the available command-line flags.

---

## Basic Usage

### Command-Line Parameters

A representative CLI invocation looks like this:

```bash
./Local-MIP --model_file <model_file> [options]
```

CLI flags support both short and long forms (for example `-i` or `--model_file`).

**Representative Options:**

| Flag | Parameter | Description | Default |
|------|-----------|-------------|---------|
| `-i` | `model_file` | Path to input model file (.mps/.lp) | Required |
| `-t` | `time_limit` | Time limit in seconds | 10 |
| `-s` | `sol_path` | Path to output solution file (.sol) | "" |
| `-l` | `log_obj` | Log objective values during search | 1 |
| `-S` | `random_seed` | Random seed (0 uses default) | 0 |

**Example:**

```bash
# Solve with 5-minute timeout and save solution
./Local-MIP --model_file problem.mps --time_limit 300 --sol_path solution.sol --log_obj 1
```

### Using a Parameter Configuration File

Instead of passing all parameters via command line, you can use a configuration file:

```bash
./Local-MIP --param_set_file ../default.set --model_file ../test-set/2club200v15p5scn.mps
```

The repository includes `default.set` as a template with all available parameters and their default values.

**Configuration File Format:**
- One parameter per line: `parameter_name = value`
- Lines starting with `#` or `;` are comments
- Command-line arguments override values from the configuration file

---

## Next Steps

### Explore More

- **[Software Page](/software)** - Get the latest version and previous releases
- **[Tutorials](/tutorials)** - Complete guide and parameter reference
- **[Examples](/examples)** - Code examples for C++ API and callbacks

### Use as a Library

- **C++ API** - Integrate Local-MIP into your C++ projects
- **Python Bindings** - Use from Python with pybind11

See the [Examples page](/examples) for runnable code. For setup and integration details, use `README.md` and `python-bindings/README.md`.

### Run Tests

CTest-based verification is part of the main project workflow. The [solver README]({{ site.data.external_links.repository.readme }}) lists the available test targets and filters.

## Where to Look Next

These files contain the full setup details:

- [solver README]({{ site.data.external_links.repository.readme }}) - CLI build, run, parameter-file usage, and tests
- [Python bindings README]({{ site.data.external_links.repository.python_readme }}) - Python installation, demos, and development builds
- [Model API example README]({{ site.data.external_links.repository.model_api_readme }}) - Example-specific build and run notes
- [Example directory on GitHub]({{ site.data.external_links.repository.examples_tree }}) - Per-demo README files and source code
- [GitHub Releases]({{ site.data.external_links.repository.releases }}) - Download a packaged source archive
- [Repository home]({{ site.data.external_links.repository.home }}) - Browse the project online

---

## Troubleshooting

### Build Issues

**Problem:** CMake version too old
Solution: Install CMake 3.15 or later.

**Problem:** C++20 compiler not found
Solution: Install a C++20-capable compiler (GCC or Clang) and ensure it is on your PATH.

### Runtime Issues

**Problem:** Cannot find input file
Solution: Ensure you run from the build/ directory or use absolute paths.

**Problem:** Slow performance
Solution: Prefer a release build when you want the best runtime performance.

---

## Getting Help

If you encounter problems:

1. Check the [Tutorials](/tutorials) for detailed information
2. Review the [Examples](/examples) for code samples
3. Visit the [GitHub repository]({{ site.data.external_links.repository.home }}) for source code
4. Open an [issue on GitHub]({{ site.data.external_links.repository.issues }}) for bug reports

---

[← Back to Home](/) | [Software →](/software)

  </div>
</div>
