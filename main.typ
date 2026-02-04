#import "xyndrome/lib.typ": *

// 
#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "郑|恪|悠",
  ruby_name: "チェン|コッ|ヤオ",
  lang: "en",
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
      label: "Guangzhou, Guangdong",
    ),
    contact(
      icon: phone-icon(right-space: 0.2em),
      label: "(+86) 137-9409-1521",
    )
  ),
)

// #sec-heading(icon: summary-icon(), title: "Summary") 

// _Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies._

#sec-heading(icon: education-icon, title: "Education")

// #badge(label: "hello", icon: education-icon)

#edu(
  institution: "Guangdong University of Technology",
  degree: "Mechanical Engineering, MEng.",
  date: "Sep 2023 - Jun 2026 (Expected)",
  details: [
    - *GPA:* 3.62/4.0 (Top 2.5%), Supervised by Prof. #smallcaps("Jiewu Leng");
    - *Dissertation:* _Code-based Parametric CAD Generation with Large Language Models_
    //   project page at #link-with-icon(
    //     icon: github-line-icon,
    //     url: "https://github.com/Xeraphinite/spada",
    //     text: `Xeraphinite/spada`,
    // ).
  ],
) 

#edu(
  institution: "Guangdong University of Finance and Economics",
  degree: "Computer Science, BEng.",
  date: "Sep 2019 - Jun 2023",
  details: [
    - *GPA*: 3.5/4.0 (Top 5%);
    - *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_
      //  a _*reincarnation*_  project is available at #link-with-icon(
      //   icon: github-line-icon,
      //   url: "https://github.com/Xeraphinite/Mario-RL",
      //   text: `Xeraphinite/Mario-RL`,
      // ).
  ],
)


#sec-heading(icon: experience-icon, title: "Research Experience")

#exp(
  project: "Controllable Code-based CAD Generation",
  role: "Core Researcher",
  org: "State Key Lab of Manufacturing Technology & Equipment",
  location: "Guangzhou, China",
  start: "Mar 2025",
  end: "Present",
  details: [
    - *Stack*: Python, #link-with-icon(url:"https://github.com/vllm-project/vllm", text: "vLLM"), #link-with-icon(url: "https://openhands.dev/", text: "OpenHands"), Harbor, 
    - *Problem*: 
    - *Approach*: Built a test-driven agent pipeline that turns natural-language into a structured spec, generates multi-file CAD workspaces, and iterates using multimodal feedback and quantitative test diagnostics.
    - *Verification*: Designed deterministic unit tests as an executable contract, covering (i) interface/signature checks, (ii) geometry validity checks (e.g., manifold status, bounding box limits), and (iii) assembly constraint checks, with stable pass/fail outcomes across runs.
    - *Benchmarking*: Curated an execution-based benchmark of real human-written CAD workspaces across OpenSCAD, CadQuery, and Build123d, paired with golden references and deterministic verifier suites to enable objective evaluation beyond visual similarity.
    - *Results*: On SPADA-Bench-Verified, reduced invalid generations to ~1–3% and improved strict constraint satisfaction (APR) by +17.1 percentage points for parts and +21.5 percentage points for assemblies (41.9% vs 20.4% best zero-shot); also improved geometric fidelity under the same execution harness.
    - #strong("Paper under review (ICML 2026 submission).")
  ],
)

// #paper(
//   type: "conference",
//   authors: (strong("Zheng K."), "Su X.", "Leng J.*"),
//   title: "SPADA: A Verifiable Test-Driven Agent for Controllable Parametric CAD Assembly Generation",
//   venue: "Under Review, ICML 2026",
//   published: "2025",
//   tldr: "Comprehensive review of AIGC techniques for visual quality inspection; proposes a unified framework integrating data augmentation, defect detection, and report generation; presents a case study demonstrating improved inspection accuracy and efficiency in manufacturing settings.",
//   pdf: "",
// )

