#import "xyndrome/lib.typ": *

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  // original_name: "郑恪悠",
  lang: "en",
  contacts: (
    contact(
      icon: email-icon,
      label: `keyouzheng0915@gmail.com`,
      url: "mailto:keyouzheng0915@gmail.com",
    ),
    contact(
      icon: website-icon,
      label: `keyzh.pages.dev`,
      url: "https://keyzh.pages.dev",
    ),
    contact(
      icon: github-icon,
      label: `Xeraphinite`,
      url: "https://github.com/Xeraphinite",
    ),
    contact(
      icon: canton-tower-icon,
      label: "Guangzhou, Guangdong",
    ),
    contact(
      icon: phone-icon,
      label: "(+86) 137-9409-1521",
    )
  ),
)

// Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies.

= #education-icon() Education

#edu(
  institution: "Guangdong University of Technology",
  degree: "Mechanical Engineering, MEng.",
  date: "Sep 2023 - Jun 2026 (Expected)",
  details: [
    - *GPA:* 3.62/4.0 (Top 2.5%), Supervised by Prof. #smallcaps("Jiewu Leng");
    - *Dissertation:* _Sequence-based Parametric CAD Generation with Large Language Models_, project page at #link_with_icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    ).
  ],
) 

#edu(
  institution: "Guangdong University of Finance and Economics",
  degree: "Computer Science, BEng.",
  date: "Sep 2019 - Jun 2023",
  details: [
    - *GPA*: 3.5/4.0 (Top 5%);
    - *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_, a _*reincarnation*_  project is available at #link_with_icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      ).
  ],
)


= #experience-icon() Research Experience

#exp(
  project: "Sequence-based Parametric CAD Generation",
  role: "Core Researcher",
  org: "State Key Lab. of Mfg. Technology & Equipment",
  location: "Guangzhou, China",
  start: "February 2025",
  end: "Present",
  details: [
    - *Situation:* Lab teams manually converted design briefs and sketches into #link_with_icon(
        icon: openscad-icon,
        url: "https://openscad.org/",
        text: `OpenSCAD`,
      ) code, slowing industrial CAD prototyping and introducing inconsistency;
    - *Task:* Lead development of an LLM-driven agent that outputs production-ready parametric scripts aligned with manufacturing tolerances;
    - *Action:* Built multi-modal prompt parsing, fine-tuned sequence-to-sequence transformers, and coordinated tool-use planning for dependable OpenSCAD generation;
    - *Result:* Boosted geometric accuracy of generated models by 40% and, with a human-in-the-loop validator, cut design iteration time by 60%.
  ],
)

#exp(
  project: "Automated Color Difference Control & Calibration System",
  role: "Lead Developer",
  org: "Vograce (Industry Collaboration)",
  location: "Yiwu, Zhejiang",
  start: "Dec 2024",
  end: "Jul 2025",
  details: [
    - *Situation:* Vograce's personalized printing line faced inconsistent color reproduction and labor-intensive quality checks;
    - *Task:* Deliver an automated calibration workflow that flags color drift and issues ink adjustments without slowing one-off production;
    - *Action:* Engineered calibrated machine-vision capture, implemented adaptive sRGB-to-CMYK feedback, and automated operator guidance;
    - *Result:* Reduced detection-to-recommendation latency to 1 s per image and achieved a 20x efficiency gain over manual inspection.
  ],
)

#exp(
  project: "LLM-based Cosmetic Application Design Assistant",
  role: "Developer",
  org: "Vograce (Industry Collaboration)",
  location: "Guangzhou, Guangdong",
  start: "May 2023",
  end: "Jul 2023",
  details: [
    - *Situation:* Vograce's personalized printing line faced inconsistent color reproduction and labor-intensive quality checks;
    - *Task:* Deliver an automated calibration workflow that flags color drift and issues ink adjustments without slowing one-off production;
    - *Action:* Engineered calibrated machine-vision capture, implemented adaptive sRGB-to-CMYK feedback, and automated operator guidance;
    - *Result:* Reduced detection-to-recommendation latency to 1 s per image and achieved a 20x efficiency gain over manual inspection.
  ],
)

= #publication-icon() Publications

