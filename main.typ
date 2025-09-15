#import "xyndrome/lib.typ": *

#show link: it => underline(
  stroke: (dash: "dashed"),
  offset: 0.2em,
)[#it]

#show list: set list(marker: [◦])

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  // original_name: "郑恪悠", 
  address: "",
  lang: "en",
  contacts: (
    contact(
      icon: email-icon,
      label: "keyouzheng0915@gmail.com",
      url: "mailto:keyouzheng0915@gmail.com",
    ),
    contact(
      icon: website-icon,
      label: "keyzh.pages.dev",
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
      url: "",
    ),
    contact(
      icon: phone-icon,
      label: "+86 13794091521",
      url: "",
    )
  ),
)

// Maybe you don't need a bio section.

= Bio

Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies.

= Education

#edu(
  institution: "Guangdong University of Technology",
  degree: "Mechanical Engineering, MEng.",
  date: "Sept 2023 - Jun 2026 (Exp)",
  details: [
    - *Supervisor:* Prof. Jiewu Leng, *GPA:* 3.62/4.0 (Top 5%);
    - *Research Focus:* Large Language Models, Code-CAD Generation, Agentic Workflows
  ],
)

#edu(
  institution: "Guangdong University of Finance and Economics",
  degree: "Computer Science, BEng.",
  date: "Sept 2019 - Jun 2023",
  details: [
    - *GPA*: 3.5/4.0 (Top 5%);
    - *Thesis:* Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning, a _reincarnation_  project is available at #link_with_icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      ).
  ],
)


= Research Experience

#exp(
  project: "Sequence-based Parametric CAD Generation",
  role: "Core Researcher",
  org: "State Key Lab. of Mfg. Technology & Equipment",
  location: "Guangzhou, China",
  start: "Feb 2025",
  end: "Present",
  details: [
    - Developing an LLM-based agentic system for generating #link_with_icon(
        icon: openscad-icon,
        url: "https://openscad.org/",
        text: `OpenSCAD`,
      ) code from natural language and schematic inputs;
    - Pioneering sequence-to-sequence transformer models to improve accuracy of generated 3D parametric models by 40%;
    - Designing human-in-the-loop validation system for industrial CAD applications, reducing design iteration time by 60%.
  ],
)

#exp(
  project: "Automated Color Difference Control System",
  role: "Lead Developer",
  org: "Vograce (Industry Collaboration)",
  location: "Yiwu, Zhejiang",
  start: "Dec 2024",
  end: "Jul 2025",
  details: [
    - Architected machine vision system for automated color consistency control in personalized printing production;
    - Implemented sRGB-to-CMYK feedback loop with adaptive iteration for ink adjustment recommendations;
    - Optimized detection-to-recommendation pipeline to 1 second per image, achieving 20x efficiency improvement over manual processes.
  ],
)

= Publications

// Journal Papers

#paper(
  authors: ("Leng J", strong("Zheng K"), "Li R", "Chen C", "Wang B", "Liu Q*", "Chen X", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  from: "Robotics and Computer-Integrated Manufacturing",
  published: "2026, Vol. 101, 103076",
  metadata: "(JCR Q1, IF: 11.4)",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "Survey of AIGC for smart manufacturing across design, planning, production, and inspection; synthesizes industrial cases, outlines enabling models (LLMs, diffusion, multimodal) and integration patterns (agents, digital twins), discusses risks (IP, safety, evaluation), and proposes a research roadmap.",
)

#paper(
  authors: (strong("Zheng K"), "Zhong Y", "Su X", "Leng J*", "Liu Q", "Chen X"),
  title: "Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling",
  from: "Applied Soft Computing",
  published: "2025, Accepted",
  metadata: "(JCR Q1, IF: 8.7)",
  tldr: "Introduces a large-model, human-in-the-loop agentic workflow for geometric modelling: generates code-to-CAD, invokes tools for constraint checking, and closes the loop with expert feedback; demonstrated on industry-style geometry tasks.",
)

// Conference Papers

// Patents


= Skills

- Since I have a wide range of interest, here are some of the skills I am familiar with:

#skills(
  categories: (
    ("Programming", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("AI/ML", ("PyTorch", "vLLM", "WanDb")),
    ("Web Dev", ("Next.js", "Tailwind CSS", "Node.js", "FastAPI", "React")),
    ("DevOps", ("Docker", "CI/CD", "Linux", "Microsoft Azure", "Git")),
    ("Design Tools", ("Typst", "LaTeX", "Figma", "Adobe Creative Suite")),
    ("Languages", ("English (TOEFL: 114)", "Japanese (N1)", "Chinese & Cantonese (Bilingual)", "Korean (Intermediate)")),
    ("Interest", ("Rhythm Game", "CJK Films", "Typography", ""))
  )
)

= Patents & Copyrights

*Patent applications (selected)*

#patent(
  number: "CN 202410273298.7",
  title: "Flexible needle puncture path planning based on deep reinforcement learning",
  inventors: ("Jiewu Leng", strong("Keyou Zheng"), "Yuanwei Zhong", "et al."),
  filed: "2024-03-11",
  status: "Application"
)

#patent(
  number: "CN 202410950697.2", 
  title: "Interaction extraction and demand–manufacturing matching from service interaction context",
  inventors: ("Jiewu Leng", strong("Keyou Zheng"), "Junxing Xie", "et al."),
  filed: "2024-07-16", 
  status: "Application"
)

#patent(
  number: "CN 202410368790.2",
  title: "Unified value-chain middleware for manufacturing and its digital-twin system",
  inventors: ("Jiewu Leng", "Yuanwei Zhong", strong("Keyou Zheng"), "et al."),
  filed: "2024-03-28",
  status: "Application"
)

#patent(
  number: "US 18/662,981",
  title: "DEFECT PREDICTION METHODS BASED ON MULTI-FEATURE PARALLEL MULTI-STAGE NEURAL NETWORK (MF-PMSNN)",
  inventors: ("Jiewu Leng", "Junxing Xie", strong("Keyou Zheng"), "et al."),
  filed: "2024-05-13",
  status: "Application"
)

#patent(
  number: "CN 202410180822.6",
  title: "Defect prediction via multi-feature parallel multi-stage neural networks", 
  inventors: ("Jiewu Leng", "Junxing Xie", strong("Keyou Zheng"), "et al."),
  filed: "2024-02-18",
  status: "Application"
)

*Software copyrights (color-difference systems)*

#copyright(
  title: "Multi-feature Fusion Print Color Difference Detection System",
  status: "(Registered)"
)

#copyright(
  title: "Vision Intelligence-based Personalized Print Color Difference Analysis System",
  status: "(Registered)"
)

= Demos & Artifacts

#project(
  title: "Ringrad",
  role: "Creator & Maintainer",
  org: "Open Source",
  start: "2024",
  end: "Present",
  location: "",
  url: "https://github.com/Xeraphinite/ringrad",
  tech: ("Python", "PyTorch", "Automatic Differentiation"),
  details: [
    - Created a minimal automatic differentiation library from scratch, implementing reverse-mode differentiation for neural network training
    - Supports scalar operations, broadcasting, and gradient computation with a clean API similar to PyTorch
    - Educational project demonstrating fundamental concepts of backpropagation and computational graphs
  ],
)

#project(
  title: "Xyndrome-CV",
  role: "Creator",
  org: "Personal Project",
  start: "2024",
  end: "Present", 
  location: "",
  url: "https://github.com/Xeraphinite/xyndrome-cv",
  tech: ("Typst", "Document Layout", "Package Development"),
  icon: github-icon(),
  details: [
    - Developed a modern CV template package for Typst with multilingual support and clean formatting
    - Features modular component system, customizable layouts, and integrated icon support
    - Published as a reusable Typst package for the community
  ],
)


= Awards

#award(
  name: "China National Scholarship",
  date: "2025", 
  from: "Ministry of Education, China",
  details: "(TOP 1%)",
)

#award(
  name: "Academic Excellence Scholarship",
  date: "2023, 2024",
  from: "Guangdong University of Technology",
  details: ""
)

#award(
  name: "Academic Scholarship",
  date: "2020, 2021, 2022",
  from: "Guangdong University of Finance & Economics",
  details: ""
)

<center> You could refer the online version at #link_with_icon(
  icon: website-icon,
  url: "https://keyzh.pages.dev/cv",
  text: `keyzh.pages.dev/cv`,
) for the latest updates.

