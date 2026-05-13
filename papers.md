---
layout: default
title: Papers
description: Publications, citation guidance, and version notes for Local-MIP research, the Local-ILP precursor, and software.
keywords: Local-MIP papers, Local-ILP, citation, Artificial Intelligence 2025, CP 2024, mixed integer programming, integer linear programming, local search
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="Papers navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#citation-guidance">Citation Guidance</a></li>
      <li><a href="#publications">Publications</a>
        <ul class="doc-sidebar-sublist">
          <li><a href="#ai-2025">AI 2025</a></li>
          <li><a href="#cp-2024">CP 2024</a></li>
          <li><a href="#local-ilp-arxiv">Local-ILP arXiv</a></li>
        </ul>
      </li>
      <li><a href="#bibtex">BibTeX</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>

  <div class="doc-content papers-content" markdown="1">
# Papers

<section id="overview" class="papers-hero">
  <div class="papers-hero-copy">
    <p class="papers-kicker">Research Record</p>
    <h1>Papers & citations</h1>
    <p>Use this page to cite the published Local-MIP papers, the Local-ILP precursor, and the software version that matches the experiments you want to reproduce.</p>
  </div>
  <div class="papers-hero-facts" aria-label="Publication summary">
    <div><span>Journal</span><strong>Artificial Intelligence 2025</strong></div>
    <div><span>Conference</span><strong>CP 2024 Best Paper Award</strong></div>
    <div><span>Precursor</span><strong>Local-ILP arXiv 2023</strong></div>
    <div><span>Reproduction</span><strong>Local-MIP 1.0 archive</strong></div>
  </div>
</section>

<section id="citation-guidance" class="papers-panel papers-notice-panel">
  <div class="papers-section-heading">
    <span>Citation Guidance</span>
    <h2>Match the paper to the software version</h2>
  </div>
  <div class="papers-notice-grid">
    <article>
      <span>Published experiments</span>
      <p>The CP 2024 and Artificial Intelligence 2025 papers report experiments obtained with <strong>Local-MIP 1.0</strong>. Use the archived v1.0.1 release when reproducing those results.</p>
      <a href="{{ site.data.external_links.repository.archive_v1_0_1 }}">Open v1.0.1 archive</a>
    </article>
    <article>
      <span>Current software</span>
      <p>The current public repository provides the 2.x codebase with C++/Python APIs, callback hooks, examples, tests, and the MIT license. Cite the published papers for the Local-MIP algorithmic work, cite the Local-ILP preprint for the ILP-only precursor, and cite the repository when referring to the current software implementation.</p>
      <a href="{{ site.data.external_links.repository.home }}">Open GitHub repository</a>
    </article>
  </div>
</section>

<section id="publications" class="papers-panel papers-publications-panel">
  <div class="papers-section-heading">
    <span>Publications</span>
    <h2>Local-MIP publications and precursor</h2>
  </div>

  <article id="ai-2025" class="papers-publication papers-publication-featured">
    <div class="papers-publication-meta">
      <span>Journal Article</span>
      <strong>Artificial Intelligence, 2025</strong>
    </div>
    <div class="papers-publication-body">
      <h3>Local-MIP: Efficient local search for mixed integer programming</h3>
      <p class="papers-authors">Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin</p>
      <p>The journal article presents Local-MIP as an efficient local-search solver for mixed integer programming and is the primary citation for the published Local-MIP algorithmic work.</p>
      <div class="papers-link-row">
        <a href="https://doi.org/10.1016/j.artint.2025.104405">DOI</a>
        <a href="https://www.sciencedirect.com/science/article/pii/S0004370225001249">Publisher page</a>
      </div>
    </div>
  </article>

  <article id="cp-2024" class="papers-publication">
    <div class="papers-publication-meta">
      <span>Conference Paper</span>
      <strong>CP 2024 Best Paper Award</strong>
    </div>
    <div class="papers-publication-body">
      <h3>An Efficient Local Search Solver for Mixed Integer Programming</h3>
      <p class="papers-authors">Peng Lin, Mengchuan Zou, Shaowei Cai</p>
      <p>The CP 2024 paper is the conference version of the Local-MIP work and received the Best Paper Award at CP 2024.</p>
      <div class="papers-link-row">
        <a href="https://doi.org/10.4230/LIPIcs.CP.2024.19">DOI</a>
        <a href="https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CP.2024.19">Publisher page</a>
        <a href="{{ '/assets/pdf/best-paper.pdf' | relative_url }}">Award certificate</a>
      </div>
    </div>
  </article>

  <article id="local-ilp-arxiv" class="papers-publication">
    <div class="papers-publication-meta">
      <span>arXiv Preprint</span>
      <strong>arXiv:2305.00188</strong>
    </div>
    <div class="papers-publication-body">
      <h3>New Characterizations and Efficient Local Search for General Integer Linear Programming</h3>
      <p class="papers-authors">Peng Lin, Shaowei Cai, Mengchuan Zou, Jinkun Lin</p>
      <p>This preprint first introduces Local-ILP, the ILP-focused local-search solver that served as the precursor of Local-MIP.</p>
      <div class="papers-link-row">
        <a href="https://arxiv.org/abs/2305.00188">arXiv</a>
        <a href="https://doi.org/10.48550/arXiv.2305.00188">DOI</a>
      </div>
    </div>
  </article>
