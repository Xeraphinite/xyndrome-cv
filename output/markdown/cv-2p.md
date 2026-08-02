<!-- Generated from config/cv-2p.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · Guangzhou, Guangdong

Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies.

## Education

### Hokkaido University (QS Top 200)

Computer Science and Technology, PhD · Apr 2027 - Apr 2030 (Expected)

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0 (Top 2.5%), Supervised by Prof. Jiewu Leng;;
- *Dissertation:* _A Verifier-Driven LLM Agent for Code-based Parametric CAD Generation_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0 (Top 5%);
- *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_.

## Publications

1. **SPADA: A Verifiable Test-Driven Agent for Controllable Parametric CAD Assembly Generation**

   Zheng K., Su X., Leng J.\*

   *The Forty-Third International Conference on Machine Learning (ICML 2026)* · 2026 · CCF-A

2. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

3. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4, Highly Cited Paper

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## Research Experience

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Aug 2025 – Present

Built a verifiable benchmark and an LLM agent for controllable code-based CAD generation under executable constraints.

- *Agent Infra*: Built a _multi-language, containerized code execution sandbox_ with pinned toolchains and reproducible runs. Designed a _horizontally scalable_ backend which captures multiple agent trajectories and failures for large-scale experiment observability. Also built a _lightweight web playground_ and _TUI_ for fast iterating.
- *Benchmark Construction*: Built a large-scale benchmark from a 200k human CAD code corpus collected from public repos and CAD communities. Filtered with _deterministic and heuristic rules_ (e.g., fuzzy deduplication), and an LLM-based pipeline to _reduce data contamination_ and _control task difficulty_. Produced 10k single-part tasks and 1.7k assembly tasks with golden reference workspaces and executable tests.
- *Agent Design*: Designed _architecture_ for LLMs to generate and edit CAD programs through self-testing and self-repairing. Different from prior methods that only work in a single file, the agent could use specific tools (e.g., `spec`, `inspect`, `verify`) in multi-file workspace for assemblies following a state-machine to generate controllable code.
- *Evaluation and Results*: Used executable tests as the primary measure to calculate constraint satisfaction. On assembly tasks, our method achieved 54.2% pass rate, 41.9% all-tests success, and 2.4% invalid outputs with competitive geometry scores, outperforming baselines on constraint satisfaction while keeping geometry fidelity.
- *Outcome*: First-author paper accepted at the _43rd International Conference on Machine Learning_ (*ICML 2026*).

### Human-in-the-loop CAD Generation Workflow

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Dec 2024 – May 2025

Designed a HITL agentic workflow for Code-based CAD generation maintaining code validity and human preference.

- *Workflow design*: Used fine-tuned `Qwen2.5-VL-7B` as a backbone, combining multiple workflow design patterns for code generation, with intent clarification, validity checks, iterative refinement, memory, and safety gating.
- *Results*: Evaluated on 200 real-world models using invalid rate and expert pairwise Elo; achieved best performance at 2% invalid rate and 1075.5 Elo, outperforming Claude, GPT-4o, and non-agent Qwen baselines.
- *Outcome*: One paper was published at _Applied Soft Computing_.

## Projects

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

Built a machine-vision pipeline for closed-loop color consistency control in customized print production.

- *Capture & Detection*: Designed the optical acquisition environment and built feature-matching alignment with ROI extraction to handle diverse print patterns under varying lighting and material reflectance, enabling robust $Delta E$ (CIEDE2000) computation.
- *Algorithm*: Converted sRGB measurements to CMYK space and applied adaptive iterative step-size feedback to translate measured color differences into actionable ink-level adjustment recommendations for press operators.
- *Results*: Rapidly prototyped with `Gradio` through extensive iteration cycles, optimized the full detect-and-recommend pipeline to ≤1 s/image—over 20× faster than manual color grading in pilot line runs. Productionized as a full-stack system built with `Next.js` and `FastAPI` for enterprise deployment.
- *Outcome*: Received two authorized software copyrights.

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

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## Awards

- **National Scholarship (TOP 1.5%)** — Ministry of Education, China · 2025

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
