<!-- Generated from config/intl/zh-hk/cv-zh-hk.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

鄭恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 廣州，廣東

本人為機械工程碩士應屆畢業生，專注於大型語言模型同 AI 驅動嘅設計自動化。研究方向涵蓋程式化 CAD 生成、Agent 工作流，以及面向工業場景嘅人在回路系統。喺深度學習、全端開發同 DevOps 方面具備扎實實踐同成果。現正申請博士機會，希望進一步推動 AI 賦能設計與製造技術發展。

## 教育背景

### 北海道大學（QS 世界大學排名前 200）

計算機科學與技術博士 · 2027 年 4 月 - 2030 年 4 月（預計）

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0（前 2.5%），導師 Jiewu Leng;;
- *Dissertation:* _驗證器驅動嘅大型語言模型 Agent 程式化參數 CAD 生成_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0（前 5%）;
- *Thesis:* _基於深度強化學習嘅 Mario 遊戲智能體設計與實現_.

## 研究經歷

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Aug 2025 – Present

面向可執行約束條件，構建咗可控程式化 CAD 生成嘅可驗證基準同 LLM Agent。

- *Agent 基礎設施*: 構建咗具備固定工具鏈同可重現實驗環境嘅_多語言容器化程式碼執行沙箱_。設計咗可_橫向擴展_嘅後端，用於收集多條 Agent 軌跡同失敗日誌，以支撐大規模實驗可觀測性；同時實現咗用於快速除錯同產物生成嘅_輕量 Web Playground_。
- *基準構建*: 基於從公開倉庫同 CAD 社群收集嘅 20 萬規模人工 CAD 程式碼語料，構建咗大規模基準。結合_確定性與啟發式規則_（如模糊去重）同 LLM 流程，_降低數據污染_並_控制任務難度_；最終產出 1 萬個單零件任務同 1700 個裝配任務，並配套黃金參考工作區同可執行測試。
- *Agent 設計*: 設計咗透過自測試同自修復來生成/編輯 CAD 程式嘅 LLM _架構_。唔同於只支援單檔嘅既有方法，呢個 Agent 可以喺裝配場景嘅多檔工作區中調用 `spec`、`inspect`、`verify` 等工具，實現閉環修復。
- *評測與結果*: 以可執行測試作為核心指標評估約束滿足率。喺裝配任務上，本方法取得 54.2% pass rate、41.9% all-tests success、2.4% 無效輸出，並喺保持幾何保真度嘅同時喺約束滿足方面優於基線。
- *成果*: 1 篇論文已投稿至 _43rd International Conference on Machine Learning_（*ICML 2026*）並在審。

### Human-in-the-loop CAD Generation Workflow

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Dec 2024 – May 2025

設計咗用於程式化 CAD 生成嘅 HITL Agent 工作流，喺保障程式碼有效性嘅同時兼顧人類偏好。

- *工作流設計*: 以微調後嘅 `Qwen2.5-VL-7B` 作為骨幹，融合多種程式碼生成工作流模式，涵蓋意圖澄清、有效性校驗、迭代優化、記憶同安全門控。
- *結果*: 喺 200 個真實模型上以無效率同專家成對 Elo 評估，達到 2% 無效率同 1075.5 Elo 嘅最佳表現，優於 Claude、GPT-4o 同非 Agent 嘅 Qwen 基線。
- *成果*: 1 篇論文已發表於 _Applied Soft Computing_。

## 發表論文

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 專利與著作權

### 專利

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

### 軟件著作權

1. **Multi-feature fusion print color difference detection system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

2. **Vision intelligence-based personalized print color difference analysis system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

## 項目經歷

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

構建咗用於定制印刷生產閉環色彩一致性控制嘅機器視覺流程。

- *採集與檢測*: 設計光學採集環境並實現特徵匹配對齊同 ROI 提取，以適應唔同光照同材料反射條件下嘅多樣化印刷圖案，實現穩健嘅 $Delta E$（CIEDE2000）計算。
- *算法*: 將 sRGB 測量值映射到 CMYK 空間，並採用自適應迭代步長反饋機制，將量測色差轉化為機台操作員可執行嘅墨量調整建議。
- *結果*: 透過 `Gradio` 快速原型同多輪迭代，將完整「檢測-建議」流程優化到 ≤1 秒/張，喺試產線相對人工校色提速超過 20 倍；並進一步以 `Next.js` + `FastAPI` 構建全端生產系統，支援企業部署。
- *成果*: 已獲得 2 項軟件著作權授權。

## 技能

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## 獲獎情況

- **National Scholarship** — Ministry of Education, China · 2025 · 前 2%

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
