#import "../../xyndrome/lib.typ": *

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "鄭|恪|悠",
  ruby_name: "チェン|コッ|ヤオ",
  lang: "zh",
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
      label: "廣州，廣東",
    ),
    contact(
      icon: phone-icon(right-space: 0.2em),
      label: "(+86) 137-9409-1521",
    )
  ),
)

#sec-heading(icon: education-icon, title: "教育背景")

#edu(
  institution: "廣東工業大學",
  degree: "機械工程碩士",
  date: "2023年9月 - 2026年6月（預期）",
  details: [
    - *GPA:* 3.62/4.0（前2.5%），指導教師：#smallcaps("冷杰武")教授；
    - *學位論文:* _基於大型語言模型嘅序列式參數化CAD生成_，項目頁面：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    )。
  ],
) 

#edu(
  institution: "廣東財經大學",
  degree: "計算機科學學士",
  date: "2019年9月 - 2023年6月",
  details: [
    - *GPA*: 3.5/4.0（前5%）；
    - *畢業論文:* _基於深度強化學習嘅瑪利奧遊戲智能體設計同實現_，後續項目：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      )。
  ],
)

#sec-heading(icon: experience-icon, title: "研究經歷")

#exp(
  project: "序列式參數化CAD生成",
  role: "核心研究員",
  org: "製造裝備數字化國家工程研究中心",
  location: "廣州，中國",
  start: "2025年2月",
  end: "至今",
  details: [
    - 問題：手動需求→OpenSCAD編碼導致原型製作緩慢且參數一致性差。
    - 方法：草圖/規格嘅多模態解析；代碼合成嘅序列到序列微調；帶約束驗證器嘅工具使用規劃（幾何完整性檢查、公差斷言）。
    - 可靠性：確定性腳手架；CAD基元單元測試；故障恢復提示；人機協同審查UI。
    - 影響：內部基準測試中，喺設計師驗證下幾何精度提升40%（IoU/參數誤差），迭代時間減少60%。
    - 技術棧：Python、PyTorch、vLLM、OpenSCAD、形狀指標評估框架。
  ],
)

#exp(
  project: "自動色差控制同校準",
  role: "首席開發者",
  org: "Vograce（產學合作）",
  location: "義烏，浙江",
  start: "2024年12月",
  end: "2025年7月",
  details: [
    - 問題：個性化打印色彩重現唔一致，質量保證人工密集。
    - 方法：校準機器視覺採集；$Delta E$（CIEDE2000）計算，自適應sRGB↔CMYK反饋，操作員指導同審計追蹤。
    - 結果：檢測→推薦延遲降至約1秒/圖像；試點生產線運行效率比手動檢查提高約20倍。
    - 技術棧：Python/OpenCV、色彩科學庫、Gradio儀表板；同SOP檢查清單嘅運營集成。
  ],
)

#exp(
  project: "監管級化妝品合規助手",
  role: "開發者",
  org: "Vograce（產學合作）",
  location: "廣州，廣東",
  start: "2023年5月",
  end: "2023年7月",
  details: [
    - 目標：從單一產品材料（成分、注冊/備案記錄、標籤）出發，同法定文件同內部指南對比，生成可追溯、帶引用鏈接嘅合規提示。
    - RAG設計：
        - 知識庫：已解析嘅法規、行政措施同技術標準；標準化元數據（標題、條款、款項、版本、生效日期、來源URL）。
        - 分塊：層次化（章節→條款），512-1024標記窗口+重疊；保留條款ID用於引用。
        - 檢索：BM25+密集嵌入混合；MMR多樣性嘅top-k檢索；交叉編碼器重排序以提高precision@k。
        - 提示：基於角色嘅模板，包含需求分解；引用範圍嘅工具提示；範圍外請求嘅拒絕規則。
        - 追蹤：每個聲明嘅引用映射（條款/段落）、置信度標籤同理由摘要；可導出審計JSON。
    - 演示同運營：構建Gradio原型進行早期測試；添加批處理模式同法規變更嘅紅線差異；集成到前端審查隊列。
    - 影響：人工審查時間從每項約3分鐘減少到約1-2分鐘（提速約40-60%），同時提高可追溯性（每個建議都反向引用到條款級引用）。
    - 技術棧：Python、FAISS/elastic類檢索器（混合）、Gradio UI、提示工程；帶版本化知識庫同測試查詢嘅治理。
  ],
)

#sec-heading(icon: publication-icon, title: "發表論文")

#sec-heading(level: 2, title: "期刊論文")

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "AIGC賦能智能製造嘅綜述：涵蓋設計、規劃、生產同檢驗；綜合產業案例，概述使能模型（LLM、擴散、多模態）同集成模式（智能體、數字孿生），討論風險（知識產權、安全、評估），提出研究路線圖。",
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
  tldr: "引入大模型驅動嘅人機協同幾何建模智能體工作流：生成代碼到CAD、調用工具進行約束檢查，並通過專家反饋閉環；喺工業級幾何任務上進行驗證。",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