== Journal Papers

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "Survey of AIGC for smart manufacturing across design, planning, production, and inspection; synthesizes industrial cases, outlines enabling models (LLMs, diffusion, multimodal) and integration patterns (agents, digital twins), discusses risks (IP, safety, evaluation), and proposes a research roadmap.",
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
  tldr: "Introduces a large-model, human-in-the-loop agentic workflow for geometric modelling: generates code-to-CAD, invokes tools for constraint checking, and closes the loop with expert feedback; demonstrated on industry-style geometry tasks.",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

// Conference Papers


= #copyright-icon() Patents & Copyrights

== Patents

// Disclosed, Granted
#patent(
  number: "202410273298.7",
  title: "Flexible needle puncture path planning based on deep reinforcement learning",
  inventors: ("Leng, J.", strong("Zheng, K."), "Zhong, Y.", "et al."),
  filed: "2024-03-11",
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "202410950697.2", 
  title: "Interaction extraction and demand–manufacturing matching from service interaction context",
  inventors: ("Leng, J.", strong("Zheng, K."), "Xie, J.", "et al."),
  filed: "2024-07-16", 
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "202410368790.2",
  title: "Unified value-chain middleware for manufacturing and its digital-twin system",
  inventors: ("Leng, J.", "Zhong, Y.", strong("Zheng, K."), "et al."),
  filed: "2024-03-28",
  status: "Disclosed",
  country: "CN"
)

#patent(
  number: "18/662,981",
  title: "Defect prediction methods based on multi-feature parallel multi-stage neural network (MF-PMSNN)",
  inventors: ("Leng, J.", "Xie, J.", strong("Zheng, K."), "et al."),
  filed: "2024-05-13",
  status: "Disclosed",
  country: "US"
)

#patent(
  number: "202410180822.6",
  title: "Defect prediction via multi-feature parallel multi-stage neural networks", 
  inventors: ("Leng, J.", "Xie, J.", strong("Zheng, K."), "et al."),
  filed: "2024-02-18",
  status: "Disclosed",
  country: "CN"
)

#v(0.5em)

== Software Copyrights

#copyright(
  title: "Multi-feature fusion print color difference detection system",
  year: "2025",
  status: "Authorized",
  country: "China",
  holders: (strong("Zheng K."), "Leng J.", "Zhong Y.")
)

#copyright(
  title: "Vision intelligence-based personalized print color difference analysis system",
  year: "2025", 
  status: "Authorized",
  country: "China",
  holders: (strong("Zheng K."), "Leng J.", "Zhong Y.")
)

= #skill-icon() Skills

#skills(
  categories: (
    ("DevTools", ("VSCode", "Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("ML Toolkits", ("vLLM", "PyTorch", "CUDA", "MLX", "Gradio")),
    ("Web Development", ("Next.js", "Tailwind CSS", "Node.js")),
    ("Programming Languages", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("Languages", (strong("English (TOEFL: 114)"), strong("Japanese (N1)"), "Chinese & Cantonese (Bilingual)", "Korean (Intermediate)")),
    ("Soft Skills", ("Communication", "Teamwork", "Problem Solving", "Adaptability")),
    ("Interest", ("Typography", "Graphic Design", "UI/UX Design")),
  )
)


= #projects-icon() Projects

#project(
  title: "Ringrad",
  role: "Creator",
  org: "Open Source",
  url: "https://github.com/Xeraphinite/ringrad",
  end: "2024",
  start: "2023",
  icon: github-icon(),
  details: [
    - Created a minimal automatic differentiation library from scratch, implementing reverse-mode differentiation for neural network training
  ],
)

#project(
  title: "SPADA",
  url: "https://github.com/Xeraphinite/spada",
  icon: github-icon(),
  details: [
    Developed a modern CV template package for Typst with multilingual support and clean formatting
  ],
)

= #artifact-icon() Artifacts & Demos

#artifact(
  name: "Ringrad",
  tech: ("MLX", "Python"),
  description: "A minimal automatic differentiation library with Apple Silicon.",
  year: "2024",
)

#artifact(
  name: "Typography",
  tech: ("Typst", "LaTeX"),
  description: "Collection of typography and layout design experiments",
  year: "2023",
)

= #award-icon() Awards

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

#award(
  name: "Freshman Entrance Scholarship",
  date: "2023",
  from: "Guangdong University of Technology",
)

#award(
  name: "Scholarship in Academic Excellence",
  date: "2020, 2021, 2022",
  from: "Guangdong University of Finance & Economics",
)
