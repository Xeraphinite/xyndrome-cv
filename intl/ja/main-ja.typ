#import "../../xyndrome/lib.typ": *

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "郑|恪|悠",
  ruby_name: "チェン|コッ|ヤオ",
  lang: "ja",
  contacts: (
    contact(
      icon: email-icon(right-space: 0.2em),
      label: `keyouzheng0915@gmail.com`,
      url: "mailto:keyouzheng0915@gmail.com",
    ),
    contact(
      icon: website-icon(right-space: 0.2em),
      label: `keyzh.pages.dev`,
      url: "https://keyzh.pages.dev",
    ),
    contact(
      icon: github-icon(right-space: 0.2em),
      label: `Xeraphinite`,
      url: "https://github.com/Xeraphinite",
    ),
    contact(
      icon: canton-tower-icon(right-space: 0.2em),
      label: "広州市、広東省",
    ),
    contact(
      icon: phone-icon(right-space: 0.2em),
      label: "(+86) 137-9409-1521",
    )
  ),
)

#sec-heading(icon: education-icon, title: "学歴")

#edu(
  institution: "広東工業大学",
  degree: "機械工学修士",
  date: "2023年9月 - 2026年6月（予定）",
  details: [
    - *GPA:* 3.62/4.0（上位2.5%）、指導教授：#smallcaps("冷杰武")教授；
    - *論文:* _大規模言語モデルによる系列ベースパラメトリックCAD生成_、プロジェクトページ：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    )。
  ],
) 

#edu(
  institution: "広東財経大学",
  degree: "コンピュータサイエンス学士",
  date: "2019年9月 - 2023年6月",
  details: [
    - *GPA*: 3.5/4.0（上位5%）；
    - *卒業論文:* _深層強化学習に基づくマリオゲームエージェントの設計と実装_、後継プロジェクト：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      )。
  ],
)

#sec-heading(icon: experience-icon, title: "研究経験")

#exp(
  project: "系列ベースパラメトリックCAD生成",
  role: "主任研究員",
  org: "製造技術・設備国家重点実験室",
  location: "広州、中国",
  start: "2025年2月",
  end: "現在",
  details: [
    - 課題：手動でのブリーフ→OpenSCADコーディングにより、プロトタイピングが遅延し、パラメトリクスの一貫性が欠如。
    - アプローチ：スケッチ/仕様のマルチモーダル解析；コード合成のためのseq2seqファインチューニング；制約検証器を使ったツール利用計画（幾何学的妥当性検査、公差アサーション）。
    - 信頼性：決定論的スキャフォールド；CADプリミティブの単体テスト；障害回復プロンプト；ヒューマンインザループレビューUI。
    - 効果：内部ベンチマークでデザイナー検証による幾何学精度+40%（IoU/パラメータエラー）と反復時間-60%。
    - 技術スタック：Python、PyTorch、vLLM、OpenSCAD、形状メトリクス評価ハーネス。
  ],
)

#exp(
  project: "自動色差制御・キャリブレーション",
  role: "主任開発者",
  org: "Vograce（産業連携）",
  location: "義烏、浙江省",
  start: "2024年12月",
  end: "2025年7月",
  details: [
    - 課題：パーソナライズ印刷で色再現の一貫性不足と労働集約的QA。
    - 手法：校正済みマシンビジョンキャプチャ；$Delta E$（CIEDE2000）計算、適応的sRGB↔CMYKフィードバック、オペレータガイダンスと監査証跡。
    - 結果：検出→推奨レイテンシが約1秒/画像まで短縮；パイロットライン実行で手動検査の約20倍効率化。
    - 技術スタック：Python/OpenCV、色科学ライブラリ、Gradioダッシュボード；SOPチェックリストとの運用統合。
  ],
)