#sec-heading(icon: copyright-icon, title: "專利同著作權")

#sec-heading(level: 2, title: "專利")

#patent(
  number: "202410273298.7",
  title: "基於深度強化學習嘅柔性針穿刺路徑規劃",
  inventors: ("冷杰武", strong("鄭恪悠"), "鍾宇航", "謝佳倪", "李潤鵬", "徐誠", "劉慶"),
  filed: "2024年3月11日",
  status: "已公開",
  country: "中國"
)

#patent(
  number: "202410950697.2", 
  title: "服務交互情境下嘅交互抽取同需求-製造匹配",
  inventors: ("冷杰武", strong("鄭恪悠"), "謝佳倪", "李潤鵬", "徐誠", "劉慶"),
  filed: "2024年7月16日", 
  status: "已公開",
  country: "中國"
)

#patent(
  number: "202410368790.2",
  title: "製造業統一價值鏈中間件及其數字孿生系統",
  inventors: ("冷杰武", "鍾宇航", strong("鄭恪悠"), "李潤鵬", "徐誠", "劉慶"),
  filed: "2024年3月28日",
  status: "已公開",
  country: "中國"
)

#patent(
  number: "18/662,981",
  title: "基於多特徵並行多階段神經網絡（MF-PMSNN）嘅缺陷預測方法",
  inventors: ("冷杰武", "謝佳倪", strong("鄭恪悠"), "李潤鵬", "徐誠", "劉慶"),
  filed: "2024年5月13日",
  status: "已公開",
  country: "美國"
)

#v(0.5em)

#sec-heading(level: 2, title: "軟件著作權")

#copyright(
  title: "多特徵融合印刷色差檢測系統",
  year: "2025",
  status: "已授權",
  country: "中國",
  holders: (strong("鄭恪悠"), "鍾宇航", "冷杰武")
)

#copyright(
  title: "視覺智能化個性化印刷色差分析系統",
  year: "2025", 
  status: "已授權",
  country: "中國",
  holders: (strong("鄭恪悠"), "鍾宇航", "冷杰武")
)

#sec-heading(icon: skill-icon, title: "技能")

#skills(
  categories: (
    ("開發工具", ("VSCode", "Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("機器學習工具包", ("vLLM", "PyTorch", "CUDA", "MLX", "Gradio")),
    ("興趣愛好", ("字體排版", "平面設計", "UI/UX設計")),
    ("Web開發", ("Next.js", "Tailwind CSS", "Node.js")),
    ("編程語言", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("語言能力", (strong("英語（TOEFL: 114）"), strong("日語（N1）"), "中文&粵語（雙語）", "韓語（中級）")),
    ("軟技能", ("溝通交流", "團隊合作", "問題解決", "適應能力")),
  )
)

#sec-heading(icon: projects-icon, title: "項目")

#project(
  title: "SPADA",
  url: "https://github.com/Xeraphinite/spada",
  role: "核心開發者",
  org: "開源項目",
  start: "2025年",
  end: "至今",
  icon: spada-icon(),
  details: [
   - OpenSCAD一體化開發體驗友好工具包。
  ],
)

#sec-heading(icon: artifact-icon, title: "作品同演示")

#artifact(
  name: "Ringrad",
  tech: ("MLX", "Python"),
  description: "面向Apple Silicon嘅最小自動微分庫。",
  year: "2024年",
)

#artifact(
  name: "kits(une)",
  tech: ("vLLM", "TypeScript", "Next.js"),
  description: "LLM復現項目集合。",
  year: "2025年",
)

#artifact(
  name: "Xeraphinite",
  tech: ("Next.js", "Tailwind CSS"),
  description: "支持多語言同簡潔格式嘅Typst現代簡歷模板包。",
  year: "2024年",
)

#sec-heading(icon: award-icon, title: "獲獎情況")

#award(
  name: "國家獎學金",
  date: "2025年", 
  from: "中華人民共和國教育部",
  details: ""
)

#award(
  name: "學業優秀獎學金",
  date: "2024年，2025年",
  from: "廣東工業大學",
)

#award(
  name: "新生入學獎學金",
  date: "2023年",
  from: "廣東工業大學",
)

#award(
  name: "學業優秀獎學金",
  date: "2020年，2021年，2022年",
  from: "廣東財經大學",
)

#sec-heading(icon: serving-icon(), title: "服務經歷")

#serving(
  name: "海上絲綢之路國際產學研用合作會議",
  description: "作為國重實驗室核心成員，連續兩年參與國際會議嘅籌辦工作，主要負責參會嘉賓嘅信息核對與錄入、參會專家成員嘅接駁、會議物資嘅統籌配置及多個分會場嘅現場管理；與會議籌備組緊密合作，協助負責人進行跨部門溝通與流程跟進，確保咗嘉賓接待、會務執行等關鍵環節嘅順暢與高效。",
  date: "2023.12 & 2024.12"
)