// #exp(
//   project: "Automated Color Difference Control & Calibration",
//   role: "Lead Developer",
//   org: "Vograce (Industry Collaboration)",
//   location: "Yiwu, Zhejiang",
//   start: "Dec 2024",
//   end: "Jul 2025",
//   details: [
//     - Problem: Personalized printing had inconsistent color reproduction and labor-heavy QA.
//     - Method: Calibrated machine-vision capture; $Delta E$ (CIEDE2000) computation, adaptive sRGB↔CMYK feedback, operator guidance and audit trails.
//     - Result: Detection→recommendation latency ↓ to ~1 s/image; ≈20× efficiency vs. manual inspection in pilot line runs.
//     - Stack: Python/OpenCV, color science libs, Gradio dashboards; Ops integration with SOP checklists.
//   ],
// )

// #exp(
//   project: "Regulatory-Grade Cosmetics Compliance Assistant",
//   role: "Intern",
//   org: "",
//   location: "Guangzhou, Guangdong",
//   start: "May 2023",
//   end: "Jul 2023",
//   details: [
//     - Objective: From single-product materials (ingredients, registration/filing records, labels), compare against statutory documents and internal guidelines to produce traceable, cite-linked compliance prompts.
//     - RAG Design:
//         - Knowledge base: parsed statutes, administrative measures, and technical standards; normalized metadata (title, article, clause, version, effective date, source URL).  
//         - Chunking: hierarchical (section→clause) with 512–1024 token windows + overlap; clause IDs preserved for citations.  
//         - Retrieval: hybrid BM25 + dense embeddings; top-k retrieval with MMR diversity; cross-encoder re-ranking for precision\@k.  
//         - Prompting: role-grounded templates with requirement decomposition; tool hints for citation spans; refusal rules for out-of-scope asks.  
//         - Tracing: per-claim citation mapping (article/paragraph), confidence tags, and rationale summaries; exportable audit JSON.
//     - Demo & Ops: Built a Gradio prototype for early testing; added batch mode and redline diffs for changed statutes; integrated to front-end review queue.
//     - Impact: Average human review time reduced from ~3 min to ~1–2 min per item (≈40–60% faster) while improving traceability (every suggestion back-referenced to clause-level citations).
//     - Stack: Python, FAISS/elastic-like retriever (hybrid), Gradio UI, prompt engineering; governance with versioned KB and test queries.
//   ],
// )


#sec-heading(icon: publication-icon, title: "Publications")

// #sec-heading(level: 2, title: "Journal Papers")

#paper(
  type: "journal",
  authors: (strong("Zheng K."), "Zhong Y.", "Su X.", "Leng J.*", "Liu Q.", "Chen X"),
  title: "Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling",
  venue: "Applied Soft Computing",
  published: "2025",
  metadata: "JCR Q1, IF: 6.6",
  DOI: "10.1016/j.asoc.2025.113920",
  tldr: "Introduces a human-in-the-loop agentic workflow for geometric modelling: LLMs generate code-to-CAD, invoke tools for constraint checking, and close the loop with expert feedback; demonstrated on real-world geometry tasks.",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "Survey of AIGC for smart manufacturing across design, planning, production, and inspection; synthesizes industrial cases, outlines enabling models and integration patterns, discusses risks, and proposes a research roadmap.",
  pdf: "https://www.sciencedirect.com/science/article/pii/S0736584525001309",
)


// *Under Review*

#sec-heading(icon: copyright-icon, title: "Patents & Copyrights")

#sec-heading(level: 2, title: "Patents")

