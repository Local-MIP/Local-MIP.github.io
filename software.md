---
layout: default
title: Software
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Software navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#latest-release">Latest Release</a></li>
      <li><a href="#previous-versions">Previous Versions</a></li>
      <li><a href="#installation-methods">Installation Methods</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#method-1-direct-download-recommended">Direct Download</a></li>
          <li><a href="#method-2-git-clone">Git Clone</a></li>
        </ul>
      </li>
      <li><a href="#system-requirements">Requirements</a></li>
      <li><a href="#build-instructions">Build Instructions</a></li>
      <li><a href="#verification">Verification</a></li>
      <li><a href="#license">License</a></li>
      <li><a href="#getting-help">Getting Help</a></li>
      <li><a href="#version-history">Version History</a></li>
    </ul>
  </nav>

  <div class="doc-content" markdown="1">
# Software

Find release downloads, source links, and archived versions of Local-MIP.

---

## Latest Release

GitHub Releases is the main entry point for tagged versions and release notes.

### Download Links

**Primary Download:**

- **[GitHub Releases]({{ site.data.external_links.repository.releases }})** - Latest release packages and notes

**Alternative:**

- **[Source Code (GitHub)]({{ site.data.external_links.repository.home }})** - Clone or browse the repository
- **[PyPI package]({{ site.data.external_links.repository.pypi }})** - Python bindings for supported platforms

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

Local-MIP 1.0 has been archived and is available on the GitHub release page: [v1.0.1]({{ site.data.external_links.repository.archive_v1_0_1 }}).

**Access:**

- Download [Local-MIP 1.0]({{ site.data.external_links.repository.archive_v1_0_1 }})

---

## Installation Methods

### Method 1: Direct Download (Recommended)

Use [GitHub Releases]({{ site.data.external_links.repository.releases }}) when you want a tagged source archive.

### Method 2: Git Clone

Use the [Local-MIP repository]({{ site.data.external_links.repository.home }}) when you want the latest development tree or the full project history.

---

## System Requirements

### Minimum Requirements

- **CMake:** Version 3.15 or later
- **Compiler:** C++20 compatible compiler (GCC or Clang)
- **Tools:** bash, make, standard POSIX utilities

---

## Build Instructions

This page focuses on where to get the code. For setup, build, and test steps, start with the [solver README]({{ site.data.external_links.repository.readme }}). If you plan to use Python, also read the [Python bindings README]({{ site.data.external_links.repository.python_readme }}).

---

## Verification

### Verify Installation

The [Quick Start page](/quick-start) and the [solver README]({{ site.data.external_links.repository.readme }}) walk through a first run.

### Run Tests

The [solver README]({{ site.data.external_links.repository.readme }}) lists the available test targets.

---

## License

Local-MIP is released under the **MIT License**.

**Key Points:**

- Free for academic and commercial use
- Open source
- Permissive licensing

[View Full License]({{ site.data.external_links.repository.license }})

---

## Getting Help

### Documentation

- [Quick Start Guide](/quick-start) - Get started quickly
- [Tutorials](/tutorials) - Complete documentation
- [Examples](/examples) - Code examples and demos

### Support

- **GitHub Issues:** [Report bugs or request features]({{ site.data.external_links.repository.issues }})
- **Source Code:** [Browse on GitHub]({{ site.data.external_links.repository.home }})

---

## Version History

| Version | Highlights |
|---------|------------|
| Latest release | See [GitHub Releases]({{ site.data.external_links.repository.releases }}) for the newest tagged release |
| v1.0.1 | Earlier tag; [Local-MIP 1.0]({{ site.data.external_links.repository.archive_v1_0_1 }}) code is archived |

---

[← Back to Home](/) | [Tutorials →](/tutorials)

  </div>
</div>
