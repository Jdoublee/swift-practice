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

1. **상수와 변수 선언**

- **let** : 상수 선언 키워드
- **var** : 변수 선언 키워드 

```swift
// 상수와 변수 선언
let 상수이름: 타입 = 값 // 콜론(:)해주고 띄어쓰기
var 변수이름: 타입 = 값

// 값의 타입이 명확하다면 타입 생략 가능 - 명확히 적어주는게 좋음
let 상수이름 = 값
var 변수이름 = 값

// 상수와 변수 활용
let constant: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있지만"
// constant = "상수는 차후에 값을 변경할 수 없습니다" // 오류발생
```





2. **상수 선언 후, 값 할당하기**

- 선언을 한 뒤, 나중에 값을 할당하려는 상수나 변수는 반드시 타입을 명시해야 합니다. 

```swift
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

// sum = 1 // 그 이후에는 다시 값을 바꿀 수 없습니다, 오류발생

// 변수도 물론 차후에 할당하는 것이 가능합니다
var nickName: String

nickName = "hey"

// 변수는 차후에 다시 다른 값을 할당해도 문제가 없지요
nickName = "heyhey"
```









### 04. 기본 데이터 타입

1. **Swift의 기본 데이터 타입**

- Bool
- Int, UInt
- Float, Double
- Character, String
- **데이터 타입간의 변환이 까다로운, 암시적인 대입에 예민한 언어**





2. **Bool**

- true와 false만을 값으로 가지는 타입

```swift
var someBool: Bool = true
someBool = false
// someBool = 0 - 컴파일 오류발생
// someBool = 1 - 컴파일 오류발생
// Bool 타입에 정수를 왜 넣냐..! 라고 생각
```





3. **Int, UInt**

- **Int** : 정수 타입. 현재는 기본적으로 64비트 정수형
- **UInt** : 양의 정수 타입. 현재는 기본적으로 64비트 양의 정수형.

```swift
// Int
var someInt: Int = -100
// someInt = 100.1 // 컴파일 오류발생

//UInt
var someUInt: UInt = 100
// someUInt = -100 // 컴파일 오류발생
// someUInt = someInt // 컴파일 오류발생
```





4. **Float, Double**

- **Float** : 실수 타입. 32비트 부동소수형.
- **Double :** 실수 타입. 64비트 부동소수형.

```swift
// Float
var someFloat: Float = 3.14
someFloat = 3 // 가능

// Double
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류발생
```





5. **Character, String**

- **Character** : 문자 타입. 유니코드 사용. 큰따옴표("") 사용.
- **String** : 문자열 타입. 유니코드 사용. 큰따옴표("") 사용.

```swift
// Character
var someCharacter: Character = "🇰🇷"
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하" // 컴파일 오류발생. 문자 아닌 문자열
print(someCharacter)

// String
var someString: String = "하하하 😄 "
someString = someString + "웃으면 복이와요"
print(someString)

// someString = someCharacter // 컴파일 오류발생
```









### 05. Any, AnyObject, nil

1. **Any**

- Swift의 **모든 타입**을 지칭하는 키워드

```swift
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

// Any 타입에 Double 자료를 넣어두었더라도 Any는 Double 타입이 아니기 때문에 할당할 수 없다. 
// 명시적으로 타입을 변환해 주어야 함
let someDouble: Double = someAny  // 컴파일 오류발생
```





2. **AnyObject**

- **모든 클래스** 타입을 지칭하는 프로토콜

```swift
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()

// AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에 클래스의 인스턴스가 아니면 할당할 수 없다.
someAnyObject = 123.12    // 컴파일 오류발생
```





3. **nil**

- **없음**을 의미하는 키워드
- 다른 언어의 NULL, Null, null 등과 유사한 표현

```swift
// someAny는 Any 타입이고, someAnyObject는 AnyObject 타입이기 때문에 nil을 할당할 수 없다.
var someAny: Any = 100
var someAnyObject: AnyObject = SomeClass()

someAny = nil         // 컴파일 오류발생
someAnyObject = nil   // 컴파일 오류발생
```









### 06. 컬렉션 타입(Array, Dictionary, Set)