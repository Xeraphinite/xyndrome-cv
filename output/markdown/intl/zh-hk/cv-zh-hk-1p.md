<!-- Generated from config/intl/zh-hk/cv-zh-hk-1p.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

鄭恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 中國廣東廣州

本人為自驅型機械工程碩士應屆畢業生，專注於大型語言模型同 AI 驅動設計自動化。研究方向涵蓋程式化 CAD 生成、Agent 工作流，以及面向工業應用嘅人在回路系統。喺深度學習、全端開發同 DevOps 方面具備扎實經驗，現正申請博士機會，希望繼續推進 AI 賦能設計與製造技術。

## 教育背景

### 北海道大學（QS 世界大學排名前 200）

計算機科學與技術博士 · 2027 年 4 月 - 2030 年 4 月（預計）

### 廣東工業大學

機械工程碩士 · 2023 年 9 月 - 2026 年 6 月

- *GPA:* 3.62/4.0（前 2.5%），導師為 Jiewu Leng;;
- *畢業論文：* _驗證器驅動嘅大型語言模型 Agent 程式化參數化 CAD 生成_。

### 廣東財經大學

計算機科學與技術學士 · 2019 年 9 月 - 2023 年 6 月

- *GPA:* 3.5/4.0（前 5%）；
- *畢業論文：* _基於深度強化學習嘅 Mario 遊戲智能體設計與實現_。

## 代表項目

### 程式化 CAD 裝配生成

負責人 · 製造技術與裝備國家重點實驗室, 中國廣州 · 2025 年 8 月 – 至今

**Stack:** vLLM, OpenHands, Docker, Kubernetes, Laminar

圍繞可執行約束，構建咗面向可控程式化 CAD 生成嘅可驗證基準同 LLM Agent。

- *Agent 基礎設施：* 構建咗具備固定工具鏈同可重現實驗環境嘅_多語言容器化程式碼執行沙箱_。設計咗可_橫向擴展_嘅後端，用於收集多條 Agent 軌跡同失敗記錄，以支撐大規模實驗可觀測性；同時實現咗用於快速除錯同產物生成嘅_輕量 Web Playground_。
- *基準構建：* 基於從公開倉庫同 CAD 社群收集嘅 20 萬規模人工 CAD 程式碼語料構建基準。結合_確定性與啟發式規則_（例如模糊去重）同 LLM 流程，_降低數據污染並控制任務難度_；最終產出 1 萬個單零件任務同 1700 個裝配任務，並配套黃金參考工作區同可執行測試。
- *Agent 設計：* 設計咗透過自測試同自修復生成或編輯 CAD 程式嘅 LLM _架構_。唔同於只支援單檔嘅既有方法，呢個 Agent 可以喺裝配場景嘅多檔工作區中調用特定工具（例如用於由自然語言抽取規格嘅 `spec` 工具），從而實現閉環修復。
- *評測與結果：* 以可執行測試作為核心指標評估約束滿足率。喺裝配任務上，本方法取得 54.2% 通過率、41.9% 全測試通過率同 2.4% 無效輸出率，並喺保持幾何保真度嘅同時，於約束滿足方面優於既有純 LLM（如 GPT-5）同工具增強基線。
- *成果：* 1 篇論文已投稿至 _第 43 屆國際機器學習大會_（*ICML 2026*）並在審。

## 發表論文

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 技能

- **AI 工程:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **語言:** *英文（TOEFL：90）*, *日文（N1：134）*, 中文同粵語（母語）, 韓文（基礎）

- **前端:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps 同後端:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

## 獲獎情況

- **國家獎學金（前 2%）** — 中國教育部 · 2025

- **學業優秀獎學金** — 廣東工業大學 · 2023, 2024, 2025

- **米亞獎學金** — 廣東工業大學 · 2026

- **學業優秀獎學金** — 廣東財經大學 · 2020, 2021, 2022