#exp(
  project: "規制準拠化粧品コンプライアンスアシスタント",
  role: "開発者",
  org: "Vograce（産業連携）",
  location: "広州、広東省",
  start: "2023年5月",
  end: "2023年7月",
  details: [
    - 目的：単一製品資料（成分、登録/届出記録、ラベル）から、法定文書と内部ガイドラインと比較し、トレーサブルで引用リンク付きコンプライアンス提案を生成。
    - RAG設計：
        - 知識ベース：解析済み法令、行政措置、技術標準；正規化メタデータ（タイトル、条文、項目、版、効力発生日、ソースURL）。
        - チャンク化：階層的（セクション→項目）で512-1024トークンウィンドウ+オーバーラップ；項目IDを引用用に保持。
        - 検索：BM25+密ベクトル埋め込みのハイブリッド；MMR多様性によるtop-k検索；precision@kのためのクロスエンコーダー再ランキング。
        - プロンプト：要件分解を含む役割基盤テンプレート；引用スパンのツールヒント；範囲外問い合わせの拒否ルール。
        - トレーシング：クレームごとの引用マッピング（条文/段落）、信頼度タグ、根拠要約；監査JSON出力可能。
    - デモ・運用：初期テスト用Gradioプロトタイプ構築；バッチモードと変更法令の赤線差分追加；フロントエンドレビューキューに統合。
    - 効果：平均人的レビュー時間が項目あたり約3分から約1-2分に短縮（約40-60%高速化）、トレーサビリティ向上（すべての提案が項目レベル引用に逆参照）。
    - 技術スタック：Python、FAISS/elasticsearch系検索器（ハイブリッド）、Gradio UI、プロンプトエンジニアリング；バージョン管理KBとテストクエリによるガバナンス。
  ],
)

#sec-heading(icon: publication-icon, title: "発表論文")

#sec-heading(level: 2, title: "学術雑誌論文")

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "スマート製造のためのAIGC調査：設計、計画、生産、検査全般；産業事例の統合、有効化モデル（LLM、拡散、マルチモーダル）と統合パターン（エージェント、デジタルツイン）の概説、リスク（IP、安全性、評価）の議論、研究ロードマップの提案。",
  pdf: "",
)

#paper(
  type: "journal",
  authors: (strong("Zheng K."), "Zhong Y.", "Su X.", "Leng J.*", "Liu Q.", "Chen X"),
  title: "Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling",
  venue: "Applied Soft Computing",
  published: "2025",
  metadata: "JCR Q1, IF: 6.6",
  DOI: "10.1016/j.asoc.2025.113920",
  tldr: "幾何学モデリングのための大規模モデル駆動ヒューマンインザループエージェントワークフローの紹介：コードからCADへの生成、制約チェックのためのツール呼び出し、専門家フィードバックによるループクローズ；産業レベル幾何学タスクでの実証。",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

#sec-heading(icon: copyright-icon, title: "特許・著作権")

#sec-heading(level: 2, title: "特許")

#patent(
  number: "202410273298.7",
  title: "深層強化学習に基づく柔軟針穿刺経路計画",
  inventors: ("冷杰武", strong("郑恪悠"), "钟宇航", "谢佳倪", "李润鹏", "徐诚", "刘庆"),
  filed: "2024年3月11日",
  status: "公開",
  country: "中国"
)

#patent(
  number: "202410950697.2", 
  title: "サービスインタラクションコンテキストからのインタラクション抽出と需要-製造マッチング",
  inventors: ("冷杰武", strong("郑恪悠"), "谢佳倪", "李润鹏", "徐诚", "刘庆"),
  filed: "2024年7月16日", 
  status: "公開",
  country: "中国"
)

#patent(
  number: "202410368790.2",
  title: "製造のための統一バリューチェーンミドルウェアとそのデジタルツインシステム",
  inventors: ("冷杰武", "钟宇航", strong("郑恪悠"), "李润鹏", "徐诚", "刘庆"),
  filed: "2024年3月28日",
  status: "公開",
  country: "中国"
)

