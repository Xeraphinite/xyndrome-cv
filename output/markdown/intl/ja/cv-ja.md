<!-- Generated from config/intl/ja/cv-ja.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 広州市、広東省

大規模言語モデルとAI駆動の設計自動化を専門とする、主体性の高い機械工学修士課程修了見込み者です。Code-CAD生成、エージェント型ワークフロー、産業応用向けHuman-in-the-loopシステムを中心に研究してきました。深層学習、フルスタック開発、DevOpsで実績があり、AIによる設計・製造技術の高度化を目指して博士課程進学の機会を希望しています。

## 学歴

### 北海道大学（QS 世界大学ランキング上位 200 位）

コンピュータサイエンス 博士 · 2027年4月 - 2030年4月（修了見込み）

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0（上位2.5%）、指導教員 Jiewu Leng;;
- *Dissertation:* _検証器駆動の大規模言語モデルエージェントによるコードベース・パラメトリックCAD生成_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0（上位5%）;
- *Thesis:* _深層強化学習に基づくMarioゲームエージェントの設計と実装_.

## 研究経験

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Aug 2025 – Present

実行可能な制約条件下で、制御可能なコードベースCAD生成のための検証可能ベンチマークとLLMエージェントを構築しました。

- *エージェント基盤*: 固定ツールチェーンと再現可能実行を備えた_多言語・コンテナ化コード実行サンドボックス_を構築しました。大規模実験の可観測性のため、複数のエージェント軌跡と失敗を収集する_水平スケーラブル_なバックエンドを設計し、迅速なデバッグと成果物生成向けに_軽量Webプレイグラウンド_も実装しました。
- *ベンチマーク構築*: 公開リポジトリとCADコミュニティから収集した20万件の人手CADコードコーパスを基に、大規模ベンチマークを構築しました。_決定論的・ヒューリスティック規則_（例: あいまい重複排除）とLLMパイプラインを用いて_データ汚染を低減_し_課題難易度を制御_、ゴールデン参照ワークスペースと実行可能テスト付きで単体部品1万件・アセンブリ1,700件を作成しました。
- *エージェント設計*: 自己テストと自己修復を通じてCADプログラムを生成・編集するLLM _アーキテクチャ_を設計しました。単一ファイル前提の従来手法と異なり、アセンブリ向けマルチファイル環境で `spec`、`inspect`、`verify` などのツールを用い、クローズドループで修正を誘導できます。
- *評価と結果*: 実行可能テストを主要指標として制約充足度を評価しました。アセンブリ課題で本手法は pass rate 54.2%、all-tests success 41.9%、invalid output 2.4% を達成し、幾何忠実性を保ちながら制約充足でベースラインを上回りました。
- *成果*: _43rd International Conference on Machine Learning_（*ICML 2026*）に論文1本を投稿し、査読中です。

### Human-in-the-loop CAD Generation Workflow

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Dec 2024 – May 2025

コードの妥当性と人間の嗜好を維持できる、コードベースCAD生成向けHITLエージェントワークフローを設計しました。

- *ワークフロー設計*: 微調整済み `Qwen2.5-VL-7B` をバックボーンとして採用し、意図明確化・妥当性検証・反復改善・メモリ・安全ゲーティングを含む複数のワークフローパターンを組み合わせてコード生成を行いました。
- *結果*: 実世界モデル200件で invalid rate と専門家ペアワイズ Elo を用いて評価し、invalid rate 2%・Elo 1075.5 で最高性能を達成。Claude、GPT-4o、非エージェントQwenのベースラインを上回りました。
- *成果*: 論文1本が _Applied Soft Computing_ に掲載されました。

## 発表論文

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 特許・著作権

### 特許

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

### ソフトウェア著作権

1. **Multi-feature fusion print color difference detection system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

2. **Vision intelligence-based personalized print color difference analysis system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

## プロジェクト

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

カスタム印刷生産におけるクローズドループ色一貫性制御のため、マシンビジョンパイプラインを構築しました。

- *取得と検出*: 照明条件と素材反射が変化する環境下でも多様な印刷パターンを扱えるよう、光学取得環境を設計し、特徴マッチング整列とROI抽出を実装して堅牢な $Delta E$（CIEDE2000）算出を実現しました。
- *アルゴリズム*: sRGB計測値をCMYK空間へ変換し、適応的反復ステップ幅フィードバックを適用して、測定色差をオペレータが実行可能なインク量調整提案へ変換しました。
- *結果*: `Gradio` による高速プロトタイピングと反復改善を通じて、検出-提案パイプライン全体を1画像あたり≤1秒に最適化し、パイロットラインで手動色合わせより20倍以上高速化しました。最終的に `Next.js` + `FastAPI` のフルスタックとして本番導入可能な形に実装しました。
- *成果*: ソフトウェア著作権を2件取得しました。

## スキル

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## 受賞歴

- **National Scholarship** — Ministry of Education, China · 2025 · 上位2%

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
