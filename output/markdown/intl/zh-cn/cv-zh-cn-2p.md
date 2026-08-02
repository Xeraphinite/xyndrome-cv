<!-- Generated from config/intl/zh-cn/cv-zh-cn-2p.toml by scripts/generate_markdown.py. -->

# 郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 广东广州

## 教育经历

### 北海道大学（QS 前 200），计算机科学与技术

博士 · 2027 年 4 月 - 2030 年 4 月（预计）

### 广东工业大学, 机械工程

硕士 · 2023 年 9 月 - 2026 年 6 月

- *GPA*: 3.62/4.0（前 2.5 %）
- *毕业论文*: 基于代码生成-测试-修复智能迭代的可控参数化几何设计方法

### 广东财经大学, 计算机科学与技术（实验班）

学士 · 2019 年 9 月 - 2023 年 6 月

- *GPA:* 3.5/4.0（前 5 %）；
- *毕业论文*: _基于深度强化学习的马里奥游戏智能体设计与实现_

## 项目经历

### 可控参数化几何模型设计

负责人 · 精密电子制造技术与装备国家重点实验室, 广东广州 · 2025.8 – 至今

围绕可执行代码约束，构建了面向可控代码式 CAD 生成的可验证基准、以及基于大语言模型的智能体。

- *基础设施*: 使用 `Docker` 构建了具备固定工具链与可复现实验环境的多语言容器化代码执行沙箱。为满足大规模实验的要求，设计了鲁棒性较强的评测基建，采集多条轨迹、失败记录等；为快速进行端对端测试，实现了轻量级的 Web 和 TUI 应用。
- *基准数据集构建*: 从公开仓库与 CAD 社区收集的 20 万规模的人工 CAD 代码语料构建基准数据集，结合确定性、启发式规则、和 LLM 驱动的数据处理流水线，减轻数据污染、控制任务难度；最终产出约 1 万个单零件任务和 1700 个装配任务。
- *智能体实现*: 使用 `OpenHands` 实现了程序生成智能体。既有方法仅支持单文件生成，该智能体可在装配场景的多文件工作区中调用预先设计的工具，准确理解语义、以支持复杂装配零件的生成。
- *评测与结果*: 以测试为核心指标评估约束满足率。在自建基准数据集上，方法取得 `54.2%` 通过率、`41.9%` 全测试通过率和 `2.4%` 无效输出率，并在保持几何保真度的同时，于约束满足度方面优于其他基线算法。
- *研究成果*: 以第一作者身份，投稿 1 篇论文至机器学习顶会 *ICML 2026* (CCF-A, 已接收) 。

### 自动化色差控制与校准

主要开发者 · 浙江世赞工艺品有限公司, 浙江义乌 · 2024 年 12 月 – 2025 年 7 月

构建了用于定制印刷生产闭环色彩一致性控制的机器视觉流水线。

- *采集与检测*: 合作设计并搭建了用于图像采集的标准化暗室平台，包含布置光源固定位置、产品传动结构等；使用 `OpenCV` 实现特征匹配对齐与 ROI 提取，以适应不同光照和材料反射条件下的多样化印刷图案，为后续色差分析提供稳定输入。
- *算法设计*: 将 sRGB 测量值映射到印刷品实际使用的 CMYK 色彩空间，实现稳健的 $Delta E$（CIEDE2000）计算；基于计算得到的 $Delta E$ 采用自适应迭代步长反馈机制，转化为印刷操作员可执行的墨量调整建议。
- *结果*: 通过 `Gradio` 快速原型与多轮迭代，将完整检测-推荐流水线优化到 ≤1 秒/张，在试产线中相较人工校色提速超过 20 倍；并进一步以 `Next.js` 和 `FastAPI` 构建全栈生产系统，支持企业部署。
- *成果*: 已获得 2 项软件著作权授权。

## 论文发表

1. **SPADA: A Verifiable Test-Driven Agent for Controllable Parametric CAD Assembly Generation**

   Zheng K., Su X., Leng J.\*

   *The Forty-Third International Conference on Machine Learning (ICML 2026)* · 2026 · CCF-A

2. **Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

3. **AIGC-empowered Smart Manufacturing: Prospects and Challenges**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4, Highly Cited Paper

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 专利与软件著作权

### 专利

1. **一种基于深度强化学习的柔性针穿刺路径规划方法**

   冷杰武, 郑恪悠, 钟元蔚, 等

   202410273298.7 · CN · 2024-03-11

2. **一种基于服务交互上下文的交互提取与需求制造匹配方法**

   冷杰武, 郑恪悠, 钟元蔚, 等

   202410950697.2 · CN · 2024-07-16

3. **一种面向制造业的统一价值链中间件及其数字孪生系统**

   冷杰武, 钟元蔚, 郑恪悠, 等

   202410368790.2 · CN · 2024-03-28

4. **Defect Prediction Methods Based on Multi-Parallel Multi-Stage Neural Network (MF-PMSNN)**

   Leng J., Xie J., Zheng K., Li R., Xu C., Liu Q.

   18/662,981 · US · 2024-05-13 · Disclosed

### 软件著作权

1. **多特征融合印刷色差检测系统**

   郑恪悠

   中国 · 2025 · 已授权

2. **基于视觉智能的个性化印刷色差分析系统**

   郑恪悠

   中国 · 2025 · 已授权

## 技能

- **AI 工程:** Unsloth, TRL, LlamaFactory, OpenHands, vLLM, PyTorch

- **编码 / DevOps:** VSCode, Git, CLI, Codex, Claude Code, Docker, Azure

- **前端:** JavaScript, Next.js, Tailwind CSS, Vite

- **后端:** FastAPI, Node.js, MySQL, PostgreSQL

- **程序语言:** Python, TypeScript, JavaScript, Rust, C++, C

- **自然语言:** 英语 (TOEFL: 90, CET-6), 日语 (JLPT N1), 粤语 (母语), 韩语（基础）

## 获奖情况

- **国家奖学金** — 中国教育部 · 2025

- **学业优秀奖学金** — 广东工业大学 · 2023, 2024, 2025

- **学业优秀奖学金** — 广东财经大学 · 2020, 2021, 2022

- **米亚奖学金** — 广东工业大学 · 2026
