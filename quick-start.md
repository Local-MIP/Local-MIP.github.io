---
layout: default
title: Quick Start
description: Get up and running with Local-MIP in just a few minutes. Learn how to download, build, and run your first MIP instance.
keywords: Local-MIP安装, MIP求解器入门, C++编译, CMake构建, 快速开始教程, 混合整数规划教程
---

# Quick Start

Get up and running with Local-MIP in just a few minutes.

---

## Requirements

Before you begin, ensure your system meets these requirements:

- **CMake** ≥ 3.15
- **C++20 compiler** (GCC or Clang) and pthreads
- **bash**, make, and standard POSIX utilities

### Supported Platforms
- Linux (recommended)
- macOS
- Windows (via WSL or compatible environment)

---

## Get Started in 3 Steps

### Step 1: Download and Extract

Download the latest release (v2.0):

**[Download Local-MIP v2.0](https://github.com/shaowei-cai-group/Local-MIP/archive/refs/tags/v2.0.zip)**

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
./Local-MIP -i ../test-set/2club200v15p5scn.mps -t 300 -b 1 -l 1
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
| `-b` | `bound_strengthen` | Bound strengthen level (0-off, 1-ip, 2-mip) | 1 |
| `-l` | `log_obj` | Log objective values during search | true |
| `-S` | `random_seed` | Random seed (0 uses default) | 0 |

**Example:**

```bash
# Solve with 5-minute timeout and save solution
./Local-MIP -i problem.mps -t 300 -s solution.sol -b 2 -l 1
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

- **[Download Page](/download)** - Get the latest version and previous releases
- **[Documentation](/documentation)** - Complete user guide and parameter reference
- **[Examples](/examples)** - Code examples for C++ API and callbacks

### Use as a Library

- **C++ API** - Integrate Local-MIP into your C++ projects
- **Python Bindings** - Use from Python with pybind11

See the [Examples page](/examples) for detailed code examples.

### Run Tests

Verify your installation by running the test suite:

```bash
cd build

# Run unit tests
ctest --output-on-failure -R "^(api|callbacks|constraint_recognition)$"

# Run integration tests
ctest --output-on-failure -R "^integration$"

# Run all tests
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

1. Check the [Documentation](/documentation) for detailed information
2. Review the [Examples](/examples) for code samples
3. Visit the [GitHub repository](https://github.com/shaowei-cai-group/Local-MIP) for source code
4. Open an [issue on GitHub](https://github.com/shaowei-cai-group/Local-MIP/issues) for bug reports

---

[← Back to Home](/) | [Documentation →](/documentation)
