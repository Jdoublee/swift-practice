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

1. **Array**

- 멤버가 **순서(인덱스)** 를 가진 리스트 형태의 컬렉션 타입
- 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양하다.

```swift
// 1. Array 선언 및 생성
var integers: Array<Int> = Array<Int>()

// 위와 동일한 표현
// var integers: Array<Int> = [Int]()
// var integers: Array<Int> = []
// var integers: [Int] = Array<Int>()
// var integers: [Int] = [Int]()
// var integers: [Int] = []
// var integers = [Int]()


// 2. Array 활용
integers.append(1)
integers.append(100)

// Int 타입이 아니므로 Array에 추가할 수 없다
//integers.append(101.1)

print(integers)	// [1, 100]

// 멤버 포함 여부 확인
print(integers.contains(100)) // true
print(integers.contains(99)) // false

// 멤버 교체
integers[0] = 99

// 멤버 삭제
integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

// 멤버 수 확인
print(integers.count)

// 인덱스를 벗어나 접근하려면 익셉션 런타임 오류발생
//integers[0]


// 3. 불변 Array: let을 사용하여 Array 선언
let immutableArray = [1, 2, 3]

// 수정이 불가능한 Array이므로 멤버를 추가하거나 삭제할 수 없다
//immutableArray.append(4)
//immutableArray.removeAll()
```





2. **Dictionary**

- `'키'` 와 `'값' `의 쌍으로 이루어진 컬렉션 타입
- Array와 비슷하게 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양하다.

```swift
// 1. Dictionary의 선언과 생성
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()

// 위와 동일한 표현
// var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
// var anyDictionary: Dictionary <String, Any> = [:]
// var anyDictionary: [String: Any] = Dictionary<String, Any>()
// var anyDictionary: [String: Any] = [String: Any]()
// var anyDictionary: [String: Any] = [:]
// var anyDictionary = [String: Any]()


// 2. Dictionary 활용
// 키에 해당하는 값 할당
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

print(anyDictionary) // ["someKey": "value", "anotherKey": 100]

// 키에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary) ["someKey": "dictionary", "anotherKey": 100]

// 키에 해당하는 값 제거
anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
print(anyDictionary)


// 3. 불변 Dictionary: let을 사용하여 Dictionary 선언
let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "hey", "gender": "male"]

// 불변 Dictionary이므로 값 변경 불가
//emptyDictionary["key"] = "value"

// "name"이라는 키에 해당하는 값이 없을 수 있으므로 String 타입의 값이 나올 것이라는 보장이 없다.
// 컴파일 오류 발생
// let someValue: String = initalizedDictionary["name"]
```





3. **Set**

- 중복되지 않는 멤버가 순서없이 존재하는 컬렉션
- Array, Dictionary와 다르게 축약형이 존재하지 않음

```swift
// 1. Set 생성 및 선언
var integerSet: Set<Int> = Set<Int>() // 축약 문법 없음

// insert : 새로운 멤버 입력
// 동일한 값은 여러번 insert해도 한번만 저장
integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(100)

print(intigerSet) // {100, 99, 1}

// contains: 멤버 포함 여부 확인
print(integerSet.contains(1)) // true
print(integerSet.contains(2)) // false

// remove: 멤버 삭제
integerSet.remove(99) // {100, 1}
integerSet.removeFirst() // {1}

// count: 멤버 개수
integerSet.count // 1


// 2. Set의 활용
// 멤버의 유일성이 보장되기 때문에 집합 연산에 활용 유용
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]
```





### 07.  함수 기본

1. **함수선언의 기본형태**

```swift
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
//    /* 함수 구현부 */
//    return 반환값
//}

// 예)
// sum이라는 이름을 가지고 
// a와 b라는 Int 타입의 매개변수를 가지며 
// Int 타입의 값을 반환하는 함수
func sum(a: Int, b: Int) -> Int {
    return a + b
}
```





2. **반환 값이 없는 함수**

```swift
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> Void {
//    /* 함수 구현부 */
//    return
//}

// 예)
func printMyName(name: String) -> Void {
    print(name)
}

// 반환 값이 없는 경우, 반환 타입(Void)을 생략해 줄 수 있습니다
func printYourName(name: String) {
    print(name)
}
```





3. **매개변수가 없는 함수**

```swift
//func 함수이름() -> 반환타입 {
//    /* 함수 구현부 */
//    return 반환값
//}

// 예)
func maximumIntegerValue() -> Int {
    return Int.max
}
```





4. **매개변수와 반환값이 없는 함수**

```swift
//func 함수이름() -> Void {
//    /* 함수 구현부 */
//    return
//}

// 함수 구현이 짧은 경우
// 가독성을 해치지 않는 범위에서
// 줄바꿈을 하지 않고 한 줄에 표현해도 무관합니다
func hello() -> Void { print("hello") }


// 반환 값이 없는 경우, 반환 타입(Void)을 생략해 줄 수 있습니다
//func 함수이름() {
//    /* 함수 구현부 */
//    return
//}

func bye() { print("bye") }
```





