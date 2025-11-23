---
layout: default
title: Quick Start
description: Get up and running with Local-MIP in minutes. Learn how to build and run the local search solver for mixed integer programming with novel operators and two-mode architecture.
keywords: Local-MIP installation, MIP solver tutorial, local search, lift move operator, breakthrough move, mixed tight move, C++ compiler, CMake build
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

Get up and running with Local-MIP in just a few minutes.

---

## Requirements

Before you begin, ensure your system meets these requirements:

- **CMake** ≥ 3.15
- **C++20 compiler** (GCC or Clang)
- **bash**, make, and standard POSIX utilities

---

## Get Started in 3 Steps

### Step 1: Download and Extract

Download the latest release (v2.0): **[Local-MIP v2.0](https://github.com/shaowei-cai-group/Local-MIP/archive/refs/tags/v2.0.zip)**

Extract the archive:

```bash
unzip Local-MIP-2.0.zip
cd Local-MIP-2.0
```

Or clone from GitHub:

```bash
git clone https://github.com/shaowei-cai-group/Local-MIP.git
cd Local-MIP
```

### Step 2: Build

Build the solver using the provided script:

```bash
# Release build (recommended)
./build.sh release

# Debug build with assertions/logging
./build.sh debug
```

The solver binary `Local-MIP` and static library `libLocalMIP.a` will be created in the `build/` directory.

### Step 3: Run

Navigate to the build directory and run your first MIP instance:

```bash
cd build
./Local-MIP --model_file ../test-set/2club200v15p5scn.mps --time_limit 300
```

**Expected Output:**
```
c model name: 2club200v15p5scn
c reading mps file takes 0.14 seconds.
c original problem has 200 variables and 17013 constraints
...
c [    300.00] local search is terminated by timeout.
o best objective: -69
```

---

## Basic Usage

### Command-Line Parameters

The basic syntax is:

```bash
./Local-MIP -i <model_file> [options]
```

**Common Options:**

| Flag | Parameter | Description | Default |
|------|-----------|-------------|---------|
| `-i` | `model_file` | Path to input model file (.mps/.lp) | Required |
| `-t` | `time_limit` | Time limit in seconds | 10 |
| `-s` | `sol_path` | Path to output solution file (.sol) | "" |
| `-l` | `log_obj` | Log objective values during search | true |
| `-S` | `random_seed` | Random seed (0 uses default) | 0 |

**Example:**

```bash
# Solve with 5-minute timeout and save solution
./Local-MIP -i problem.mps -t 300 -s solution.sol -l 1
```

### Using a Parameter Configuration File

Instead of passing all parameters via command line, you can use a configuration file:

```bash
./Local-MIP --param_set_file ../default.set --model_file ../test-set/instance.mps
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

See the [Examples page](/examples) for detailed code examples.

**Python bindings quick build:**

```bash
python-bindings/build.sh   # builds core if needed and compiles the pybind11 module
export PYTHONPATH=$PWD/python-bindings/build:$PYTHONPATH
python3 python-bindings/sample.py
```

### Run Tests

Verify your installation by running the test suite:

```bash
cd build

# Run unit test subsets
ctest --output-on-failure -R "^(api|callbacks|constraint_recognition|scoring|model_manager|reader|move_operations|neighbor_config)$"

# Run integration tests
ctest --output-on-failure -R "^integration$"

# Run all tests (including instance sweeps)
ctest --output-on-failure
```

---

## Troubleshooting

### Build Issues

**Problem:** CMake version too old
```
Solution: Install CMake 3.15 or later
```

**Problem:** C++20 compiler not found
```
Solution: Install GCC 10+ or Clang 12+
```

### Runtime Issues

**Problem:** Cannot find input file
```
Solution: Ensure you run from the build/ directory or use absolute paths
```

**Problem:** Slow performance
```
Solution: Use release build (./build.sh release) instead of debug build
```

---

## Getting Help

If you encounter problems:

1. Check the [Tutorials](/tutorials) for detailed information
2. Review the [Examples](/examples) for code samples
3. Visit the [GitHub repository](https://github.com/shaowei-cai-group/Local-MIP) for source code
4. Open an [issue on GitHub](https://github.com/shaowei-cai-group/Local-MIP/issues) for bug reports

---

[← Back to Home](/) | [Software →](/software)

  </div>
</div>
