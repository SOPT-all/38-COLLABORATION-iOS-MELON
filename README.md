# 38-COLLABORATION-iOS-MELON
🍈 LET'S SOPT 38기 합동세미나 iOS 1조 멜론 🍈

##  iOS Developer
| **이상엽** | **임성환** | **이승희** | **최주희** |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/d448927b-bd85-4c1b-aea2-e29cc2884ac4" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/64931cab-7f0d-450d-b865-076c17f60d70" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/d448927b-bd85-4c1b-aea2-e29cc2884ac4" src="https://github.com/user-attachments/assets/5f1c9f05-a2be-4b15-ab2d-e8b1fed0d658" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/64931cab-7f0d-450d-b865-076c17f60d70" width="170" alt="-"> |
| `iOS Lead`<br>`-` | `iOS Developer`<br>`-` | `iOS Developer`<br>`-` | `iOS Developer`<br>`-` |

## 🛠️ Library & Stack

| 기술 | 설명 |
|-----------|------|
| **UIKit** | 안정적이고 풍부한 레퍼런스, 우수한 호환성, 예측 가능한 UI 레이아웃 작업 |
| **Snapkit** | 간편한 Auto Layout 적용 |
| **Then** | 객체 생성과 속성 설정을 하나의 흐름 구성으로 가독성을 향상 |
| **MVC** | 소규모 프로젝트에 적합한 View·Controller 중심 구조로 직관적인 흐름 구성 |
| **URLSession** | Apple이 제공하는 기본 네트워크 통신 API |
| **Kingfisher** | 이미지 캐싱과 네트워크 병목 방지 |
| **Git, GitHub** | 브랜치 전략 기반 협업, PR·코드리뷰 활용 |
| **Figma, Notion** | 디자인·기능 흐름 시각화 및 문서화 협업 |


## 🌱 Git Flow
<img width="600" alt="image" src="https://github.com/user-attachments/assets/84abcceb-fade-429e-a5e2-24238d0b0bd5" />

- 작업의 기본 브랜치는 `main` 브랜치로 설정합니다.
- 이슈 번호에 맞는 `feature` 브랜치를 `main`에서 분기하여 작업을 진행하고, 작업이 끝나면 PR을 `main` 브랜치로 올립니다.

## 📣 Convention
### Branch
`태그/#이슈번호`
```
Feat/#1
Add/#3
```

### Tag
| 태그 | 사용 |
|-----------|------|
| `Feat` | 새로운 기능 구현 시 사용 |
| `Style` | UI 구현 시 사용 |
| `Fix` | 버그나 오류 해결 시 사용 |
| `Docs` | README, 템플릿 등 프로젝트 내 문서 수정 시 사용 |
| `Setting` | 프로젝트 관련 설정 변경 시 사용 |
| `Add` | 사진 등 에셋이나 라이브러리 추가 시 사용 |
| `Refactor` | 기존 코드를 리팩토링하거나 구조 개선 시 사용 |
| `Chore` | 중요도가 낮은 기타 변경 작업 시 사용 |
| `Merge` | 코드리뷰를 마친 PR을 머지 시 사용 |

### Commit Message
1. 태그의 시작은 반드시 **대문자**로 작성합니다.
2. 내용은 한글로 작성합니다.
3. 어떤 작업을 했는지 헷갈리지 않게 구체적으로 작성합니다.
```
[Feat] #3 - 업장 상세페이지 컴포넌트 사용하도록 수정 및 관리자 조회 API 추가
```
## 📁 Foldering
```
├── 📁 Application
│   ├── 📃 AppDelegate.swift
│   └── 📃 SceneDelegate.swift
├── 📁 Global
│   ├── 📃 LaunchScreen.storyboard
│   ├── 📁 Enums
│   ├── 📁 Components
│   ├── 📁 Extensions
│   └── 📁 Resources
│       ├── 📃 Assets.xcassets
│       └── 📁 Fonts
├── 📁 Presentation
│   └── 📁 Home
│       ├── 📁 View
│       └── 📁 ViewController
├── 📁 Network
│   ├── 📁 Service
│   ├── 📁 Base
│   └── 📁 DTO
└── 📃 Info.plist
```