#patent(
  number: "18/662,981",
  title: "マルチ特徴並列マルチステージニューラルネットワーク（MF-PMSNN）に基づく欠陥予測手法",
  inventors: ("冷杰武", "谢佳倪", strong("郑恪悠"), "李润鹏", "徐诚", "刘庆"),
  filed: "2024年5月13日",
  status: "公開",
  country: "アメリカ"
)

#v(0.5em)

#sec-heading(level: 2, title: "ソフトウェア著作権")

#copyright(
  title: "マルチ特徴融合印刷色差検出システム",
  year: "2025",
  status: "承認済み",
  country: "中国",
  holders: (strong("郑恪悠"), "钟宇航", "冷杰武")
)

#copyright(
  title: "ビジョンインテリジェンスベースパーソナライズ印刷色差分析システム",
  year: "2025", 
  status: "承認済み",
  country: "中国",
  holders: (strong("郑恪悠"), "钟宇航", "冷杰武")
)

#sec-heading(icon: skill-icon, title: "技能")

#skills(
  categories: (
    ("開発ツール", ("VSCode", "Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("MLツールキット", ("vLLM", "PyTorch", "CUDA", "MLX", "Gradio")),
    ("興味・趣味", ("タイポグラフィ", "グラフィックデザイン", "UI/UXデザイン")),
    ("Web開発", ("Next.js", "Tailwind CSS", "Node.js")),
    ("プログラミング言語", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("言語", (strong("英語（TOEFL: 114）"), strong("日本語（N1）"), "中国語・広東語（バイリンガル）", "韓国語（中級）")),
    ("ソフトスキル", ("コミュニケーション", "チームワーク", "問題解決", "適応力")),
  )
)

#sec-heading(icon: projects-icon, title: "プロジェクト")

#project(
  title: "SPADA",
  url: "https://github.com/Xeraphinite/spada",
  role: "主任開発者",
  org: "オープンソース",
  start: "2025年",
  end: "現在",
  icon: spada-icon(),
  details: [
   - OpenSCAD用オールインワン開発者体験フレンドリーキット。
  ],
)

#sec-heading(icon: artifact-icon, title: "成果物・デモ")

#artifact(
  name: "Ringrad",
  tech: ("MLX", "Python"),
  description: "Apple Silicon対応最小自動微分ライブラリ。",
  year: "2024年",
)

#artifact(
  name: "kits(une)",
  tech: ("vLLM", "TypeScript", "Next.js"),
  description: "LLM再現プロジェクトコレクション。",
  year: "2025年",
)

#artifact(
  name: "Xeraphinite",
  tech: ("Next.js", "Tailwind CSS"),
  description: "多言語対応とクリーンフォーマット機能を持つTypst用モダンCV テンプレートパッケージ。",
  year: "2024年",
)

#sec-heading(icon: award-icon, title: "受賞歴")

#award(
  name: "国家奨学金",
  date: "2025年", 
  from: "中華人民共和国教育部",
  details: ""
)

#award(
  name: "学術優秀奨学金",
  date: "2024年、2025年",
  from: "広東工業大学",
)

#award(
  name: "新入生入学奨学金",
  date: "2023年",
  from: "広東工業大学",
)

#award(
  name: "学術優秀奨学金",
  date: "2020年、2021年、2022年",
  from: "広東財経大学",
)

#sec-heading(icon: serving-icon(), title: "奉仕活動")

#serving(
  name: "海上シルクロード国際産学研用協力会議",
  description: "国家重点実験室の中核メンバーとして、2年連続で国際会議の企画運営業務に参加。参加来賓の情報確認・登録、専門家メンバーの送迎、会議資材の統括配置、複数の分科会の現場管理を主に担当。会議準備グループと緊密に連携し、責任者による部門間コミュニケーションと進捗管理を支援し、来賓接待・会議運営等の重要な部分の円滑かつ高効率な実施を確保。",
  date: "2023.12 & 2024.12"
)