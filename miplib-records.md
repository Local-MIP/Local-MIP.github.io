---
layout: default
title: MIPLIB Records
description: Local-MIP establishes 10 new records on MIPLIB open instances, demonstrating the effectiveness of local search with novel operators for challenging MIP problems.
keywords: MIPLIB records, MIP benchmark, mixed integer programming, local search, optimization records, MIPLIB 2017, open instances
---

# MIPLIB Benchmark Records

Local-MIP establishes **10 new records** on challenging MIPLIB open instances, demonstrating state-of-the-art performance through its novel local search operators and two-mode architecture.

---

## Overview

**MIPLIB** (Mixed Integer Programming Library) is the standard benchmark library for evaluating mixed integer programming solvers, maintained by the optimization community at [miplib.zib.de](https://miplib.zib.de).

**Open instances** are the most challenging problems in MIPLIB—those for which the optimal solution has not yet been proven. Local-MIP's records on these instances showcase the effectiveness of its local search approach on problems where traditional branch-and-bound methods struggle.

---

## New Best-Known Solutions

The following table presents the 10 MIPLIB open instances where Local-MIP has established new best-known solutions, as reported in our AIJ 2025 paper.

| Instance Name | Variables | Constraints | Constraint Types | Previous Best | **Local-MIP** | Improvement |
|---------------|-----------|-------------|------------------|---------------|---------------|-------------|
| [sorrell7](https://miplib.zib.de/instance_details_sorrell7.html) | 2,048 | 78,848 | variable bound | -196 | **-197** | ✓ |
| [genus-sym-g31-8](https://miplib.zib.de/instance_details_genus-sym-g31-8.html) | 3,484 | 32,073 | knapsack, etc. | -21 | **-23** | ✓ |
| [supportcase22](https://miplib.zib.de/instance_details_supportcase22.html) | 7,129 | 260,602 | mixed binary, etc. | N/A† | **117** | ✓ |
| [cdc7-4-3-2](https://miplib.zib.de/instance_details_cdc7-4-3-2.html) | 11,811 | 14,478 | set packing | -289 | **-294** | ✓ |
| [genus-sym-g62-2](https://miplib.zib.de/instance_details_genus-sym-g62-2.html) | 12,912 | 78,472 | set partitioning, etc. | -34 | **-38** | ✓ |
| [genus-g61-25](https://miplib.zib.de/instance_details_genus-g61-25.html) | 14,380 | 94,735 | cardinality, etc. | -34 | **-40** | ✓ |
| [ns1828997](https://miplib.zib.de/instance_details_ns1828997.html) | 27,275 | 81,725 | precedence, etc. | 9 | **8** | ✓ |
| [neos-4232544-orira](https://miplib.zib.de/instance_details_neos-4232544-orira.html) | 87,060 | 180,600 | aggregations, etc. | 17,540,506.0 | **15,108,527.5** | ✓ |
| [scpm1](https://miplib.zib.de/instance_details_scpm1.html) | 500,000 | 5,000 | set covering | 554 | **544** | ✓ |
| [scpn2](https://miplib.zib.de/instance_details_scpn2.html) | 1,000,000 | 5,000 | set covering | 501 | **490** | ✓ |

**†** First-ever feasible solution found for this instance.

---

## Key Highlights

### Notable Achievements

- **First-ever feasible solution:** [supportcase22](https://miplib.zib.de/instance_details_supportcase22.html) — Local-MIP found the first feasible solution (obj=117) for this 7,129-variable, 260,602-constraint real-world instance.

- **Large-scale set covering:** [scpm1](https://miplib.zib.de/instance_details_scpm1.html) (500,000 variables) and [scpn2](https://miplib.zib.de/instance_details_scpn2.html) (1,000,000 variables) — Local-MIP improved best-known solutions by 1.8% and 2.2% respectively on million-variable instances.

- **Graph theory problems:** [genus-sym-g31-8](https://miplib.zib.de/instance_details_genus-sym-g31-8.html), [genus-sym-g62-2](https://miplib.zib.de/instance_details_genus-sym-g62-2.html), [genus-g61-25](https://miplib.zib.de/instance_details_genus-g61-25.html) — Demonstrated effectiveness on structured combinatorial problems with symmetry.

- **Real-world instances:** [ns1828997](https://miplib.zib.de/instance_details_ns1828997.html) and [neos-4232544-orira](https://miplib.zib.de/instance_details_neos-4232544-orira.html) — Improved solutions on NEOS Server submissions from industrial applications.

---

## About MIPLIB

### What is MIPLIB?

MIPLIB (Mixed Integer Programming Library) is a collection of benchmark instances for mixed integer programming maintained by the optimization community. It serves as the standard for:

- Evaluating solver performance
- Comparing algorithmic approaches
- Tracking progress in the field
- Publishing new computational results

### MIPLIB Categories

Instances are categorized by:

- **Easy:** Solvable by most modern solvers
- **Hard:** Challenging for current solvers
- **Open:** No proven optimal solution known

All Local-MIP records are on **open** or **hard** instances.

### Verification

All record solutions have been:
- Verified for feasibility
- Submitted to MIPLIB database
- Independently validated by the community

---

## Significance

### Why These Records Matter

1. **Algorithmic Innovation**
   - Demonstrates effectiveness of Local-MIP's **two-mode architecture** and **novel operators** (lift move, breakthrough move, mixed tight move)
   - Shows complementarity to traditional complete methods (branch-and-bound)
   - Validates the **local search approach** as a powerful incomplete method for MIP

2. **Practical Impact**
   - Many instances are derived from real-world applications (NEOS Server submissions)
   - Better solutions enable improved decision-making in industrial contexts
   - First feasible solutions unlock previously unsolvable problems

3. **Research Advancement**
   - Pushes boundaries of what's computationally achievable on challenging open instances
   - Inspires new algorithmic developments in local search for MIP
   - Contributes to understanding of constraint satisfaction and optimization trade-offs

4. **Community Contribution**
   - Contributes new best-known solutions to public MIPLIB benchmark database
   - Provides reference points for future algorithm development
   - Helps researchers worldwide evaluate and improve their methods

---

## Methodology

### Experimental Setup

Records were obtained using the configuration reported in our AIJ 2025 paper:

- **Algorithm:** Local-MIP with two-mode architecture (feasible mode and infeasible mode)
- **Key Features:**
  - **Novel operators:** Lift move, breakthrough move, mixed tight move
  - **Two-level scoring:** Progress score and bonus score (breakthrough bonus and robustness bonus)
  - **Dynamic weighting scheme** for constraint prioritization
- **Parameters:** Problem-specific tuning based on instance characteristics
- **Hardware:** Standard computational resources
- **Time Limits:** Varied by instance complexity (typically hours to days)

See the [Papers](/papers) page for complete experimental details and algorithmic descriptions.

---

## Future Work

Ongoing research directions include:

- **Expanding benchmark coverage:** Testing Local-MIP on additional MIPLIB open instances to identify further opportunities for improvement
- **Algorithmic enhancements:** Developing new operators and scoring strategies to improve performance on specific problem classes
- **Hybrid approaches:** Investigating integration with complete methods to leverage complementary strengths
- **Community engagement:** Collaborating with the MIPLIB community to validate solutions and contribute to the benchmark library
- **Solution verification:** Continuously updating and verifying records as new solutions are discovered

---

## Acknowledgments

We thank:
- The MIPLIB maintainers for providing this invaluable benchmark library
- The optimization community for creating and maintaining these instances
- Researchers who verify and validate new solutions

---

## Related Resources

- **[MIPLIB Website](https://miplib.zib.de)** - Official MIPLIB benchmark library
- **[Papers](/papers)** - Publications describing Local-MIP's algorithms
- **[Download](/download)** - Get Local-MIP to try on MIPLIB instances
- **[Documentation](/documentation)** - Learn how to use Local-MIP

---

## Try It Yourself

Want to try Local-MIP on MIPLIB instances?

1. **[Download Local-MIP](/download)** — Get the latest release
2. **Download MIPLIB instances** from [miplib.zib.de](https://miplib.zib.de)
3. **Run Local-MIP:**
   ```bash
   ./Local-MIP -i instance.mps -t 3600 -b 2 -l 1
   ```
   Parameters: `-i` input file, `-t` time limit (seconds), `-b` bound strengthen level, `-l` log objective values
4. **Compare your results** with known best solutions on the MIPLIB website

See the [Quick Start Guide](/quick-start) for detailed instructions.

---

[← Back to Home](/) | [Papers](/papers) | [Documentation](/documentation)
