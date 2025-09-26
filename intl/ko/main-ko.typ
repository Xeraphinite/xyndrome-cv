#import "../../xyndrome/lib.typ": *

#show: cv.with(
  en_name: "Keyou (Key) Zheng",
  original_name: "郑|恪|悠",
  ruby_name: "チェン|コッ|ヤオ",
  lang: "ko",
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
      label: "광저우, 광동성",
    ),
    contact(
      icon: phone-icon(right-space: 0.2em),
      label: "(+86) 137-9409-1521",
    )
  ),
)

#sec-heading(icon: education-icon, title: "학력")

#edu(
  institution: "광동공업대학교",
  degree: "기계공학 석사",
  date: "2023년 9월 - 2026년 6월 (예정)",
  details: [
    - *GPA:* 3.62/4.0 (상위 2.5%), 지도교수: #smallcaps("렝지에우") 교수;
    - *학위논문:* _대형 언어 모델을 활용한 시퀀스 기반 파라메트릭 CAD 생성_, 프로젝트 페이지: #link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/spada",
        text: `Xeraphinite/spada`,
    ).
  ],
) 

#edu(
  institution: "광동재경대학교",
  degree: "컴퓨터과학 학사",
  date: "2019년 9월 - 2023년 6월",
  details: [
    - *GPA*: 3.5/4.0 (상위 5%);
    - *졸업논문:* _심층 강화학습 기반 마리오 게임 에이전트 설계 및 구현_, 후속 프로젝트: #link-with-icon(
        icon: github-line-icon,
        url: "https://github.com/Xeraphinite/Mario-RL",
        text: `Xeraphinite/Mario-RL`,
      ).
  ],
)

#sec-heading(icon: experience-icon, title: "연구 경험")

#exp(
  project: "시퀀스 기반 파라메트릭 CAD 생성",
  role: "핵심 연구원",
  org: "제조기술장비 국가중점실험실",
  location: "광저우, 중국",
  start: "2025년 2월",
  end: "현재",
  details: [
    - 문제: 수동 브리프→OpenSCAD 코딩으로 인한 프로토타이핑 지연 및 파라메트릭 일관성 부족.
    - 접근법: 스케치/사양의 멀티모달 파싱; 코드 합성을 위한 seq2seq 미세조정; 제약 검증기를 포함한 도구 사용 계획 (기하학적 건전성 검사, 허용오차 검증).
    - 신뢰성: 결정론적 스캐폴딩; CAD 프리미티브 단위 테스트; 실패 복구 프롬프트; 인간-루프 검토 UI.
    - 효과: 내부 벤치마크에서 설계자 검증 하에 기하학적 정확도 +40% (IoU/매개변수 오차) 및 반복 시간 -60%.
    - 기술 스택: Python, PyTorch, vLLM, OpenSCAD, 형상 메트릭 평가 하네스.
  ],
)

#exp(
  project: "자동 색차 제어 및 보정",
  role: "수석 개발자",
  org: "Vograce (산학협력)",
  location: "이우, 저장성",
  start: "2024년 12월",
  end: "2025년 7월",
  details: [
    - 문제: 개인화 인쇄에서 색상 재현 불일치 및 노동 집약적 품질 보증.
    - 방법: 보정된 머신 비전 캡처; $Delta E$ (CIEDE2000) 계산, 적응형 sRGB↔CMYK 피드백, 운영자 가이드 및 감사 추적.
    - 결과: 검출→권장 지연시간을 ~1초/이미지로 단축; 파일럿 라인 실행에서 수동 검사 대비 ~20배 효율성.
    - 기술 스택: Python/OpenCV, 색상 과학 라이브러리, Gradio 대시보드; SOP 체크리스트와의 운영 통합.
  ],
)

