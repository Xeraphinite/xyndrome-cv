#import "xyndrome/lib.typ": *
#import "@preview/scienceicons:0.1.0": email-icon, github-icon, website-icon, bluesky-icon, open-access-icon

#show link: it => underline(
  stroke: (dash: "dashed"),    // keeps font-derived thickness & text color
  offset: 0.2em,              // tweak if you like
)[#it]

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "郑恪悠",
  address: "",  // Address will be handled in contacts now
  lang: "en", // Set to "zh" for Chinese, "ja" for Japanese, "ko" for Korean
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
      label: "Xeraphinite",
      url: "https://github.com/Xeraphinite",
    ),
    contact(
      icon: canton-tower-icon,
      label: "Guangzhou, China",
      url: "",
    ),
  ),
)

= Bio

A self-motivated graduate with a strong foundation in LLM. My research focuses on the intersection of large language models and Code-CAD generation for industrial design automation. I am passionate about developing intelligent systems and possess a diverse skill set in deep learning, full-stack development, and DevOps. Seeking to leverage my experience in a challenging PhD program to advance the field of AI-driven design and manufacturing.

= Education

#edu(
  institution: "Guangdong University of Technology",
  location: "Guangzhou, CN",
  gpa: "3.62 / 4.0",
  degrees: ("Master of Engineering in Mechanical Engineering",),
  date: "2023 - 2026 (Expected)",
  details: [
    - *Supervisor:* Prof. Jiewu Leng
    - *Research Focus:* Large Language Models, Code-CAD Generation, Agentic Workflows
  ],
)

#edu(
  institution: "Guangdong University of Finance and Economics",
  location: "Guangzhou, CN",
  gpa: "3.5 / 4.0",
  degrees: ("Bachelor of Engineering in Computer Science",),
  date: "2019 - 2023",
  details: [
    - *Thesis:* Design and Implementation of a Mario Game Agent Based on Deep Reinforcement Learning
  ],
)

= Research & Project Experience

#exp(
  role: "Core Member & Researcher",
  org: "State Key Laboratory of Precision Electronic Manufacturing Technology and Equipment",
  location: "Guangzhou, China",
  start: "2025.2",
  end: "Now",
  details: [
    #strong[Project: Sequence-based Parametric CAD Generation]
    - Developing an LLM-based agent for generating #link_with_icon(
        icon: openscad-icon,
        url: "https://openscad.org/",
        text: "OpenSCAD"
      ) code from textual and schematic inputs;
    - Investigating novel sequence-to-sequence modeling techniques to improve the accuracy and complexity of generated 3D parametric models.
    - Focusing on creating a robust human-in-the-loop system to refine and validate the agent's output for industrial applications.
  ],
)

#exp(
  role: "Core Developer",
  org: "Vograce (Collaboration with Industry)",
  location: "Yiwu, CN",
  start: "Dec 2024",
  end: "Jul 2025",
  details: [
    #strong[Project: Automated Color Difference Control System]
    - Architected and deployed a machine vision system to automate color consistency control in personalized custom printing.
    - Implemented a novel feedback loop that converts sRGB to CMYK and uses adaptive iteration to recommend ink adjustments, achieving closed-loop quality control.
    - Optimized the full detection-to-recommendation pipeline to under 1 second per image, boosting efficiency by over 20x compared to manual color correction.
    - Co-authored two software copyrights resulting from the project's innovations.
  ],
)

= Publications

#paper(
  authors: ("Leng J", strong("Zheng K"), "Li R", "Chen C", "Wang B", "Liu Q*", "Chen X", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  journal: "Robotics and Computer-Integrated Manufacturing",
  published: "Forthcoming (2026)",
  vol: 101,
  pages: 103076,
  DOI: "10.1016/j.rcim.2025.103076",
)

#paper(
  authors: (strong("Zheng K"), "Zhong Y", "Su X", "Leng J*", "Liu Q", "Chen X"),
  title: "Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling",
  journal: "Applied Soft Computing",
  published: "Under Review",
)

= Skills

#detailed_skills(
  categories: (
    (
      category: "Deep Learning & AI",
      skills: (
        (name: "PyTorch", level: "Advanced"),
        (name: "vLLM", level: "Intermediate"),
        (name: "MLX", level: "Intermediate"),
        (name: "Transformers", level: "Advanced"),
        (name: "Computer Vision", level: "Intermediate")
      )
    ),
    (
      category: "DevOps & Infrastructure", 
      skills: (
        (name: "Git", level: "Advanced"),
        (name: "CI/CD", level: "Intermediate"),
        (name: "Docker", level: "Advanced"),
        (name: "Kubernetes", level: "Beginner"),
        (name: "AWS", level: "Intermediate")
      )
    ),
    (
      category: "Development",
      skills: (
        (name: "TypeScript", level: "Advanced"),
        (name: "Next.js", level: "Advanced"), 
        (name: "Node.js", level: "Advanced"),
        (name: "Python", level: "Expert"),
        (name: "React", level: "Advanced")
      )
    ),
    (
      category: "Design & UI/UX",
      skills: (
        (name: "Figma", level: "Intermediate"),
        (name: "TailwindCSS", level: "Advanced"),
        (name: "Adobe Creative Suite", level: "Beginner")
      )
    )
  ),
  style: "compact"
)

*Projects:* #link_with_icon(
  icon: github-icon,
  url: "https://github.com/Xeraphinite/ringrad",
  text: "Ringrad"
) 

*Languages:*


= Awards

#award(
  name: "National Scholarship",
  date: "2025", 
  from: "National Scholarship",
  details: "Among top 1% out of 10,000+ teams.",
)

#award(
  name: "Academic Scholarship",
  date: "2023, 2024",
  from: "Guangdong University of Technology",
  details: "Rank 5%."
)

#award(
  name: "Academic Scholarship",
  date: "2020, 2021, 2022",
  from: "Guangdong University of Finance & Economics",
)