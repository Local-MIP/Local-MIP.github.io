---
layout: default
title: Papers
---

# Papers & Publications

Academic publications related to Local-MIP.

---

## Citation Notice

**Important:** The experimental results reported in the papers below were obtained using **Local-MIP 1.0**, which has been archived in `archive/Local-MIP-1.0/` of the repository.

If you are reproducing experimental results from these papers, please use Local-MIP 1.0. The current version (v2.0) includes additional features and improvements.

---

## Publications

### 1. Journal Version (Artificial Intelligence, 2025)

**Title:** Local-MIP: Efficient local search for mixed integer programming

**Authors:** Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin

**Publication:**
- **Journal:** Artificial Intelligence
- **Volume:** 348
- **Year:** 2025
- **Pages:** 104405
- **ISSN:** 0004-3702

**Abstract:**
This paper presents Local-MIP, an efficient local search solver for mixed integer programming that combines novel search strategies with customizable components to achieve state-of-the-art performance on challenging benchmark instances.

**Links:**
- **DOI:** [10.1016/j.artint.2025.104405](https://doi.org/10.1016/j.artint.2025.104405)
- **Publisher:** [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S0004370225001249)

**BibTeX:**

{% raw %}
```bibtex
@article{LIN2025104405,
  title = {Local-MIP: Efficient local search for mixed integer programming},
  journal = {Artificial Intelligence},
  volume = {348},
  pages = {104405},
  year = {2025},
  issn = {0004-3702},
  doi = {https://doi.org/10.1016/j.artint.2025.104405},
  url = {https://www.sciencedirect.com/science/article/pii/S0004370225001249},
  author = {Peng Lin and Shaowei Cai and Mengchuan Zou and Jinkun Lin},
}
```
{% endraw %}

---

### 2. Conference Version (CP 2024) 🏆 **Best Paper Award**

**Title:** An Efficient Local Search Solver for Mixed Integer Programming

**Authors:** Peng Lin, Mengchuan Zou, Shaowei Cai

**Publication:**
- **Conference:** 30th International Conference on Principles and Practice of Constraint Programming (CP 2024)
- **Series:** Leibniz International Proceedings in Informatics (LIPIcs)
- **Volume:** 307
- **Pages:** 19:1–19:19
- **Year:** 2024
- **ISBN:** 978-3-95977-336-2
- **ISSN:** 1868-8969

**Award:** 🏆 **Best Paper Award** at CP 2024

**Abstract:**
This paper introduces an efficient local search solver for mixed integer programming problems, demonstrating superior performance on various benchmark instances through novel search strategies and algorithmic innovations.

**Links:**
- **DOI:** [10.4230/LIPIcs.CP.2024.19](https://doi.org/10.4230/LIPIcs.CP.2024.19)
- **Publisher:** [Dagstuhl Research Online Publication Server](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2024.19)

**BibTeX:**

{% raw %}
```bibtex
@InProceedings{lin_et_al:LIPIcs.CP.2024.19,
  author    = {Lin, Peng and Zou, Mengchuan and Cai, Shaowei},
  title     = {{An Efficient Local Search Solver for Mixed Integer Programming}},
  booktitle = {30th International Conference on Principles and Practice of Constraint Programming (CP 2024)},
  pages     = {19:1--19:19},
  series    = {Leibniz International Proceedings in Informatics (LIPIcs)},
  ISBN      = {978-3-95977-336-2},
  ISSN      = {1868-8969},
  year      = {2024},
  volume    = {307},
  editor    = {Shaw, Paul},
  publisher = {Schloss Dagstuhl -- Leibniz-Zentrum f{\"u}r Informatik},
  address   = {Dagstuhl, Germany},
  URL       = {https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2024.19},
  URN       = {urn:nbn:de:0030-drops-206999},
  doi       = {10.4230/LIPIcs.CP.2024.19},
  annote    = {Keywords: Mixed Integer Programming, Local Search, Constraint Programming}
}
```
{% endraw %}

---

## How to Cite

If you use Local-MIP in your academic work, please cite **both** papers:

### Recommended Citation Format

**For the journal version:**

> Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin. "Local-MIP: Efficient local search for mixed integer programming." *Artificial Intelligence*, Volume 348, 2025, 104405. https://doi.org/10.1016/j.artint.2025.104405

**For the conference version:**

> Peng Lin, Mengchuan Zou, Shaowei Cai. "An Efficient Local Search Solver for Mixed Integer Programming." In *Proceedings of the 30th International Conference on Principles and Practice of Constraint Programming (CP 2024)*, LIPIcs Vol. 307, pp. 19:1-19:19, 2024. https://doi.org/10.4230/LIPIcs.CP.2024.19

---

## Complete BibTeX for Both Papers

Copy and paste this into your `.bib` file:

{% raw %}
```bibtex
@article{LIN2025104405,
  title = {Local-MIP: Efficient local search for mixed integer programming},
  journal = {Artificial Intelligence},
  volume = {348},
  pages = {104405},
  year = {2025},
  issn = {0004-3702},
  doi = {https://doi.org/10.1016/j.artint.2025.104405},
  url = {https://www.sciencedirect.com/science/article/pii/S0004370225001249},
  author = {Peng Lin and Shaowei Cai and Mengchuan Zou and Jinkun Lin},
}

@InProceedings{lin_et_al:LIPIcs.CP.2024.19,
  author    = {Lin, Peng and Zou, Mengchuan and Cai, Shaowei},
  title     = {{An Efficient Local Search Solver for Mixed Integer Programming}},
  booktitle = {30th International Conference on Principles and Practice of Constraint Programming (CP 2024)},
  pages     = {19:1--19:19},
  series    = {Leibniz International Proceedings in Informatics (LIPIcs)},
  ISBN      = {978-3-95977-336-2},
  ISSN      = {1868-8969},
  year      = {2024},
  volume    = {307},
  URL       = {https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2024.19},
  doi       = {10.4230/LIPIcs.CP.2024.19},
}
```
{% endraw %}

---

## Reproducing Experimental Results

To reproduce the experimental results reported in these papers:

1. **Use Local-MIP 1.0** (archived version)
   ```bash
   git clone https://github.com/shaowei-cai-group/Local-MIP.git
   cd Local-MIP/archive/Local-MIP-1.0
   ```

2. **Follow the build instructions** in the archived version's README

3. **Use the exact parameters** specified in the papers

4. **Note:** The current version (v2.0) may produce different results due to improvements and enhancements

---

## Awards & Recognition

### CP 2024 Best Paper Award 🏆

The conference paper received the **Best Paper Award** at the 30th International Conference on Principles and Practice of Constraint Programming (CP 2024), recognizing outstanding contribution to the field of constraint programming and mixed integer programming.

**Significance:**
- CP is one of the premier conferences in constraint programming
- Best Paper Award recognizes exceptional research quality and impact
- Demonstrates the significance of Local-MIP's contributions to the field

---

## Related Work

For more information on the benchmark results and performance achievements, see:

- [MIPLIB Records](/miplib-records) - New records set on MIPLIB benchmark instances
- [Documentation](/documentation) - Technical details of the solver
- [Examples](/examples) - Code examples demonstrating key features

---

## Contact

For questions about the papers or research collaboration:

- **GitHub Issues:** [Local-MIP Repository](https://github.com/shaowei-cai-group/Local-MIP/issues)
- **GitHub Discussions:** [Start a discussion](https://github.com/shaowei-cai-group/Local-MIP/discussions)

---

[← Back to Home](/) | [MIPLIB Records →](/miplib-records)