#exp(
  project: "규제급 화장품 컴플라이언스 어시스턴트",
  role: "개발자",
  org: "Vograce (산학협력)",
  location: "광저우, 광동성",
  start: "2023년 5월",
  end: "2023년 7월",
  details: [
    - 목표: 단일 제품 자료(성분, 등록/신고 기록, 라벨)로부터 법정 문서 및 내부 가이드라인과 비교하여 추적 가능하고 인용 링크가 포함된 컴플라이언스 제안 생성.
    - RAG 설계:
        - 지식 베이스: 파싱된 법령, 행정조치 및 기술표준; 정규화된 메타데이터 (제목, 조항, 항목, 버전, 발효일, 소스 URL).
        - 청킹: 계층적 (섹션→조항) 512-1024 토큰 윈도우 + 중복; 인용을 위한 조항 ID 보존.
        - 검색: BM25 + 밀집 임베딩 하이브리드; MMR 다양성을 통한 top-k 검색; precision@k를 위한 크로스 인코더 재순위.
        - 프롬프팅: 요구사항 분해를 포함한 역할 기반 템플릿; 인용 범위에 대한 도구 힌트; 범위 외 요청에 대한 거부 규칙.
        - 추적: 클레임별 인용 매핑 (조항/문단), 신뢰도 태그 및 근거 요약; 내보내기 가능한 감사 JSON.
    - 데모 및 운영: 초기 테스트를 위한 Gradio 프로토타입 구축; 배치 모드 및 변경된 법령에 대한 적선 차이 추가; 프론트엔드 검토 큐에 통합.
    - 효과: 평균 인간 검토 시간이 항목당 ~3분에서 ~1-2분으로 단축 (~40-60% 빠름), 추적성 향상 (모든 제안이 조항 수준 인용으로 역참조).
    - 기술 스택: Python, FAISS/elastic형 검색기 (하이브리드), Gradio UI, 프롬프트 엔지니어링; 버전화된 KB 및 테스트 쿼리를 통한 거버넌스.
  ],
)

#sec-heading(icon: publication-icon, title: "발표 논문")

#sec-heading(level: 2, title: "학술지 논문")

#paper(
  type: "journal",
  authors: ("Leng J.", strong("Zheng K."), "Li R.", "Chen C.", "Wang B.", "Liu Q.*", "Chen X.", "Shen W"),
  title: "AIGC-empowered Smart Manufacturing: Prospects and Challenges",
  venue: "Robotics and Computer-Integrated Manufacturing",
  published: "2026",
  metadata: "JCR Q1, IF: 11.4",
  DOI: "10.1016/j.rcim.2025.103076",
  tldr: "스마트 제조를 위한 AIGC 설문조사: 설계, 계획, 생산, 검사 전반에 걸쳐; 산업 사례 통합, 활성화 모델 (LLM, 확산, 멀티모달) 및 통합 패턴 (에이전트, 디지털 트윈) 개요, 위험 (IP, 안전, 평가) 논의, 연구 로드맵 제안.",
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
  tldr: "기하학적 모델링을 위한 대형 모델 주도 인간-루프 에이전트 워크플로우 도입: 코드-CAD 생성, 제약 확인을 위한 도구 호출, 전문가 피드백을 통한 루프 종료; 산업급 기하학 작업에서 실증.",
  pdf: "https://www.sciencedirect.com/science/article/pii/S1568494625012335"
)

#sec-heading(icon: copyright-icon, title: "특허 및 저작권")

#sec-heading(level: 2, title: "특허")

#patent(
  number: "202410273298.7",
  title: "심층 강화학습 기반 유연한 바늘 천공 경로 계획",
  inventors: ("렝지에우", strong("정커요우"), "종위항", "셰자니", "리런펑", "쉬청", "리우칭"),
  filed: "2024년 3월 11일",
  status: "공개",
  country: "중국"
)

#patent(
  number: "202410950697.2", 
  title: "서비스 상호작용 맥락에서의 상호작용 추출 및 수요-제조 매칭",
  inventors: ("렝지에우", strong("정커요우"), "셰자니", "리런펑", "쉬청", "리우칭"),
  filed: "2024년 7월 16일", 
  status: "공개",
  country: "중국"
)

#patent(
  number: "202410368790.2",
  title: "제조업 통합 가치사슬 미들웨어 및 디지털 트윈 시스템",
  inventors: ("렝지에우", "종위항", strong("정커요우"), "리런펑", "쉬청", "리우칭"),
  filed: "2024년 3월 28일",
  status: "공개",
  country: "중국"
)

