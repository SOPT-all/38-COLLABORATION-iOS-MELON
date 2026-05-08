# 38-COLLABORATION-iOS-MELON
🍈 LET'S SOPT 38기 합동세미나 iOS 1조 멜론 🍈

##  iOS Developer
| [**이상엽**](https://github.com/sangyup12) | [**임성환**](https://github.com/limtjdghks) | [**이승희**](https://github.com/sssthnnhee) | [**최주희**](https://github.com/dearosmar) |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/842c9eff-1930-41d6-865a-f2735f297243" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/2ecccdd4-0e5b-45e1-8e03-6b18264d8490" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/d6e20740-b9cf-49e0-96b9-c1bb219ffdf5" width="170" alt="-"> | <img src="https://github.com/user-attachments/assets/aa7d4818-bbf8-4f24-9897-14029ae9bc59" width="170" alt="-"> |
| `iOS Lead`<br>`-` | `iOS Developer`<br>`-` | `iOS Developer`<br>`-` | `iOS Developer`<br>`-` |

## 🛠️ Library & Stack

### Language & UI
![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=for-the-badge&logo=apple&logoColor=white)

### Architecture
![MVC](https://img.shields.io/badge/MVC-6DB33F?style=for-the-badge)

### Libraries (via SPM)
![SnapKit](https://img.shields.io/badge/SnapKit-orange?style=for-the-badge)
![Then](https://img.shields.io/badge/Then-green?style=for-the-badge)
![Kingfisher](https://img.shields.io/badge/Kingfisher-yellow?style=for-the-badge)

### Network
![URLSession](https://img.shields.io/badge/URLSession-000000?style=for-the-badge&logo=apple&logoColor=white)

### Collaboration
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white)


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
[태그] #이슈번호 - 작업내용

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
