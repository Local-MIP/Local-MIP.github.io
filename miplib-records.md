---
layout: default
title: MIPLIB Records
description: Local-MIP establishes 10 new records on MIPLIB open instances, demonstrating the effectiveness of local search with novel operators for challenging MIP problems.
keywords: MIPLIB records, MIP benchmark, mixed integer programming, local search, optimization records, MIPLIB 2017, open instances
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="MIPLIB records navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#new-best-known-solutions">New Best-Known Solutions</a></li>
      <li><a href="#related-resources">Related Resources</a></li>
    </ul>
  </nav>

  <div class="doc-content" markdown="1">
# MIPLIB Benchmark Records

Local-MIP establishes **10 new records** on challenging MIPLIB open instances, demonstrating state-of-the-art performance through its novel local search operators and two-mode architecture.

---

## Overview

**MIPLIB** is the standard benchmark library for evaluating mixed integer programming solvers, maintained by the optimization community at [miplib.zib.de](https://miplib.zib.de).

**Open instances** are the most challenging problems in MIPLIB, those for which the optimal solution has not yet been proven. Local-MIP's records on these instances showcase the effectiveness of its local search approach on problems where traditional branch-and-bound methods struggle.

---

## New Best-Known Solutions

The following table presents the 10 MIPLIB open instances where Local-MIP has established new best-known solutions, as reported in our AIJ 2025 paper.

| Instance Name | Variables | Constraints | Constraint Types | Previous Best | **Local-MIP** |
|---------------|-----------|-------------|------------------|---------------|---------------|
| [sorrell7](https://miplib.zib.de/instance_details_sorrell7.html) | 2,048 | 78,848 | variable bound | -196 | **-197** |
| [genus-sym-g31-8](https://miplib.zib.de/instance_details_genus-sym-g31-8.html) | 3,484 | 32,073 | knapsack, etc. | -21 | **-23** |
| [supportcase22](https://miplib.zib.de/instance_details_supportcase22.html) | 7,129 | 260,602 | mixed binary, etc. | N/A† | **117** |
| [cdc7-4-3-2](https://miplib.zib.de/instance_details_cdc7-4-3-2.html) | 11,811 | 14,478 | set packing | -289 | **-294** |
| [genus-sym-g62-2](https://miplib.zib.de/instance_details_genus-sym-g62-2.html) | 12,912 | 78,472 | set partitioning, etc. | -34 | **-38** |
| [genus-g61-25](https://miplib.zib.de/instance_details_genus-g61-25.html) | 14,380 | 94,735 | cardinality, etc. | -34 | **-40** |
| [ns1828997](https://miplib.zib.de/instance_details_ns1828997.html) | 27,275 | 81,725 | precedence, etc. | 9 | **8** |
| [neos-4232544-orira](https://miplib.zib.de/instance_details_neos-4232544-orira.html) | 87,060 | 180,600 | aggregations, etc. | 17,540,506.0 | **15,108,527.5** |
| [scpm1](https://miplib.zib.de/instance_details_scpm1.html) | 500,000 | 5,000 | set covering | 554 | **544** |
| [scpn2](https://miplib.zib.de/instance_details_scpn2.html) | 1,000,000 | 5,000 | set covering | 501 | **490** |

**†** First-ever feasible solution found for this instance.

---

## Related Resources

- **[MIPLIB Website](https://miplib.zib.de)** - Official MIPLIB benchmark library
- **[Papers](/papers)** - Publications describing Local-MIP's algorithms
- **[Software](/software)** - Get Local-MIP to try on MIPLIB instances
- **[Tutorials](/tutorials)** - Learn how to use Local-MIP

---

[← Back to Home](/) | [Papers](/papers) | [Tutorials](/tutorials)

  </div>
</div>