#patent(
  number: "18/662,981",
  title: "다중 특징 병렬 다단계 신경망(MF-PMSNN) 기반 결함 예측 방법",
  inventors: ("렝지에우", "셰자니", strong("정커요우"), "리런펑", "쉬청", "리우칭"),
  filed: "2024년 5월 13일",
  status: "공개",
  country: "미국"
)

#v(0.5em)

#sec-heading(level: 2, title: "소프트웨어 저작권")

#copyright(
  title: "다중 특징 융합 인쇄 색차 검출 시스템",
  year: "2025",
  status: "승인",
  country: "중국",
  holders: (strong("정커요우"), "종위항", "렝지에우")
)

#copyright(
  title: "비전 지능 기반 개인화 인쇄 색차 분석 시스템",
  year: "2025", 
  status: "승인",
  country: "중국",
  holders: (strong("정커요우"), "종위항", "렝지에우")
)

#sec-heading(icon: skill-icon, title: "기술")

#skills(
  categories: (
    ("개발 도구", ("VSCode", "Git", "LaTeX", "Docker", "CI/CD", "CLI")),
    ("머신러닝 툴킷", ("vLLM", "PyTorch", "CUDA", "MLX", "Gradio")),
    ("관심사", ("타이포그래피", "그래픽 디자인", "UI/UX 디자인")),
    ("웹 개발", ("Next.js", "Tailwind CSS", "Node.js")),
    ("프로그래밍 언어", ("Python", "TypeScript", "JavaScript", "Rust", "C/C++")),
    ("언어 능력", (strong("영어 (TOEFL: 114)"), strong("일본어 (N1)"), "중국어 & 광동어 (이중언어)", "한국어 (중급)")),
    ("소프트 스킬", ("의사소통", "팀워크", "문제 해결", "적응력")),
  )
)

#sec-heading(icon: projects-icon, title: "프로젝트")

#project(
  title: "SPADA",
  url: "https://github.com/Xeraphinite/spada",
  role: "핵심 개발자",
  org: "오픈소스",
  start: "2025년",
  end: "현재",
  icon: spada-icon(),
  details: [
   - OpenSCAD용 올인원 개발자 경험 친화적 키트.
  ],
)

#sec-heading(icon: artifact-icon, title: "작품 및 데모")

#artifact(
  name: "Ringrad",
  tech: ("MLX", "Python"),
  description: "Apple Silicon용 최소 자동 미분 라이브러리.",
  year: "2024년",
)

#artifact(
  name: "kits(une)",
  tech: ("vLLM", "TypeScript", "Next.js"),
  description: "LLM 재현 프로젝트 컬렉션.",
  year: "2025년",
)

#artifact(
  name: "Xeraphinite",
  tech: ("Next.js", "Tailwind CSS"),
  description: "다국어 지원 및 깔끔한 형식의 Typst용 현대적 CV 템플릿 패키지.",
  year: "2024년",
)

#sec-heading(icon: award-icon, title: "수상 내역")

#award(
  name: "국가장학금",
  date: "2025년", 
  from: "중화인민공화국 교육부",
  details: ""
)

#award(
  name: "학업우수장학금",
  date: "2024년, 2025년",
  from: "광동공업대학교",
)

#award(
  name: "신입생입학장학금",
  date: "2023년",
  from: "광동공업대학교",
)

#award(
  name: "학업우수장학금",
  date: "2020년, 2021년, 2022년",
  from: "광동재경대학교",
)

#sec-heading(icon: serving-icon(), title: "봉사 활동")

#serving(
  name: "해상 실크로드 국제 산학연용 협력 회의",
  description: "국가중점실험실 핵심 구성원으로서 2년 연속 국제회의 기획 업무에 참여. 주로 참석 귀빈의 정보 확인 및 등록, 참석 전문가 구성원의 교통편, 회의 물자의 통괄 배치 및 여러 분과 회의장의 현장 관리를 담당. 회의 준비팀과 긴밀히 협력하여 책임자의 부서 간 소통 및 진행 과정 추진을 지원하고, 귀빈 접대, 회의 운영 등 핵심 부문의 원활하고 효율적인 진행을 보장.",
  date: "2023.12 & 2024.12"
)