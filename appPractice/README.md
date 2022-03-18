# App Practice

> [Introducing SwiftUI](https://developer.apple.com/tutorials/swiftui)
> 
> [iPhone Application 프로그래밍 ](https://tacademy.skplanet.com/live/player/onlineLectureDetail.action?seq=102)
>
> 배운 것들 복습 겸 연습
>

- UserInterfaceState.xcuserstate 파일 제거하기
  - 계속 changes에 뜨는게 거슬린다면 아래와 같이 처리해주자.

  ```bash
  git rm --cached [project].xcworkspace/xcuserdata/[name].xcuserdatad/UserInterfaceState.xcuserstate
  # project 명과 name 입력
  # 모르겠으면 해당 파일 github 경로 찾아서 똑같이 입력 (이미 기존에 올라간 상황이라면) 
  ```
  - 그리고 커밋
  ```bash
  git commit -m 'Removed xcuserstate file that shouldnt be tracked'
  ```
  - 그리고 gitignore에도 추가
  ```bash
  *.xcuserstate
  ```
