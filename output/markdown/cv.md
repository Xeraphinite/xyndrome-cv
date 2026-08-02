<!-- Generated from config/cv.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · (+86) 137-9409-1521 · Guangzhou, Guangdong

Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies.

## Education

### Hokkaido University (QS Top 200)

Computer Science and Technology, PhD · Apr 2027 - Apr 2030 (Expected)

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0 (Top 2.5%), Supervised by Prof. Jiewu Leng;;
- *Dissertation:* _Verifier-Driven Code-based Parametric CAD Generation with Large Language Models Agent_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0 (Top 5%, Rank 3/52);
- *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_

## Highlighted Projects

### Controllable Code-based CAD Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, China · Mar 2025 – Present

A benchmark and a performant LLM-agent satisfying verifiable constraints for Code-based CAD.

- *Problem*: Code-based CAD is a great alternative for mainstream CAD format, as its expressive and easy-edit native. But it is challenging to ensure code quality while keeping constraint satisfaction in complex design (e.g., assemblies).
- *Infra*: Built a full-stack system to support the full ecosystem from data curating to evaluation. Built a scalable
- *Benchmark Curation*: Collected 200k corpus from multiple sources (e.g., GitHub Repo, 3D communities), filtered with both deterministic rules (e.g., deduplications, PII removal) and LLM-based heuristics (e.g., rubric-based grading on code quality). To prevent data quality issues (e.g., containmination, hardness), we used LLM to rewrite the .  Finally, the benchmark obtained 10k parts and 1.7k assemblies with golden references.
- *Agent Design*: We designed a simple yet effective tool-augmennted agent:
- *Reliability-first generation loop*: Turn briefs into constraints, execute candidates, read failures, and repair until checks pass.
- *Results*: Invalid rate 1.8% (parts) and 2.4% (assemblies). All-check pass rate +17.1 points for parts (52.3%) and +21.5 points for assemblies (41.9% vs 20.4% best baseline). Shape overlap 78.9 (parts). Pass rate 65.7% (parts) and 54.2% (assemblies).
- *Outcome*: First-author paper accepted at the _43rd International Conference on Machine Learning_ (*ICML 2026*).

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

Quick Prototyping in Automated Color Difference Control & Calibration.

- Problem: Personalized printing had inconsistent color reproduction and labor-heavy QA.
- Method: Calibrated machine-vision capture; $Delta E$ (CIEDE2000) computation, adaptive sRGB↔CMYK feedback, operator guidance and audit trails.
- Result: Detection→recommendation latency ↓ to ~1 s/image; ≈20× efficiency vs. manual inspection in pilot line runs.
- Stack: Python/OpenCV, color science libs, Gradio dashboards; Ops integration with SOP checklists.

## Publications

1. **SPADA: A Verifiable Test-Driven Agent for Controllable Parametric CAD Assembly Generation**

   Zheng K., Su X., Leng J.\*

   *The Forty-Third International Conference on Machine Learning (ICML 2026)* · 2026 · CCF-A

2. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

   Introduces a human-in-the-loop agentic workflow for geometric modelling, demonstrated on real-world design tasks.

3. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4, Highly Cited Paper

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

   In-depth survey of Generative AI for smart manufacturing across full product lifecycle.

## Patents & Copyrights

### Patents

1. **Flexible needle puncture path planning based on deep reinforcement learning**

   Leng J., Zheng K., Zhong Y., Xie J., Li R., Xu C., Liu Q.

   202410273298.7 · CN · 2024-03-11 · Disclosed

2. **Interaction extraction and demand–manufacturing matching from service interaction context**

   Leng J., Zheng K., Xie J., Li R., Xu C., Liu Q.

   202410950697.2 · CN · 2024-07-16 · Disclosed

3. **Unified value-chain middleware for manufacturing and its digital-twin system**

   Leng J., Zhong Y., Zheng K., Li R., Xu C., Liu Q.

   202410368790.2 · CN · 2024-03-28 · Disclosed

4. **Defect prediction methods based on multi-feature parallel multi-stage neural network (MF-PMSNN)**

   Leng J., Xie J., Zheng K., Li R., Xu C., Liu Q.

   18/662,981 · US · 2024-05-13 · Disclosed

### Software Copyrights

1. **Multi-feature fusion print color difference detection system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

2. **Vision intelligence-based personalized print color difference analysis system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

## Skills

- **Programming:** Python, TypeScript, JavaScript, Rust, C/C++ (Sort in Efficiency)

- **AI Engineering:** vLLM, TRL, Tinker, OpenHands, PyTorch, CUDA

- **Frontend & Web:** Next.js, Tailwind CSS, UnoCSS, Vite, Node.js

- **DevTools:** Codex CLI, VSCode, Git, LaTeX, Docker, CI/CD

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## Awards

- **National Scholarship (TOP 0.1%)** — Ministry of Education, China · 2025

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
