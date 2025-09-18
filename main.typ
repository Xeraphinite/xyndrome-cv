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
      label: "(+86) 137-9409-1521",
      url: "",
    )
  ),
)

// Self-motivated MEng graduate specializing in Large Language Models and AI-driven design automation. Research expertise in Code-CAD generation, agentic workflows, and human-in-the-loop systems for industrial applications. Proven track record in deep learning, full-stack development, and DevOps. Seeking PhD opportunities to advance AI-powered design and manufacturing technologies.

= Education

#edu(
  institution: "Guangdong University of Technology",
  degree: "Mechanical Engineering, MEng.",
  date: "September 2023 - June 2026 (Expected)",
  details: [
    - *GPA:* 3.62/4.0 (Top 2.5%), Supervised by Prof. #smallcaps("Jiewu Leng");
    - *Thesis:* _Sequence-based Parametric CAD Generation with Large Language Models_, project page is available at #link_with_icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    ).
  ],
)

#edu(
  institution: "Guangdong University of Finance and Economics",
  degree: "Computer Science, BEng.",
  date: "September 2019 - June 2023",
  details: [
    - *GPA*: 3.5/4.0 (Top 5%);
    - *Thesis:* _Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning_, a _*reincarnation*_  project is available at #link_with_icon(
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
  start: "February 2025",
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
  project: "Automated Color Difference Control & Calibration System",
  role: "Lead Developer",
  org: "Vograce (Industry Collaboration)",
  location: "Yiwu, Zhejiang",
  start: "December 2024",
  end: "July 2025",
  details: [
    - Architected machine vision system for automated color consistency control in personalized printing production;
    - Implemented sRGB-to-CMYK feedback loop with adaptive iteration for ink adjustment recommendations;
    - Optimized detection-to-recommendation pipeline to 1 second per image, achieving 20x efficiency improvement over manual processes.
  ],
)

= Publications

// Journal Papers

*Journal Papers*

#paper(
  type: "journal",
  authors: ("Leng J", strong("Zheng K"), "Li R", "Chen C", "Wang B", "Liu Q*", "Chen X", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026, Vol. 101, 103076",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "Survey of AIGC for smart manufacturing across design, planning, production, and inspection; synthesizes industrial cases, outlines enabling models (LLMs, diffusion, multimodal) and integration patterns (agents, digital twins), discusses risks (IP, safety, evaluation), and proposes a research roadmap.",
)

#paper(
  type: "journal",
  authors: (strong("Zheng K"), "Zhong Y", "Su X", "Leng J*", "Liu Q", "Chen X"),
  title: "Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling",
  venue: "Applied Soft Computing",
  published: "2025",
  metadata: "JCR Q1, IF: 8.7",
  DOI: "10.1016/j.asoc.2025.113920",
  tldr: "Introduces a large-model, human-in-the-loop agentic workflow for geometric modelling: generates code-to-CAD, invokes tools for constraint checking, and closes the loop with expert feedback; demonstrated on industry-style geometry tasks.",
)

// Conference Papers


= Patents & Copyrights

*Patents*

#patent(
  number: "202410273298.7",
  title: "Flexible needle puncture path planning based on deep reinforcement learning",
  inventors: ("Leng, J.", strong("Zheng, K."), "Zhong, Y.", "et al."),
  filed: "2024-03-11",
  status: "Patent application",
  country: "CN"
)

#patent(
  number: "202410950697.2", 
  title: "Interaction extraction and demand–manufacturing matching from service interaction context",
  inventors: ("Leng, J.", strong("Zheng, K."), "Xie, J.", "et al."),
  filed: "2024-07-16", 
  status: "Patent application",
  country: "CN"
)

#patent(
  number: "202410368790.2",
  title: "Unified value-chain middleware for manufacturing and its digital-twin system",
  inventors: ("Leng, J.", "Zhong, Y.", strong("Zheng, K."), "et al."),
  filed: "2024-03-28",
  status: "Patent application",
  country: "CN"
)

#patent(
  number: "18/662,981",
  title: "Defect prediction methods based on multi-feature parallel multi-stage neural network (MF-PMSNN)",
  inventors: ("Leng, J.", "Xie, J.", strong("Zheng, K."), "et al."),
  filed: "2024-05-13",
  status: "Patent application",
  country: "US"
)

#patent(
  number: "202410180822.6",
  title: "Defect prediction via multi-feature parallel multi-stage neural networks", 
  inventors: ("Leng, J.", "Xie, J.", strong("Zheng, K."), "et al."),
  filed: "2024-02-18",
  status: "Patent application",
  country: "CN"
)

*Software Copyrights*

#copyright(
  title: "Multi-feature fusion print color difference detection system",
  year: "2025",
  status: "Computer Software Copyright Certificate",
  country: "China",
  holders: ("Zheng K", "Leng J", "et al.")
)

#copyright(
  title: "Vision intelligence-based personalized print color difference analysis system",
  year: "2025", 
  status: "Computer Software Copyright Certificate",
  country: "China",
  holders: ("Zheng K", "Leng J", "et al.")
)

= Skills

#skills(
  categories: (
    ("Tools", ("Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("Machine Learning", ("PyTorch", "TensorFlow", "scikit-learn", "MLX")),
    ("Web Development", ("Next.js", "Tailwind CSS", "React", "Node.js")),
    ("Programming Languages", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("Languages", ("English (TOEFL: 114)", "Japanese (N1)", "Chinese & Cantonese (Bilingual)", "Korean (Intermediate)")),
    ("Soft Skills", ("Communication", "Teamwork", "Problem Solving", "Adaptability")),
    ("Interest", ("Typography", "Graphic Design")),
  )
)


= Projects

#project(
  title: "Ringrad",
  role: "Creator & Maintainer",
  org: "Open Source",
  url: "https://github.com/Xeraphinite/ringrad",
  tech: ("MLX", "Automatic Differentiation"),
  details: [
    Created a minimal automatic differentiation library from scratch, implementing reverse-mode differentiation for neural network training
  ],
)

#project(
  title: "Xyndrome-CV",
  location: "",
  url: "https://github.com/Xeraphinite/xyndrome-cv",
  tech: ("Typst", "Document Layout", "Package Development"),
  icon: github-icon(),
  details: [
    Developed a modern CV template package for Typst with multilingual support and clean formatting
  ],
)

= Artifacts & Demos

#artifact(
  name: "Personal Portfolio",
  tech: ("Next.js", "Tailwind CSS", "TypeScript"),
  description: "Modern responsive portfolio website with dynamic content",
  time: "2024",
)

#artifact(
  name: "Typography Experiments",
  tech: ("Typst", "LaTeX"),
  description: "Collection of typography and layout design experiments",
  time: "2023-2025",
  icon: github-icon()
)

= Awards

#award(
  name: "National Scholarship",
  date: "2025", 
  from: "Ministry of Education, China",
)

#award(
  name: "First Class Scholarship in Academic Excellence",
  date: "2025",
  from: "Guangdong University of Technology",
)

#award(
  name: "Second Class Scholarship in Academic Excellence",
  date: "2024",
  from: "Guangdong University of Technology",
)

#award(
  name: "Freshman Entrance Scholarship",
  date: "2023",
  from: "Guangdong University of Technology",
)

#award(
  name: "First Class Scholarship in Academic Excellence",
  date: "2020, 2021, 2022",
  from: "Guangdong University of Finance & Economics",
)
