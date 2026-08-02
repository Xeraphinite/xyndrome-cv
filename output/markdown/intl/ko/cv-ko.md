<!-- Generated from config/intl/ko/cv-ko.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 광저우, 광동성

대규모 언어모델과 AI 기반 설계 자동화를 전공한 자기주도형 기계공학 석사 과정 졸업예정자입니다. 코드 기반 CAD 생성, 에이전트 워크플로우, 산업 응용을 위한 Human-in-the-loop 시스템을 중점적으로 연구했습니다. 딥러닝, 풀스택 개발, DevOps에서 검증된 실무 및 연구 경험을 보유하고 있으며, AI 기반 설계·제조 기술을 고도화하기 위한 박사과정 기회를 찾고 있습니다.

## 학력

### 홋카이도대학교 (QS 세계대학순위 200위권)

컴퓨터과학 박사 · 2027년 4월 - 2030년 4월 (졸업 예정)

### Guangdong University of Technology

Mechanical Engineering, MEng. · Sep 2023 - Jun 2026

- *GPA:* 3.62/4.0 (상위 2.5%), 지도교수 Jiewu Leng;;
- *Dissertation:* _검증기 기반 대규모 언어모델 에이전트를 활용한 코드 기반 파라메트릭 CAD 생성_.

### Guangdong University of Finance and Economics

Computer Science, BEng. · Sep 2019 - Jun 2023

- *GPA*: 3.5/4.0 (상위 5%);
- *Thesis:* _심층 강화학습 기반 Mario 게임 에이전트의 설계 및 구현_.

## 연구 경험

### Code-based CAD Assembly Generation

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Aug 2025 – Present

실행 가능한 제약 조건 하에서, 제어 가능한 코드 기반 CAD 생성을 위한 검증 가능한 벤치마크와 LLM 에이전트를 구축했습니다.

- *에이전트 인프라*: 고정된 툴체인과 재현 가능한 실행 환경을 갖춘 _다국어 컨테이너형 코드 실행 샌드박스_를 구축했습니다. 대규모 실험 관측을 위해 에이전트의 다양한 trajectory와 실패 로그를 수집하는 _수평 확장형_ 백엔드를 설계했으며, 빠른 디버깅과 아티팩트 생성을 위한 _경량 웹 플레이그라운드_도 구현했습니다.
- *벤치마크 구축*: 공개 저장소와 CAD 커뮤니티에서 수집한 20만 규모의 인간 작성 CAD 코드 코퍼스를 기반으로 대규모 벤치마크를 구축했습니다. _결정론적/휴리스틱 규칙_(예: 퍼지 중복 제거)과 LLM 기반 파이프라인을 결합해 _데이터 오염을 줄이고_ _과제 난이도를 제어_했으며, 골든 레퍼런스 워크스페이스와 실행 가능한 테스트를 포함한 단일 부품 1만 개, 조립 1.7천 개 태스크를 생성했습니다.
- *에이전트 설계*: 자가 테스트와 자가 수정 루프를 통해 CAD 프로그램을 생성·편집하는 LLM _아키텍처_를 설계했습니다. 기존의 단일 파일 중심 방식과 달리, 조립 과제의 다중 파일 워크스페이스에서 `spec`, `inspect`, `verify` 같은 도구를 활용해 폐루프 수정이 가능하도록 했습니다.
- *평가 및 결과*: 실행 가능한 테스트를 핵심 지표로 사용해 제약 만족도를 계산했습니다. 조립 태스크에서 제안 방법은 통과율 54.2%, 전체 테스트 성공률 41.9%, 무효 출력 2.4%를 기록했고, 형상 점수도 경쟁력을 유지한 채 제약 만족도에서 기존 기준선을 능가했습니다.
- *성과*: _43rd International Conference on Machine Learning_ (*ICML 2026*)에 논문 1편을 투고하여 심사 중입니다.

### Human-in-the-loop CAD Generation Workflow

Leader · State Key Lab of Manufacturing Technology & Equipment, Guangzhou, Guangdong · Dec 2024 – May 2025

코드 유효성과 사용자 선호를 유지하는 코드식 CAD 생성을 위해 HITL 에이전트 워크플로우를 설계했습니다.

- *워크플로우 설계*: 미세조정한 `Qwen2.5-VL-7B`를 백본으로 사용하고, 의도 명확화·유효성 검사·반복 개선·메모리·안전 게이팅을 포함한 복수의 워크플로우 패턴을 결합해 코드 생성을 수행했습니다.
- *결과*: 실제 모델 200개를 대상으로 무효율과 전문가 쌍대 비교 Elo로 평가한 결과, 무효율 2%와 Elo 1075.5로 최고 성능을 달성했으며 Claude, GPT-4o, 비에이전트 Qwen 기준선을 상회했습니다.
- *성과*: 논문 1편이 _Applied Soft Computing_에 게재되었습니다.

## 발표 논문

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 특허 및 저작권

### 특허

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

### 소프트웨어 저작권

1. **Multi-feature fusion print color difference detection system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

2. **Vision intelligence-based personalized print color difference analysis system**

   Zheng K., Zhong Y., Leng J.

   China · 2025 · Authorized

## 프로젝트

### Automated Color Difference Control & Calibration

Lead Developer · Vograce, Yiwu, Zhejiang · Dec 2024 – Jul 2025

맞춤형 인쇄 생산에서 폐루프 색 일관성 제어를 위한 머신비전 파이프라인을 구축했습니다.

- *획득 및 검출*: 다양한 조명과 소재 반사 조건에서 여러 인쇄 패턴을 안정적으로 처리하기 위해 광학 취득 환경을 설계하고, 특징 매칭 정렬 및 ROI 추출을 구현하여 견고한 $Delta E$ (CIEDE2000) 계산을 가능하게 했습니다.
- *알고리즘*: sRGB 측정값을 CMYK 공간으로 변환하고 적응형 반복 스텝 피드백을 적용해, 측정된 색차를 인쇄 작업자가 즉시 활용할 수 있는 잉크 레벨 조정 권고로 변환했습니다.
- *결과*: `Gradio`로 빠르게 프로토타이핑하며 반복 개선을 진행해 전체 탐지-추천 파이프라인을 이미지당 ≤1초로 최적화했고, 파일럿 라인에서 수작업 색보정보다 20배 이상 빠른 성능을 달성했습니다. 이후 `Next.js` + `FastAPI` 기반 풀스택 시스템으로 제품화해 기업 배포를 지원했습니다.
- *성과*: 소프트웨어 저작권 2건을 취득했습니다.

## 기술

- **AI Engineering:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **Languages:** *English (TOEFL: 90)*, *Japanese (N1: 134)*, Chinese & Cantonese (native), Korean (basic)

- **Frontend:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps & Backend:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

- **Interests:** Typography, Graphic Design, UI/UX Design, Rhythm Games

## 수상 내역

- **National Scholarship** — Ministry of Education, China · 2025 · 상위 2%

- **Scholarship in Academic Excellence** — Guangdong University of Technology · 2023, 2024, 2025

- **Miya Scholarship** — Guangdong University of Technology · 2026

- **Scholarship in Academic Excellence** — Guangdong University of Finance & Economics · 2020, 2021, 2022