// Disclosed, Granted
#patent(
  number: "202410273298.7",
  title: "Flexible needle puncture path planning based on deep reinforcement learning",
  inventors: ("Leng, J.", strong("Zheng, K."), "Zhong, Y.", "Xie, J.", "Li R.", "Xu C.", "Liu Q."),
  filed: "2024-03-11",
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "202410950697.2", 
  title: "Interaction extraction and demand–manufacturing matching from service interaction context",
  inventors: ("Leng, J.", strong("Zheng, K."), "Xie, J.", "Li R.", "Xu C.", "Liu Q."),
  filed: "2024-07-16", 
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "202410368790.2",
  title: "Unified value-chain middleware for manufacturing and its digital-twin system",
  inventors: ("Leng, J.", "Zhong, Y.", strong("Zheng, K."), "Li R.", "Xu C.", "Liu Q."),
  filed: "2024-03-28",
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "18/662,981",
  title: "Defect prediction methods based on multi-feature parallel multi-stage neural network (MF-PMSNN)",
  inventors: ("Leng, J.", "Xie, J.", strong("Zheng, K."), "Li R.", "Xu C.", "Liu Q."),
  filed: "2024-05-13",
  status: "Disclosed",
  country: "US"
)

#v(0.5em)

#sec-heading(level: 2, title: "Software Copyrights")

#copyright(
  title: "Multi-feature fusion print color difference detection system",
  year: "2025",
  status: "Authorized",
  country: "China",
  holders: (strong("Zheng K."), "Zhong Y.", "Leng J.")
)

#copyright(
  title: "Vision intelligence-based personalized print color difference analysis system",
  year: "2025", 
  status: "Authorized",
  country: "China",
  holders: (strong("Zheng K."), "Zhong Y.", "Leng J.",)
)


#sec-heading(icon: projects-icon, title: "Projects")

#project(
  title: "SPADA",
  // role: "Core Developer",
  org: "Open Source",
  // start: "2025",
  // end: "Present",
  icon: spada-icon(),

)

#sec-heading(icon: skill-icon, title: "Skills")

#skills(
  categories: (
    ("Languages", (strong("English (TOEFL: 90)"), strong("Japanese (N1: 130)"), "Chinese & Cantonese (native)", "Korean (basic)")),
    ("AI Engineering", ("Inference: vLLM", "RL/Fine-tuning")),
    ("General DevTools", ("Codex CLI", "VSCode", "Git", "LaTeX", "Docker", "CI/CD")),
    ("Web Dev", ("Next.js", "Tailwind CSS", "Node.js")),
    ("Programming", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("Interests", ("Typography", "Graphic Design", "UI/UX Design")),
    // ("Soft Skills", ("Communication", "Teamwork", "Problem Solving", "Adaptability")),
  )
)

// #sec-heading(icon: artifact-icon, title: "Artifacts & Demos")

// #artifact(
//   name: "Ringrad",
//   tech: ("MLX", "Python"),
//   description: "A minimal automatic differentiation library with Apple Silicon.",
//   year: "2024",
// )

// #artifact(
//   name: "kits(une)",
//   tech: ("vLLM", "TypeScript", "Next.js"),
//   description: "Collection of reproduced projects for LLMs.",
//   year: "2025",
// )

// #artifact(
//   name: "Xeraphinite",
//   tech: ("Next.js", "Tailwind CSS"),
//   description: "A modern CV template package for Typst with multilingual support and clean formatting.",
//   year: "2024",
// )

#sec-heading(icon: award-icon, title: "Awards")

#award(
  name: "National Scholarship",
  date: "2025", 
  from: "Ministry of Education, China",
  details: ""
)

#award(
  name: "Scholarship in Academic Excellence",
  date: "2024, 2025",
  from: "Guangdong University of Technology",
)

// #award(
//   name: "Freshman Entrance Scholarship",
//   date: "2023",
//   from: "Guangdong University of Technology",
// )

#award(
  name: "Scholarship in Academic Excellence",
  date: "2020, 2021, 2022",
  from: "Guangdong University of Finance & Economics",
)

// #sec-heading(icon: serving-icon(), title: "Serving")

// #serving(
//   name: "Silk Road International Industry-University-Research Cooperation Conference",
//   description: "Volunteer",
//   date: "2023, 2024"
// )
