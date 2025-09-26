#import "../../xyndrome/lib.typ": *

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "郑|恪|悠",
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
      label: "广州，广东",
    ),
    contact(
      icon: phone-icon(right-space: 0.2em),
      label: "(+86) 137-9409-1521",
    )
  ),
)

#sec-heading(icon: education-icon, title: "教育经历")

#edu(
  institution: "广东工业大学",
  degree: "机械工程硕士",
  date: "2023年9月 - 2026年6月（预期）",
  details: [
    - *GPA:* 3.62/4.0（前2.5%），指导教师：#smallcaps("冷杰武")教授；
    - *学位论文:* _基于大型语言模型的序列式参数化CAD生成_，项目页面：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    )。
  ],
) 

#edu(
  institution: "广东财经大学",
  degree: "计算机科学学士",
  date: "2019年9月 - 2023年6月",
  details: [
    - *GPA*: 3.5/4.0（前5%）；
    - *毕业论文:* _基于深度强化学习的马里奥游戏智能体设计与实现_，后续项目：#link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      )。
  ],
)

#sec-heading(icon: experience-icon, title: "研究经历")

#exp(
  project: "序列式参数化CAD生成",
  role: "核心研究员",
  org: "制造装备数字化国家工程研究中心",
  location: "广州，中国",
  start: "2025年2月",
  end: "至今",
  details: [
    - 问题：手动需求→OpenSCAD编码导致原型制作缓慢且参数一致性差。
    - 方法：草图/规格的多模态解析；代码合成的序列到序列微调；带约束验证器的工具使用规划（几何完整性检查、公差断言）。
    - 可靠性：确定性脚手架；CAD基元单元测试；故障恢复提示；人机协同审查UI。
    - 影响：内部基准测试中，在设计师验证下几何精度提升40%（IoU/参数误差），迭代时间减少60%。
    - 技术栈：Python、PyTorch、vLLM、OpenSCAD、形状指标评估框架。
  ],
)

#exp(
  project: "自动色差控制与校准",
  role: "首席开发者",
  org: "Vograce（产学合作）",
  location: "义乌，浙江",
  start: "2024年12月",
  end: "2025年7月",
  details: [
    - 问题：个性化打印色彩重现不一致，质量保证人工密集。
    - 方法：校准机器视觉采集；$Delta E$（CIEDE2000）计算，自适应sRGB↔CMYK反馈，操作员指导和审计追踪。
    - 结果：检测→推荐延迟降至约1秒/图像；试点生产线运行效率比手动检查提高约20倍。
    - 技术栈：Python/OpenCV、色彩科学库、Gradio仪表板；与SOP检查清单的运营集成。
  ],
)

#exp(
  project: "监管级化妆品合规助手",
  role: "开发者",
  org: "Vograce（产学合作）",
  location: "广州，广东",
  start: "2023年5月",
  end: "2023年7月",
  details: [
    - 目标：从单一产品材料（成分、注册/备案记录、标签）出发，与法定文件和内部指南对比，生成可追溯、带引用链接的合规提示。
    - RAG设计：
        - 知识库：已解析的法规、行政措施和技术标准；标准化元数据（标题、条款、款项、版本、生效日期、来源URL）。
        - 分块：层次化（章节→条款），512-1024标记窗口+重叠；保留条款ID用于引用。
        - 检索：BM25+密集嵌入混合；MMR多样性的top-k检索；交叉编码器重排序以提高precision@k。
        - 提示：基于角色的模板，包含需求分解；引用范围的工具提示；范围外请求的拒绝规则。
        - 追踪：每个声明的引用映射（条款/段落）、置信度标签和理由摘要；可导出审计JSON。
    - 演示与运营：构建Gradio原型进行早期测试；添加批处理模式和法规变更的红线差异；集成到前端审查队列。
    - 影响：人工审查时间从每项约3分钟减少到约1-2分钟（提速约40-60%），同时提高可追溯性（每个建议都反向引用到条款级引用）。
    - 技术栈：Python、FAISS/elastic类检索器（混合）、Gradio UI、提示工程；带版本化知识库和测试查询的治理。
  ],
)

#sec-heading(icon: publication-icon, title: "发表论文")

#sec-heading(level: 2, title: "期刊论文")

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "AIGC赋能智能制造的综述：涵盖设计、规划、生产和检验；综合产业案例，概述使能模型（LLM、扩散、多模态）和集成模式（智能体、数字孪生），讨论风险（知识产权、安全、评估），提出研究路线图。",
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
  tldr: "引入大模型驱动的人机协同几何建模智能体工作流：生成代码到CAD、调用工具进行约束检查，并通过专家反馈闭环；在工业级几何任务上进行验证。",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

