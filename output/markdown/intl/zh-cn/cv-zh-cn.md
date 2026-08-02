<!-- Generated from config/intl/zh-cn/cv-zh-cn.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠 · _求职意向_ 博士机会

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 广州，广东

本人为机械工程硕士应届毕业生，专注于大语言模型与 AI 驱动的设计自动化。研究方向涵盖代码式 CAD 生成、Agent 工作流以及面向工业场景的人在回路系统。在深度学习、全栈开发与 DevOps 方面具备扎实实践与成果。当前正在申请博士机会，期望进一步推动 AI 赋能设计与制造技术发展。

## 教育经历

### Hokkaido University (QS Top 200)

Computer Science and Technology, PhD · Apr 2027 - Apr 2030 (Expected)

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0（前 2.5%），导师 Jiewu Leng;;
- *Dissertation:* _验证器驱动的大语言模型 Agent 代码式参数化 CAD 生成_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0（前 5%）;
- *Thesis:* _基于深度强化学习的 Mario 游戏智能体设计与实现_.

## 研究经历

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Aug 2025 – Present

面向可执行约束条件，构建了可控代码式 CAD 生成的可验证基准与 LLM Agent。

- *Agent 基础设施*: 构建了具备固定工具链与可复现实验环境的_多语言容器化代码执行沙箱_。设计了可_横向扩展_的后端，用于采集多条 Agent 轨迹与失败日志以支撑大规模实验可观测性；同时实现了用于快速调试和产物生成的_轻量级 Web Playground_。
- *基准构建*: 基于从公开仓库与 CAD 社区收集的 20 万规模人工 CAD 代码语料，构建了大规模基准。结合_确定性与启发式规则_（如模糊去重）及 LLM 流水线，_降低数据污染_并_控制任务难度_；最终产出 1 万个单零件任务和 1700 个装配任务，并配套黄金参考工作区与可执行测试。
- *Agent 设计*: 设计了通过自测试与自修复生成/编辑 CAD 程序的 LLM _架构_。不同于仅支持单文件的既有方法，该 Agent 可在装配场景的多文件工作区中调用 `spec`、`inspect`、`verify` 等工具，实现闭环修复。
- *评测与结果*: 以可执行测试作为核心指标评估约束满足率。在装配任务上，本方法取得 54.2% pass rate、41.9% all-tests success、2.4% 无效输出，并在保持几何保真度的同时于约束满足方面优于基线。
- *成果*: 1 篇论文已投稿至 _43rd International Conference on Machine Learning_（*ICML 2026*）并在审。

### Human-in-the-loop CAD Generation Workflow

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Dec 2024 – May 2025

设计了用于代码式 CAD 生成的 HITL Agent 工作流，在保证代码有效性的同时兼顾人类偏好。

- *工作流设计*: 以微调后的 `Qwen2.5-VL-7B` 为骨干，融合多种代码生成工作流模式，覆盖意图澄清、有效性校验、迭代优化、记忆与安全门控。
- *结果*: 在 200 个真实模型上以无效率和专家成对 Elo 评估，达到 2% 无效率与 1075.5 Elo 的最优表现，优于 Claude、GPT-4o 及非 Agent 的 Qwen 基线。
- *成果*: 1 篇论文已发表在 _Applied Soft Computing_。

## 发表论文

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 专利与著作权

### 专利

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

### 软件著作权

1. **Multi-feature fusion print color difference detection system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

2. **Vision intelligence-based personalized print color difference analysis system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

## 项目经历

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

构建了用于定制化印刷生产闭环色彩一致性控制的机器视觉流水线。

- *采集与检测*: 设计光学采集环境并实现特征匹配对齐与 ROI 提取，以适应不同光照和材料反射条件下的多样化印刷图案，实现稳健的 $Delta E$（CIEDE2000）计算。
- *算法*: 将 sRGB 测量值映射到 CMYK 空间，并采用自适应迭代步长反馈机制，把测得色差转化为可执行的油墨量调整建议供机台操作员使用。
- *结果*: 通过 `Gradio` 快速原型与多轮迭代，将完整“检测-推荐”流水线优化到 ≤1 秒/张，在试产线中相较人工校色提速超过 20 倍；并进一步以 `Next.js` + `FastAPI` 构建全栈生产系统，支持企业部署。
- *成果*: 已获得 2 项软件著作权授权。

## Artifacts

- **Ringrad.** 面向 Apple Silicon 的极简自动微分实验项目. MLX, Python · 2024.

- **kits(une).** 围绕大语言模型工作流的复现与整合项目集合. vLLM, TypeScript, Next.js · 2025.

- **Xyndrome CV.** 支持多语言配置与统一样式体系的简历模板项目. Typst, TOML, Multilingual · 2025.

## 技能

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## 获奖情况

- **National Scholarship** — Ministry of Education, China · 2025 · 前 2%

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
