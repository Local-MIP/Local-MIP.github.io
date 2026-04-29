---
layout: default
title: MIPLIB Records
description: Local-MIP reported 10 new best-known solutions on MIPLIB 2017 open instances, as published in the Artificial Intelligence 2025 paper.
keywords: MIPLIB records, MIP benchmark, mixed integer programming, local search, optimization records, MIPLIB 2017, open instances
---

<div class="doc-layout">
  <nav class="doc-sidebar" aria-label="MIPLIB records navigation">
    <div class="doc-sidebar-title">On this page</div>
    <ul class="doc-sidebar-list">
      <li><a href="#overview">Overview</a></li>
      <li><a href="#records">Records</a></li>
      <li><a href="#related-resources">Resources</a></li>
    </ul>
  </nav>

  <div class="doc-content papers-content" markdown="1">
# MIPLIB Records

<section id="overview" class="papers-hero">
  <div class="papers-hero-copy">
    <p class="papers-kicker">Benchmark Results</p>
    <h1>MIPLIB open-instance records</h1>
    <p>The AIJ 2025 paper reported 10 new best-known solutions on MIPLIB 2017 open instances. Open instances are the most challenging problems in MIPLIB, where the optimal solution has not yet been proven.</p>
  </div>
  <div class="papers-hero-facts" aria-label="Result summary">
    <div><span>Instances</span><strong>10 new best-known</strong></div>
    <div><span>Benchmark</span><strong>MIPLIB 2017 Open</strong></div>
    <div><span>Source</span><strong>Artificial Intelligence, 2025</strong></div>
  </div>
</section>

<section id="records" class="papers-panel papers-records-panel">
  <div class="papers-section-heading">
    <span>Records</span>
    <h2>New best-known solutions</h2>
  </div>
  <p class="papers-panel-intro">All instances come from the MIPLIB 2017 open set. All objectives are minimization (larger negative values are better). The "Previous best" column shows the best-known value before Local-MIP. Individual records may have been matched or improved by later solvers; check the <a href="https://miplib.zib.de">MIPLIB website</a> for the current state.</p>
  <div class="mr-table-wrap">
    <table class="mr-table">
      <thead>
        <tr>
          <th>Instance</th>
          <th class="mr-num">Variables</th>
          <th class="mr-num">Constraints</th>
          <th>Constraint types</th>
          <th class="mr-num">Previous best</th>
          <th class="mr-num mr-highlight">Local-MIP</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_sorrell7.html">sorrell7</a></td>
          <td class="mr-num">2,048</td>
          <td class="mr-num">78,848</td>
          <td>variable bound</td>
          <td class="mr-num">-196</td>
          <td class="mr-num mr-highlight"><strong>-197</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_genus-sym-g31-8.html">genus-sym-g31-8</a></td>
          <td class="mr-num">3,484</td>
          <td class="mr-num">32,073</td>
          <td>knapsack, etc.</td>
          <td class="mr-num">-21</td>
          <td class="mr-num mr-highlight"><strong>-23</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_supportcase22.html">supportcase22</a></td>
          <td class="mr-num">7,129</td>
          <td class="mr-num">260,602</td>
          <td>mixed binary, etc.</td>
          <td class="mr-num">N/A&dagger;</td>
          <td class="mr-num mr-highlight"><strong>117</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_cdc7-4-3-2.html">cdc7-4-3-2</a></td>
          <td class="mr-num">11,811</td>
          <td class="mr-num">14,478</td>
          <td>set packing</td>
          <td class="mr-num">-289</td>
          <td class="mr-num mr-highlight"><strong>-294</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_genus-sym-g62-2.html">genus-sym-g62-2</a></td>
          <td class="mr-num">12,912</td>
          <td class="mr-num">78,472</td>
          <td>set partitioning, etc.</td>
          <td class="mr-num">-34</td>
          <td class="mr-num mr-highlight"><strong>-38</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_genus-g61-25.html">genus-g61-25</a></td>
          <td class="mr-num">14,380</td>
          <td class="mr-num">94,735</td>
          <td>cardinality, etc.</td>
          <td class="mr-num">-34</td>
          <td class="mr-num mr-highlight"><strong>-40</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_ns1828997.html">ns1828997</a></td>
          <td class="mr-num">27,275</td>
          <td class="mr-num">81,725</td>
          <td>precedence, etc.</td>
          <td class="mr-num">9</td>
          <td class="mr-num mr-highlight"><strong>8</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_neos-4232544-orira.html">neos-4232544-orira</a></td>
          <td class="mr-num">87,060</td>
          <td class="mr-num">180,600</td>
          <td>aggregations, etc.</td>
          <td class="mr-num">17,540,506</td>
          <td class="mr-num mr-highlight"><strong>15,108,527.5</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_scpm1.html">scpm1</a></td>
          <td class="mr-num">500,000</td>
          <td class="mr-num">5,000</td>
          <td>set covering</td>
          <td class="mr-num">554</td>
          <td class="mr-num mr-highlight"><strong>544</strong></td>
        </tr>
        <tr>
          <td><a href="https://miplib.zib.de/instance_details_scpn2.html">scpn2</a></td>
          <td class="mr-num">1,000,000</td>
          <td class="mr-num">5,000</td>
          <td>set covering</td>
          <td class="mr-num">501</td>
          <td class="mr-num mr-highlight"><strong>490</strong></td>
        </tr>
      </tbody>
    </table>
  </div>
  <p class="mr-footnote">&dagger; First-ever feasible solution found for this instance.</p>
</section>

<section id="related-resources" class="papers-panel papers-resources-panel">
  <div class="papers-section-heading">
    <span>Resources</span>
    <h2>Related documentation and benchmarks</h2>
  </div>
  <div class="papers-resource-grid">
    <a href="https://miplib.zib.de"><span>Benchmark</span><strong>MIPLIB Website</strong></a>
    <a href="/papers"><span>Publications</span><strong>Papers</strong></a>
    <a href="/software"><span>Releases</span><strong>Software</strong></a>
    <a href="/tutorials"><span>Guides</span><strong>Tutorials</strong></a>
    <a href="/quick-start"><span>Setup</span><strong>Quick Start</strong></a>
    <a href="/examples"><span>Code</span><strong>Examples</strong></a>
  </div>
</section>

<nav class="papers-page-nav" aria-label="MIPLIB Records page navigation">
  <a href="/papers"><span>Previous</span><strong>Papers</strong></a>
  <a href="/"><span>Next</span><strong>Home</strong></a>
</nav>

  </div>
</div>