5. **함수의 호출**

```swift
sum(a: 3, b: 5) // 8

printMyName(name: "hey") // hey

printYourName(name: "hana") // hana

maximumIntegerValue() // Int의 최댓값

hello() // hello

bye() // bye
```





### 08. 함수 고급

1. **매개변수 기본 값**

- 매개변수에 기본적으로 전달될 값을 미리 지정해 둘 수 있다.
- 기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.

```swift
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값 ...) -> 반환타입 {
//    /* 함수 구현부 */
//    return 반환값
//}

func greeting(friend: String, me: String = "hey") { // me 기본값 존재
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 호출시 생략할 수 있다
greeting(friend: "hana") // Hello hana! I'm hey
greeting(friend: "john", me: "eric") // Hello john! I'm eric
```





2. **전달인자 레이블(Argument Label)**

- 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역할을 좀 더 명확하게 표현하고자 할 때 사용
- 전달인자 레이블은 변경하여 동일한 이름의 함수를 **중복**으로 생성가능

```swift
//func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
//    /* 함수 구현부 */
//    return
//}

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다
greeting(to: "hana", from: "hey") // Hello hana! I'm hey
```





3. **가변 매개변수**

- 전달 받을 값의 개수를 알기 어려울 때 사용
- 가변 매개변수는 함수당 하나만 가질 수 있다.
- 기본값이 있는 매개변수와 같이 가변 매개변수 역시 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.
- 반환값이 없는 함수, 매개변수 기본 값, 전달인자 레이블, 가변 매개변수 등 모두 섞어서 사용 가능

```swift
//func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
//    /* 함수 구현부 */
//    return
//}

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}
print(sayHelloToFriends(me: "hey", friends: "hana", "eric", "wing"))
// Hello ["hana", "eric", "wing"]! I'm hey!

print(sayHelloToFriends(me: "hey"))
// Hello []! I'm hey!
```





4. **데이터 타입으로서의 함수**

- 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이므로 스위프트의 함수는 일급객체이다. 함수를 변수, 상수 등에 할당이 가능하고 매개변수를 통해 전달할 수도 있다.
- **함수의 타입 표현** : 반환 타입을 생략할 수 없다.

`(매개변수1타입, 매개변수2타입 ...) -> 반환타입`

- **함수타입 사용**

```swift
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "hey") // Hello eric! I'm hey

someFunction = greeting(friend:me:)
someFunction("eric", "hey") // Hello eric! I'm hey


// 타입이 다른 함수는 할당할 수 없다 - 컴파일 오류 발생
//someFunction = sayHelloToFriends(me: friends:) // friends 가 가변매개변수여서 안됨

// 함수를 매개변수로 직접 넘겨줄 수 있음
func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function: greeting(friend:me:))

// Hello jenny! I'm mike
runAnother(function: someFunction)
```

* **스위프트 전반적인 문법에서 띄어쓰기를 신경써야할 때가 많다.**





### 09. 조건문

1.**if-else 구문**

- **if-else 구문의 기본 형태** 
- if만 단독으로 사용해도되고, else, else if 와 조합해서 사용 가능
- if 뒤의 조건 값에는 **Bool 타입**의 값만 위치해야 한다.
- 조건을 감싸는 소괄호 생략 가능. 중괄호는 생략 불가.

```swift
if 조건 {
     /* 실행 구문 */
} else if 조건 {
    /* 실행 구문 */
} else {
    /* 실행 구문 */
}
```

- **if-else의 사용**

```swift
let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// 스위프트의 조건에는 항상 Bool 타입이 들어와야 함
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에
// 컴파일 오류 발생
//if someInteger { }
```





2. **switch 구문**

- 스위프트의 switch 구문은 다른 언어에 비해 강력한 힘을 발휘
- 기본적으로 사용하던 정수타입의 값만 비교하는 것이 아니라 대부분의 스위프트 기본 타입을 지원하며, 다양한 패턴과 응용 가능
- 스위프트의 다양한 패턴은 [Swift Programming Language Reference의 패턴](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/패턴s.html) 에서 확인할 수 있다.

- 각각의 case 내부에는 실행가능한 코드가 반드시 위치해야 함
- 매우 한정적인 값(ex. enum의 case 등)이 비교값이 아닌 한 **default 구문은 반드시 작성**해야 함
- 명시적 break를 하지 않아도 **자동으로 case마다 break**
- fallthrough 키워드를 사용하여 break를 무시할 수 있다.
- 쉼표(,)를 사용하여 하나의 case에 여러 패턴을 명시할 수 있다.

- **switch 구문의 기본 형태**

```swift
switch 비교값 {
case 패턴:
    /* 실행 구문 */
default:
    /* 실행 구문 */
}
```

- **switch 구문의 사용**

