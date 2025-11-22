---
layout: default
title: Download
---

# Download

Get the latest version of Local-MIP and access previous releases.

---

## Latest Release: v2.0

The current stable version of Local-MIP with full features and improvements.

### Download Links

**Primary Download:**

- **[Download v2.0 (.zip)](https://github.com/shaowei-cai-group/Local-MIP/archive/refs/tags/v2.0.zip)** - Recommended

**Alternative:**

- **[GitHub Release Page](https://github.com/shaowei-cai-group/Local-MIP/releases/tag/v2.0)** - View full release notes
- **[Source Code (GitHub)](https://github.com/shaowei-cai-group/Local-MIP)** - Clone or download from repository

### What's Included

- Complete source code
- CLI solver
- C++ static library and headers
- Python bindings (pybind11)
- Example code and demonstrations
- Test instances
- Documentation

---

## Previous Versions

### Local-MIP 1.0 (Archived)

**Important Note:** The experimental results reported in the referenced papers (CP 2024 and Artificial Intelligence 2025) were obtained using Local-MIP 1.0.

Local-MIP 1.0 has been archived and is available in the `archive/Local-MIP-1.0/` directory of the repository.

**Access:**

- Download the latest release and navigate to `archive/Local-MIP-1.0/`

---

## Installation Methods

### Method 1: Direct Download (Recommended)

Download the ZIP file and extract:

```bash
wget https://github.com/shaowei-cai-group/Local-MIP/archive/refs/tags/v2.0.zip
unzip v2.0.zip
cd Local-MIP
```

### Method 2: Git Clone

Clone the repository for the latest development version:

```bash
git clone https://github.com/shaowei-cai-group/Local-MIP.git
cd Local-MIP
```

---

## System Requirements

### Minimum Requirements

- **CMake:** Version 3.15 or later
- **Compiler:** C++20 compatible compiler
  - GCC 10+ or
  - Clang 12+
- **Tools:** bash, make, standard POSIX utilities

---

## Build Instructions

### Release Build (Recommended)

For optimal performance:

```bash
./build.sh release
```

Produces:

- `build/Local-MIP` - Optimized CLI binary
- `build/libLocalMIP.a` - Static library

### Debug Build

For development and debugging:

```bash
./build.sh debug
```

Includes assertions, logging, and debug symbols.

### Clean Build

Remove all build artifacts:

```bash
./build.sh clean
```

---

## Verification

### Verify Installation

After building, verify the installation:

```bash
cd build
./Local-MIP --help
```

### Run Tests

Execute the test suite:

```bash
cd build
ctest --output-on-failure
```

---

## License

Local-MIP is released under the **MIT License**.

**Key Points:**

- Free for academic and commercial use
- Open source
- Permissive licensing

[View Full License](https://github.com/shaowei-cai-group/Local-MIP/blob/main/LICENSE)

---

## Getting Help

### Documentation

- [Quick Start Guide](/quick-start) - Get started quickly
- [User Guide](/documentation) - Complete documentation
- [Examples](/examples) - Code examples and demos

### Support

- **GitHub Issues:** [Report bugs or request features](https://github.com/shaowei-cai-group/Local-MIP/issues)
- **GitHub Discussions:** [Ask questions and discuss](https://github.com/shaowei-cai-group/Local-MIP/discussions)
- **Source Code:** [Browse on GitHub](https://github.com/shaowei-cai-group/Local-MIP)

---

## Version History

| Version | Release Date | Highlights |
|---------|--------------|------------|
| v2.0 | 2025 | Current stable release with enhanced features |
| v1.0 | 2024 | Initial release (archived, used in papers) |

---

[← Back to Home](/) | [Documentations →](/documentation)
