<!-- Generated from config/cv-1p.toml by scripts/generate_markdown.py. -->

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
- *Dissertation:* _Verifier-Driven Code-based Parametric CAD Generation with Large Language Models Agent_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0 (Top 5%);
- *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_.

## Selected Project

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, China · Aug 2025 – Present

**Stack:** vLLM, OpenHands, Docker, Kubernetes, Laminar

Built a verifiable benchmark and an LLM agent for controllable code-based CAD generation under executable constraints.

- *Agent Infra*: Built a _multi-language, containerized code execution sandbox_ with pinned toolchains and reproducible runs. Designed a _horizontally scalable_ backend which captures multiple agent trajectories and failure for large-scale experiment observability. Also built a _lightweight web playground_ for fast debugging and artifacts generating.
- *Benchmark Construction*: Built an benchmark from a 200k human CAD code corpus collected from public repos and CAD communities. Filtered with _deterministic and heuristic rules_ (e.g., fuzzy deduplication), and an LLM-based pipeline to _reduce data contamination and control task difficulty_. Produced 10k single-part tasks and 1.7k assembly tasks with golden reference workspaces and executable tests.
- *Agent Design*: Designed _architecture_ for LLMs to generate or edit CAD programs through self-testing and self-repairing. Different from prior method that only work in one-file, the agent could use specific tools (e.g., `spec` tool for extracting specification from natural language)  in multi-file workspaces for assemblies, which guiding fixes in a closed-loop.
- *Evaluation and Results*: Used executable tests as the primary measure to calculate constraint satisfaction. On assembly tasks, our method achieved 54.2% pass rate, 41.9% all-tests success, and 2.4% invalid outputs with competitive geometry scores, outperforming prior LLM-only (e.g., GPT-5) and tool-based baselines on constraint satisfaction while keeping geometry fidelity.
- *Outcome*: First-author paper accepted at the _43rd International Conference on Machine Learning_ (*ICML 2026*).

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

## Skills

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

## Awards

- **National Scholarship (TOP 2%)** — Ministry of Education, China · 2025

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