```swift
let someInteger = 100
// 범위 연산자 활용하면 더욱 쉽고 유용
switch someInteger {
case 0:
    print("zero")
case 1..<100: // .. : 1이상 100미만
    print("1~99")
case 100:
    print("100")
case 101...Int.max: // ... : 이상,이하
    print("over 100")
default:
    print("unknown")
} // 100

// 정수 외의 대부분의 기본 타입을 사용할 수 있다
switch "hey" {
case "jake": // 케이스 여러개 동일 동작 하려면 ,로 연결 혹은 fallthrough 사용
    print("jake")
case "mina":
    print("mina")
case "hey":
    print("hey!!")
default:
    print("unknown")
} // hey!!
```





### 10. 반복문

1. **for-in 구문**

- 기존 언어의 for-each 구문과 유사
- Dictionary의 경우 이터레이션 아이템으로 튜플이 들어온다.
- **for-in 구문 기본 형태**

```swift
for item in items {
    /* 실행 구문 */
}
```

- **for-in 구문의 사용**

```swift
var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 12]

for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입
for (name, age) in people {
    print("\(name): \(age)")
}
```





2. **while 구문**

- **while 구문의 기본 형태**

```swift
while 조건 {
    /* 실행 구문 */
}
```

- **while 구문의 사용**

```swift
while integers.count > 1 { // Bool 값만
    integers.removeLast()
}
```





3. **repeat-while 구문**

- 기존 언어의 **do-while** 구문과 형태/동작이 유사 -> `do` 가 오류 처리에서 사용되어 다르게 불림
- **repeat-while 구문의 기본 형태**

```swift
repeat {
    /* 실행 구문 */
} while 조건
```

- **repeat-while 구문의 사용**

```swift
repeat {
    integers.removeLast()
} while integers.count > 0
```





### 11. 옵셔널

1. **옵셔널이란??**

- **값이 있을 수도, 없을 수도 있음**
- **nil**이 할당 될 수 있는지 없는지 표현

```swift
// someOptionalParm에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?) {
       // ....
}

/// someParm에 nil이 할당 될 수 없다.
func someFunction(someParam: Int) {
       // ....
}

someFunction(someOptionalParam: nil) // 옵셔널 파라미터 nil 보낼 수 있음 
// someFunction(someParam: nil) // nil 파라미터로 보낼 수 없음
```





2. **옵셔널을 쓰는 이유**

- **명시적 표현**
  1. nil의 가능성을 코드만으로 표현가능
  2. 문서/주석 작성 시간 절약

- **안전한 사용**
  1. 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않고 사용가능
  2. 예외 상황을 최소화 하는 안전한 코딩
  3. 효율적 코딩





3. **옵셔널 문법과 선언**

- 옵셔널 문법 = enum + generics 
- 옵셔널 선언 - 열거형

```swift
enum Optional<Wrapped>: ExpressibleByNiliteral {
         case none
         case some(Wrapped)
}

let optionalValue: Optional<Int> = nil
let optionalValue: Int? = nil // Int의 옵셔널 타입. ? 띄어쓰면 안됨.
```



- **옵셔널 표현**

1. **느낌표**를 이용한 `암시적 추출 옵셔널 `

```swift
// Implicitly Unwrapped Optional
var OptionalValue: Int! = 100

switch OptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
OptionalValue = OptionalValue + 1

// nil 할당 가능
OptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
// nil 대입 후 값에 접근하려 하여서
//OptionalValue = OptionalValue + 1
```

2. **물음표**를 이용한 옵셔널

```swift
// Optional
var optionalValue: Int? = 100 // Int형이 들어있을수도 없을수도(nil) 있다.

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1
```





### 12. 옵셔널 추출

1. **옵셔널 추출이란?** 

- 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것





2. **옵셔널 방식**

- **옵셔널 바인딩**

1. **nil 체크 + 안전한 추출**
2. 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 값을 꺼내온다.
3. `if-let` 방식 사용

```swift
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil // 옵셔널 타입

//printName(myName)
// 전달되는 값의 타입(스트링 타입 아닌 옵셔널 타입)이 다르기 때문에 컴파일 오류발생

if let name: String = myName { // 변수 name은 if let 구문 내에서만 사용 가능
    printName(name)
} else {
    print("myName == nil")
}


var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}


// ,를 사용해 한 번에 여러 옵셔널을 바인딩 가능
// 모든 옵셔널에 값이 있을 때만 동작 (하나라도 nil 이면 X)
myName = "hey"
yourName = nil

if let name = myName, let friend = yourName { 
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행 X

yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// hey and hana
```



- **강체추출 **
1. 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식
2. 만약 값이 없을경우(nil), **런타임 오류**가 발생하기 때문에 추천되지 않는다.

```swift
var myName: String? = "hey"
var youName: String! = nil // 암시적 추출로 선언된 옵셔널 변수는 printName(yourName) 구문에서 !있다 가정됨.


printName(myName!) // 값 있음 -> hey 강제추출

myName = nil 

//print(myName!)
// 값이 없으므로 런타임 오류 발생

yourName = nil

//printName(yourName) // ! 없이 강제추출 가능. 알아서 붙여서 넘겨줌.
// nil 값이 전달되기 때문에 런타임 오류발생
```





## 2단원 - 다양한 표현 및 확장