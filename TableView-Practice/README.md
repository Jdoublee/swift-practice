# 테이블뷰 연습

## LaunchScreen

- 피그마 스티커 활용 (Smile Face)

  - Assets 에 이미지 추가(@2)

- 스토리보드에 UIImageView 추가 및 오토레이아웃 설정

  - 가운데 정렬, 이미지 비율 등등
  - Smile Face 이미지 설정

- 스플래시 이미지 딜레이 시간 설정

  ```swift
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          sleep(2) // 스플래시 이미지 딜레이 주기위해 추가한 부분
          return true
      }
  ```



## SceneDelegate 삭제

- 스토리보드만 사용할 것이라 SceneDelegate.swift 삭제 (SwiftUI는 아직 미사용)
  - 단순히 파일만 삭제하면 SceneDelegate가 필요하다는 메시지 뜸 -> 아래와 같이 해결

1. info.plist에서 아래 부분 삭제

![](./md-img/01.png)

2. AppDelegate.swift 에서 아래 영역 소스 코드 삭제

![](./md-img/02.png)

3. AppDelegate.swift 에서 아래 소스 코드 추가

- `The app delegate must implement the window property if it wants to use a main storyboard file.` 메시지 해결

![](./md-img/03.png)

