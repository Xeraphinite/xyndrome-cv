<!-- Generated from config/intl/ko/cv-ko-1p.toml by scripts/generate_markdown.py. -->

# Keyou (Key) Zheng

郑恪悠

[`keyouzheng0915@gmail.com`](mailto:keyouzheng0915@gmail.com) · [`keyzh.pages.dev`](https://keyzh.pages.dev) · [`Xeraphinite`](https://github.com/Xeraphinite) · [`Keyou Zheng`](https://scholar.google.com/citations?user=agkWz8MAAAAJ) · 중국 광둥성 광저우

대규모 언어모델과 AI 기반 설계 자동화를 전공한 자기주도형 기계공학 석사 졸업예정자입니다. 연구 분야는 코드 기반 CAD 생성, 에이전트 워크플로우, 산업 응용을 위한 Human-in-the-loop 시스템입니다. 딥러닝, 풀스택 개발, DevOps 전반에서 검증된 경험을 보유하고 있으며, AI 기반 설계·제조 기술을 더욱 발전시키기 위해 박사과정 진학 기회를 찾고 있습니다.

## 학력

### 홋카이도대학교 (QS 세계대학순위 200위권)

컴퓨터과학 박사 · 2027년 4월 - 2030년 4월 (졸업 예정)

### 광둥공업대학교

기계공학 석사 · 2023년 9월 - 2026년 6월

- *GPA:* 3.62/4.0 (상위 2.5%), 지도교수 Jiewu Leng;;
- *학위논문:* _검증기 기반 대규모 언어모델 에이전트를 활용한 코드 기반 파라메트릭 CAD 생성_.

### 광둥재경대학교

컴퓨터과학 학사 · 2019년 9월 - 2023년 6월

- *GPA:* 3.5/4.0 (상위 5%);
- *졸업논문:* _심층 강화학습 기반 Mario 게임 에이전트의 설계 및 구현_.

## 대표 프로젝트

### 코드 기반 CAD 조립 생성

리더 · 제조기술 및 장비 국가중점실험실, 중국 광저우 · 2025년 8월 – 현재

**Stack:** vLLM, OpenHands, Docker, Kubernetes, Laminar

실행 가능한 제약 조건 하에서, 제어 가능한 코드 기반 CAD 생성을 위한 검증 가능한 벤치마크와 LLM 에이전트를 구축했습니다.

- *에이전트 인프라:* 고정된 툴체인과 재현 가능한 실행 환경을 갖춘 _다국어 컨테이너형 코드 실행 샌드박스_를 구축했습니다. 다수의 에이전트 궤적과 실패 기록을 수집하는 _수평 확장형_ 백엔드를 설계해 대규모 실험 관측성을 확보했으며, 빠른 디버깅과 산출물 생성을 위한 _경량 웹 플레이그라운드_도 구현했습니다.
- *벤치마크 구축:* 공개 저장소와 CAD 커뮤니티에서 수집한 20만 규모의 인간 작성 CAD 코드 코퍼스를 기반으로 벤치마크를 구축했습니다. _결정론적 및 휴리스틱 규칙_ (예: 퍼지 중복 제거)과 LLM 파이프라인을 결합해 _데이터 오염을 줄이고 과제 난이도를 제어_했으며, 골든 레퍼런스 워크스페이스와 실행 가능한 테스트를 포함한 단일 부품 1만 개, 조립 1.7천 개 태스크를 만들었습니다.
- *에이전트 설계:* 자가 테스트와 자가 수정 루프를 통해 CAD 프로그램을 생성·편집하는 LLM _아키텍처_를 설계했습니다. 단일 파일 중심의 기존 방식과 달리, 조립 과제의 다중 파일 워크스페이스에서 특정 도구(예: 자연어에서 명세를 추출하는 `spec` 도구)를 사용해 폐루프 수정을 수행할 수 있도록 했습니다.
- *평가 및 결과:* 실행 가능한 테스트를 핵심 지표로 사용해 제약 만족도를 평가했습니다. 조립 태스크에서 제안 방법은 통과율 54.2%, 전체 테스트 성공률 41.9%, 무효 출력 2.4%를 기록했고, 형상 충실도를 유지하면서 기존의 순수 LLM 방식(예: GPT-5)과 도구 기반 기준선을 제약 만족도에서 능가했습니다.
- *성과:* 논문 1편을 _제43회 국제머신러닝학회_ (*ICML 2026*)에 투고했으며 현재 심사 중입니다.

## 발표 논문

1. **[Towards Agentic Smart Design: An Industrial Large Model-driven Human-in-the-loop Agentic Workflow for Geometric Modelling](https://www.sciencedirect.com/science/article/pii/S1568494625012335)**

   Zheng K., Zhong Y., Su X., Leng J.\*, Liu Q., Chen X

   *Applied Soft Computing* · 2025 · JCR Q1, IF: 6.6

   DOI: [10.1016/j.asoc.2025.113920](https://doi.org/10.1016/j.asoc.2025.113920)

2. **[AIGC-empowered Smart Manufacturing: Prospects and Challenges](https://www.sciencedirect.com/science/article/pii/S0736584525001309)**

   Leng J., Zheng K., Li R., Chen C., Wang B., Liu Q.\*, Chen X., Shen W

   *Robotics and Computer-Integrated Manufacturing* · 2026 · JCR Q1, IF: 11.4

   DOI: [10.1016/j.rcim.2025.103076](https://doi.org/10.1016/j.rcim.2025.103076)

## 기술

- **AI 엔지니어링:** Python, vLLM, Unsloth, TRL, OpenHands, PyTorch, CUDA

- **언어:** *영어 (TOEFL: 90)*, *일본어 (N1: 134)*, 중국어·광둥어 (모국어), 한국어 (기초)

- **프론트엔드:** TypeScript, JavaScript, Next.js, Tailwind CSS, Vite, React, PWA

- **DevOps 및 백엔드:** Rust, CLI, Docker, Kubernetes, Node, PostgreSQL, Azure

## 수상 내역

- **국가장학금 (상위 2%)** — 중국 교육부 · 2025

- **학업우수장학금** — 광둥공업대학교 · 2023, 2024, 2025

- **미야 장학금** — 광둥공업대학교 · 2026

- **학업우수장학금** — 광둥재경대학교 · 2020, 2021, 2022