#sec-heading(icon: copyright-icon, title: "专利与著作权")

#sec-heading(level: 2, title: "专利")

#patent(
  number: "202410273298.7",
  title: "基于深度强化学习的柔性针穿刺路径规划",
  inventors: ("冷杰武", strong("郑恪悠"), "钟宇航", "谢佳倪", "李润鹏", "徐诚", "刘庆"),
  filed: "2024年3月11日",
  status: "已公开",
  country: "中国"
)

#patent(
  number: "202410950697.2", 
  title: "服务交互情境下的交互抽取与需求-制造匹配",
  inventors: ("冷杰武", strong("郑恪悠"), "谢佳倪", "李润鹏", "徐诚", "刘庆"),
  filed: "2024年7月16日", 
  status: "已公开",
  country: "中国"
)

#patent(
  number: "202410368790.2",
  title: "制造业统一价值链中间件及其数字孪生系统",
  inventors: ("冷杰武", "钟宇航", strong("郑恪悠"), "李润鹏", "徐诚", "刘庆"),
  filed: "2024年3月28日",
  status: "已公开",
  country: "中国"
)

#patent(
  number: "18/662,981",
  title: "基于多特征并行多阶段神经网络（MF-PMSNN）的缺陷预测方法",
  inventors: ("冷杰武", "谢佳倪", strong("郑恪悠"), "李润鹏", "徐诚", "刘庆"),
  filed: "2024年5月13日",
  status: "已公开",
  country: "美国"
)

#v(0.5em)

#sec-heading(level: 2, title: "软件著作权")

#copyright(
  title: "多特征融合印刷色差检测系统",
  year: "2025",
  status: "已授权",
  country: "中国",
  holders: (strong("郑恪悠"), "钟宇航", "冷杰武")
)

#copyright(
  title: "视觉智能化个性化印刷色差分析系统",
  year: "2025", 
  status: "已授权",
  country: "中国",
  holders: (strong("郑恪悠"), "钟宇航", "冷杰武")
)

#sec-heading(icon: skill-icon, title: "技能")

#skills(
  categories: (
    ("开发工具", ("VSCode", "Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("机器学习工具包", ("vLLM", "PyTorch", "CUDA", "MLX", "Gradio")),
    ("兴趣爱好", ("字体排版", "平面设计", "UI/UX设计")),
    ("Web开发", ("Next.js", "Tailwind CSS", "Node.js")),
    ("编程语言", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("语言能力", (strong("英语（TOEFL: 114）"), strong("日语（N1）"), "中文&粤语（双语）", "韩语（中级）")),
    ("软技能", ("沟通交流", "团队合作", "问题解决", "适应能力")),
  )
)

#sec-heading(icon: projects-icon, title: "项目")

#project(
  title: "SPADA",
  url: "https://github.com/Xeraphinite/spada",
  role: "核心开发者",
  org: "开源项目",
  start: "2025年",
  end: "至今",
  icon: spada-icon(),
  details: [
   - OpenSCAD一体化开发体验友好工具包。
  ],
)

#sec-heading(icon: artifact-icon, title: "作品与演示")

#artifact(
  name: "Ringrad",
  tech: ("MLX", "Python"),
  description: "面向Apple Silicon的最小自动微分库。",
  year: "2024年",
)

#artifact(
  name: "kits(une)",
  tech: ("vLLM", "TypeScript", "Next.js"),
  description: "LLM复现项目集合。",
  year: "2025年",
)

#artifact(
  name: "Xeraphinite",
  tech: ("Next.js", "Tailwind CSS"),
  description: "支持多语言和简洁格式的Typst现代简历模板包。",
  year: "2024年",
)

#sec-heading(icon: award-icon, title: "获奖情况")

#award(
  name: "国家奖学金",
  date: "2025年", 
  from: "中华人民共和国教育部",
  details: ""
)

#award(
  name: "学业优秀奖学金",
  date: "2024年，2025年",
  from: "广东工业大学",
)

#award(
  name: "新生入学奖学金",
  date: "2023年",
  from: "广东工业大学",
)

#award(
  name: "学业优秀奖学金",
  date: "2020年，2021年，2022年",
  from: "广东财经大学",
)

#sec-heading(icon: serving-icon(), title: "服务经历")

#serving(
  name: "海上丝绸之路国际产学研用合作会议",
  description: "作为国重实验室核心成员，连续两年参与国际会议的筹办工作，主要负责参会嘉宾的信息核对与录入、参会专家成员的接驳、会议物资的统筹配置及多个分会场的现场管理；与会议筹备组紧密合作，协助负责人进行跨部门沟通与流程跟进，确保了嘉宾接待、会务执行等关键环节的顺畅与高效。",
  date: "2023.12 & 2024.12"
)