</section>



<section id="bibtex" class="papers-panel papers-bibtex-panel">
  <div class="papers-section-heading">
    <span>BibTeX</span>
    <h2>Copy citation entries</h2>
  </div>

  <article class="papers-bibtex-card">
    <h3>Artificial Intelligence 2025</h3>
    <div class="papers-bibtex-box" aria-label="Artificial Intelligence 2025 BibTeX entry">
      <span>@article{LIN2025104405,</span>
      <span>title = {Local-MIP: Efficient local search for mixed integer programming},</span>
      <span>journal = {Artificial Intelligence},</span>
      <span>volume = {348},</span>
      <span>pages = {104405},</span>
      <span>year = {2025},</span>
      <span>issn = {0004-3702},</span>
      <span>doi = {https://doi.org/10.1016/j.artint.2025.104405},</span>
      <span>author = {Peng Lin and Shaowei Cai and Mengchuan Zou and Jinkun Lin}</span>
      <span>}</span>
    </div>
  </article>

  <article class="papers-bibtex-card">
    <h3>CP 2024</h3>
    <div class="papers-bibtex-box" aria-label="CP 2024 BibTeX entry">
      <span>@InProceedings{lin_et_al:LIPIcs.CP.2024.19,</span>
      <span>author = {Lin, Peng and Zou, Mengchuan and Cai, Shaowei},</span>
      <span>title = {An Efficient Local Search Solver for Mixed Integer Programming},</span>
      <span>booktitle = {30th International Conference on Principles and Practice of Constraint Programming (CP 2024)},</span>
      <span>pages = {19:1--19:19},</span>
      <span>series = {Leibniz International Proceedings in Informatics (LIPIcs)},</span>
      <span>ISBN = {978-3-95977-336-2},</span>
      <span>ISSN = {1868-8969},</span>
      <span>year = {2024},</span>
      <span>volume = {307},</span>
      <span>editor = {Shaw, Paul},</span>
      <span>publisher = {Schloss Dagstuhl -- Leibniz-Zentrum f{\"u}r Informatik},</span>
      <span>address = {Dagstuhl, Germany},</span>
      <span>doi = {10.4230/LIPIcs.CP.2024.19},</span>
      <span>annote = {Keywords: Mixed Integer Programming, Local Search, Constraint Programming}</span>
      <span>}</span>
    </div>
  </article>

  <article class="papers-bibtex-card">
    <h3>Local-ILP arXiv</h3>
    <div class="papers-bibtex-box" aria-label="Local-ILP arXiv BibTeX entry">
      <span>@misc{lin2023newcharacterizationsefficientlocal,</span>
      <span>title = {New Characterizations and Efficient Local Search for General Integer Linear Programming},</span>
      <span>author = {Peng Lin and Shaowei Cai and Mengchuan Zou and Jinkun Lin},</span>
      <span>year = {2023},</span>
      <span>eprint = {2305.00188},</span>
      <span>archivePrefix = {arXiv},</span>
      <span>primaryClass = {math.OC},</span>
      <span>doi = {10.48550/arXiv.2305.00188},</span>
      <span>url = {https://arxiv.org/abs/2305.00188},</span>
      <span>note = {First submitted on 29 April 2023; introduces Local-ILP, the precursor of Local-MIP}</span>
      <span>}</span>
    </div>
  </article>
</section>

<section id="contact" class="papers-panel papers-contact-panel">
  <div class="papers-section-heading">
    <span>Contact</span>
    <h2>Questions about citations or reproduction</h2>
  </div>
  <div class="papers-contact-grid">
    <a href="mailto:peng.lin.csor@gmail.com"><span>Email</span><strong>peng.lin.csor@gmail.com</strong></a>
    <a href="{{ site.data.external_links.repository.issues }}"><span>GitHub</span><strong>Open an issue</strong></a>
    <a href="https://github.com/shaowei-cai-group/Local-MIP/discussions"><span>GitHub</span><strong>Start a discussion</strong></a>
  </div>
</section>

<nav class="papers-page-nav" aria-label="Papers page navigation">
  <a href="/"><span>Previous</span><strong>Home</strong></a>
  <a href="/miplib-records"><span>Next</span><strong>MIPLIB Records</strong></a>
</nav>

  </div>
</div>
