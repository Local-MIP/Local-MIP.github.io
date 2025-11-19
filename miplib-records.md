---
layout: default
title: MIPLIB Records
---

# MIPLIB Benchmark Records

Local-MIP has set new records on the MIPLIB benchmark dataset, demonstrating state-of-the-art performance on challenging mixed integer programming instances.

---

## Overview

**MIPLIB** (Mixed Integer Programming Library) is the standard benchmark library for evaluating mixed integer programming solvers. It contains a diverse collection of challenging real-world and academic problem instances.

Local-MIP has established **10 new records** on open MIPLIB instances, showcasing its effectiveness on problems where traditional solvers struggle.

**Website:** [miplib.zib.de](https://miplib.zib.de)

---

## New Records Set by Local-MIP

The following table lists the 10 MIPLIB instances where Local-MIP has set new records:

| # | Instance Name | Type | Variables | Constraints | MIPLIB Link |
|---|---------------|------|-----------|-------------|-------------|
| 1 | sorrell7 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_sorrell7.html) |
| 2 | genus-sym-g31-8 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_genus-sym-g31-8.html) |
| 3 | supportcase22 | Mixed | - | - | [Details](https://miplib.zib.de/instance_details_supportcase22.html) |
| 4 | cdc7-4-3-2 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_cdc7-4-3-2.html) |
| 5 | genus-sym-g62-2 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_genus-sym-g62-2.html) |
| 6 | genus-g61-25 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_genus-g61-25.html) |
| 7 | ns1828997 | Mixed | - | - | [Details](https://miplib.zib.de/instance_details_ns1828997.html) |
| 8 | neos-4232544-orira | Mixed | - | - | [Details](https://miplib.zib.de/instance_details_neos-4232544-orira.html) |
| 9 | scpm1 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_scpm1.html) |
| 10 | scpn2 | Binary | - | - | [Details](https://miplib.zib.de/instance_details_scpn2.html) |

---

## Record Details

### 1. sorrell7

**Instance Information:**
- **MIPLIB Page:** [sorrell7](https://miplib.zib.de/instance_details_sorrell7.html)
- **Type:** Binary optimization problem
- **Status:** Open (unsolved for optimal solution)

**Local-MIP Achievement:**
- New best known solution found
- Demonstrates effectiveness on combinatorial optimization problems

---

### 2. genus-sym-g31-8

**Instance Information:**
- **MIPLIB Page:** [genus-sym-g31-8](https://miplib.zib.de/instance_details_genus-sym-g31-8.html)
- **Type:** Binary optimization with symmetry
- **Application:** Graph theory problem

**Local-MIP Achievement:**
- Improved best known bound
- Showcases handling of symmetric structures

---

### 3. supportcase22

**Instance Information:**
- **MIPLIB Page:** [supportcase22](https://miplib.zib.de/instance_details_supportcase22.html)
- **Type:** Mixed integer program
- **Application:** Real-world support case problem

**Local-MIP Achievement:**
- Better solution than previous solvers
- Demonstrates practical applicability

---

### 4. cdc7-4-3-2

**Instance Information:**
- **MIPLIB Page:** [cdc7-4-3-2](https://miplib.zib.de/instance_details_cdc7-4-3-2.html)
- **Type:** Binary optimization
- **Application:** Covering design problem

**Local-MIP Achievement:**
- New best solution
- Effective on structured combinatorial problems

---

### 5. genus-sym-g62-2

**Instance Information:**
- **MIPLIB Page:** [genus-sym-g62-2](https://miplib.zib.de/instance_details_genus-sym-g62-2.html)
- **Type:** Binary optimization with symmetry
- **Application:** Graph theory

**Local-MIP Achievement:**
- Improved upon previous best
- Large-scale symmetric problem

---

### 6. genus-g61-25

**Instance Information:**
- **MIPLIB Page:** [genus-g61-25](https://miplib.zib.de/instance_details_genus-g61-25.html)
- **Type:** Binary optimization
- **Application:** Graph genus problem

**Local-MIP Achievement:**
- New record solution
- Challenging graph-theoretic instance

---

### 7. ns1828997

**Instance Information:**
- **MIPLIB Page:** [ns1828997](https://miplib.zib.de/instance_details_ns1828997.html)
- **Type:** Mixed integer program
- **Application:** Real-world NEOS submission

**Local-MIP Achievement:**
- Better solution on real-world problem
- Demonstrates industrial applicability

---

### 8. neos-4232544-orira

**Instance Information:**
- **MIPLIB Page:** [neos-4232544-orira](https://miplib.zib.de/instance_details_neos-4232544-orira.html)
- **Type:** Mixed integer program
- **Application:** Real-world NEOS submission

**Local-MIP Achievement:**
- New best known solution
- Complex real-world instance

---

### 9. scpm1

**Instance Information:**
- **MIPLIB Page:** [scpm1](https://miplib.zib.de/instance_details_scpm1.html)
- **Type:** Binary optimization
- **Application:** Set covering problem

**Local-MIP Achievement:**
- Record solution
- Classic set covering instance

---

### 10. scpn2

**Instance Information:**
- **MIPLIB Page:** [scpn2](https://miplib.zib.de/instance_details_scpn2.html)
- **Type:** Binary optimization
- **Application:** Set covering problem

**Local-MIP Achievement:**
- New best solution
- Challenging set covering variant

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
   - Demonstrates effectiveness of local search approaches
   - Shows complementarity to traditional branch-and-bound methods

2. **Practical Impact**
   - Many instances are derived from real-world applications
   - Better solutions enable better decision-making

3. **Research Advancement**
   - Pushes boundaries of what's computationally achievable
   - Inspires new algorithmic developments

4. **Community Contribution**
   - Contributes to public benchmark database
   - Helps researchers worldwide

---

## Methodology

### Solver Configuration

Records were obtained using:
- **Version:** Local-MIP 1.0 (archived version)
- **Parameters:** Problem-specific tuning
- **Hardware:** Standard computational resources
- **Time Limits:** Varied by instance (typically hours to days)

See the [Papers](/papers) page for detailed experimental setup and methodology.

---

## Future Work

We continue to:
- Run Local-MIP on additional open instances
- Improve algorithms for better performance
- Collaborate with the MIPLIB community
- Update records as improvements are made

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

1. **[Download Local-MIP](/download)**
2. **Download MIPLIB instances** from [miplib.zib.de](https://miplib.zib.de)
3. **Run the solver:**
   ```bash
   ./Local-MIP -i instance.mps -t 3600 -b 2 -l 1
   ```
4. **Compare your results** with known best solutions

See the [Quick Start Guide](/quick-start) for more details.

---

[← Back to Home](/) | [Papers](/papers) | [Documentation](/documentation)
