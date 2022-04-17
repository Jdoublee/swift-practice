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



## API 관련 설정

- 영화진흥위원회 OPEN API 활용 [링크](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do)
  - 회원가입 후 키 발급 신청
- 필요한 설정
  - Xcode http 설정
  - API KEY 숨기기
  - 등등..

1. Xcode 설정 바꾸기

   - Apple의 앱 전송 보안(ATS)때문에 http 통신 위해서 아래와 같은 설정 필요 (사용할 api가 http 통신 사용하기 때문)
   - Info.plist에서 아래 항목 추가

   ![](./md-img/04.png)

2. API KEY 숨기기

   - 키값은 공개하면 곤란(아직은 공부 목적이지만)

   - 간단한 방법 1: swift파일에 struct 하나 만들어서 그 안에 String으로 key 저장 후 gitignore 추가하기

   - 사용한 방법

     - plist 파일 생성 (또는 Info.plist 활용) 후 Key - Value 에 API KEY 값 작성
       - 해당 plist 파일 gitignore 추가하기
     - Bundle extension에 아래와 같이 작성 

     ```swift
     extension Bundle {
         var apiKey: String {
           get {
             guard let filePath = self.path(forResource: "Properties", ofType: "plist") else { return "" }
     
             guard let resource = NSDictionary(contentsOfFile: filePath) else { return "" }
             
             guard let key = resource["API_KEY"] as? String else {
               fatalError("API_KEY 설정이 필요합니다.")
             }
             
             return key
           }
         }
     }
     ```

     - 아래와 같이 사용

     ```swift
     let api_key = Bundle.main.apiKey
     ```



## 날짜 계산

- 오늘 날짜

```swift
let date = Date()
```

- 일주일 전 날짜

```swift
let dateBefore7Days = Calendar.current.date(byAdding: .day, value: -7, to: date)
// 옵셔널 반환
// value 음/양 정수 입력
```

- 문자열로 변환

```swift
let formatter = DateFormatter()
formatter.dateFormat = "yyyyMMdd" // 원하는 출력 형식 작성
let current_date = formatter.string(from: dateBefore7Days!)
```



## VO (Value Object)

- 값을 저장하기 위한 객체
- 읽기 전용 (getter / read only)
- 비슷하지만 다른 DTO(Data Transfer Object)
  - 데이터를 오브젝트로 변환하는 객체 / 데이터를 전달하기 위해 사용하는 객체
  - 가변적 (getter, setter)



## URL Parsing

- 오픈 API URL 접근

```swift
// url 저장. 필요한 변수는 이전에 처리.
let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?..."
// URL 형태로 저장
let apiURI: URL! = URL(string: url)
// URL 통해 응답되는 정보를 Data형에 저장
let apiData = try! Data(contentsOf: apiURI)
// 해당 Data형 정보(json) parsing -> Dictionary 형으로 저장
let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
```

- `URL(string:) ` 은 영문, 숫자만 인식 가능. **한글과 띄어쓰기 등은 인식 불가..**
  - 한글이 url에 포함되어 있으면 nil 반환해서 에러 발생

```swift
// 지정된 Set에 없는 모든 문자를 백분율로 인코딩된 문자로 바꾸어 새로운 문자열을 반환해주는 함수 이용
guard let encUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
// 인코딩된 URL 변환
let apiURI: URL! = URL(string: encUrl)
...
```



## 키보드 관련 설정

- 키보드 올라와 있는 상태에서 나머지 화면 터치하여 키보드 내리기 구현

  - 여러 뷰컨트롤러에서 사용 가능하도록 extension에 함수로 작성

  ```swift
  extension SearchViewController {
      func hideKeyboard() {
          let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchViewController.dismissKeyboard))
          view.addGestureRecognizer(tap)
      }
      
      @objc func dismissKeyboard() {
          view.endEditing(true)
      }
  }
  ```

  - viewDidLoad() 에 추가

  ```swift
  override func viewDidLoad() {
      self.hideKeyboard()
  }
  ```

- 키보드 엔터 입력시 키보드 내리기 & 검색 되도록 구현

  - UITextFieldDelegate 프로토콜 구현 및 delegate 연결 필요(코드 또는 스토리보드에서)

  ```swift
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
          
      self.search(self.searchBtn!)
          
      return true
  }
  ```

- 검색 버튼 클릭시 키보드 내리기 구현

  ```swift
  @IBAction func search(_ sender: Any) {
      ...
      self.tfName.endEditing(true)
      ...
  }
  ```



## UILabel Padding 설정

- UILabel 에는 padding/margin 설정이 따로 없음 (`inset` 이라고 함)

- Label의 Text가 그려지는 시점에 해당 패딩이 설정되도록 클래스 작성

  - `intrinsicContentSize` 값은 inset 설정 전과 동일 (라벨 텍스트 짤림 현상 발생)
    - 오버라이드해서 변경 적용 필요

  ```swift
  class paddingLabel: UILabel {
    // 스토리보드의 Attributes Inspector 영역에서 값 조절 가능
    // 아래 drawText에 바로 값 넣어줘도 됨(스토리보드에서 조절 불가)
      @IBInspectable var topInset: CGFloat = 6.0
      @IBInspectable var bottomInset: CGFloat = 6.0
      @IBInspectable var leftInset: CGFloat = 6.0
      @IBInspectable var rightInset: CGFloat = 6.0
      
    // Label의 Text를 그리는 함수
      override func drawText(in rect: CGRect) {
          let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
          super.drawText(in: rect.inset(by: insets))
      }
  // UILabel의 intrinsicContentSize + inset 계산 수행하여 해당 반환 값 활용
      override var intrinsicContentSize: CGSize {
          let size = super.intrinsicContentSize
          return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
      }
  }
  ```

- 적용 전후 비교

  ![](./md-img/05.png)

