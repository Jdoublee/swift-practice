# Swift 기초

>  iOS 프로그래밍을 위한 스위프트 기초 (https://www.boostcourse.org/mo122/home)
>
>  내용 정리



## 1단원 - 스위프트 기초

### 02. 명명법 / 콘솔로그 / 문자열 보간법

 1. **명명법**

- Swift는 모든 대소문자를 구분합니다.

  - **Lower Camel Case** : fuction, method, variable, constant

  ex.) someVariableName

  - **Upper Camel Case** : type(class, struct, enum, extension…)

  ex.) Person, Point, Week



2. **콘솔로그 남기기**

  - **print 함수** : 단순 문자열 출력

  - **dump 함수** : 인스턴스의 자세한 설명(description 프로퍼티)까지 출력

  

   3. **문자열 보간법 (String Interpolation)**

  - 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용.

  ```swift
let age: Int = 10

print("HI. I AM \(age) years old.")

print("HI. She is \(age + 5) years old.")

// 출력
// HI. I AM 10 years old.
// HI. She is 15 years old
  ```



### 03. 상수와 변수

