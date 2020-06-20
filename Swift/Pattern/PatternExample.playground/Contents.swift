import Cocoa

/*
 와일드카드 Pattern
 */
let string: String = "ABC"

switch string {
    // ABC -> 어떤 값이 와도 상관없기에 항상 실행
case _: print(string)
}

let optionalString: String? = "ABC"

switch optionalString {
    // optionalString이 Optional("ABC")일 때만 실행됨
case "ABC"?:
    print(optionalString)
    
    // optionalString이 Optional("ABC") 외의 값이 있을 때만 실행
case _?:
    print("Has value, but not ABC")
    
    // 값이 없을 때 실행
case nil:
    print("nil")
}

let hankyo = ("hankyo", 31, "Male")

switch hankyo {
    // 첫번째 요소가 hankyo인 경우에만 실행
case ("hankyo", _, _):
    print("Hello hankyo")
    
    //그 외 언제든지 실행
case (_, _, _):
    print("Who cares~")
}

for _ in 0..<2 {
    print("Hello")
}

/*
 값 바인딩 패턴
 */
switch hankyo {
    // name, age, gender를 hankyo의 각각의 요소와 바인딩함
case let (name, age, gender):
    print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch hankyo {
case (let name, let age, let gender):
    print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch hankyo {
    // 값 바인딩 패턴은 와일드카드 패턴과 결합하여 유용하게 사용이 가능
case (let name, _, let gender):
    print("Name: \(name), Gender: \(gender)")
}

/*
 튜플 패턴(Tuple Pattern)
 */
let (a): Int = 2
print(a)

let (x, y): (Int, Int) = (1, 2)
print(x)
print(y)

let name: String = "Jung"
let age: Int = 31
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _):
    print("Hello Jung!")
case (_, _, "Male"?):
    print("Who are you man?")
default:
    print("I don't know who you are")
}

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points {
    print(x)
}

/*
 열거형 케이스 패턴(Enumeratioon Case Pattern)
 */
let someValue: Int = 30

if case 0...100 = someValue {
    print("0 <= \(someValue) <= 100")
}
let anotherValue: String = "ABC"
if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "크림")  // 크림 파스타
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a pizza")
        return
    }
    
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break;
}

dinner = .rice
dishes.append(dinner)

if case .rice = dinner {
    print("Today's dinner is rice")
}

for dish in dishes {
    switch dish {
    case let .pasta(taste):
        print(taste)
    case let .pizza(dough, topping):
        print(dough, topping)
    case let .chicken(sauced):
        print(sauced ? "양념" : "후라이드")
    default:
        break
    }
}

/*
 옵셔널 패턴(Optional Pattern)
 */
var optionalValue: Int? = 100

if case .some(let value) = optionalValue {      // some: 사용한 불명확 타입 기능
    print(value)
}

if case let value? = optionalValue {
    print(value)
}

func isItHasValue(_ optionalValue: Int?) {
    guard case .some(let value) = optionalValue else {
        print("none")
        return
    }
    
    print(value)
}

isItHasValue(optionalValue)

while case .some(let value) = optionalValue {
    print(value)
    optionalValue = nil
}

print(optionalValue)

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}

/*
 타입 캐스팅 패턴
 */
let someValue2: Any = 100

switch someValue2 {
    // 타입이 Int인지 확인하지만 캐스팅된 값을 사용할 수는 없음
case is String:
    print("It's String!")
    
    // 타입 확인과 동시에 캐스팅까지 완료되어 value에 저장
    // 값 바인딩 패턴과 결합된 모습
case let value as Int:
    print(value + 1)
    
default:
    print("Int도 String도 아님")
}

/*
 표현 패턴
 */
switch 3 {
case 0...5:
    print("0과 5 사이")
default:
    print("0보다 작거나 5보다 큽니다")
}

var point: (Int, Int) = (1, 2)

// 같은 타입 간의 비교이므로 == 연산자를 사용해 비교
switch point {
case (0, 0):
    print("원점")
case (-2...2, -2...2):
    print("\(point.0), \(point.1)은 원점과 가깝습니다.")
default:
    print("point \(point.0), \(point.1)")
}

// String 타입과 Int 타입이 매치될 수 있도록 ~= 연산자를 정의함
// case tuple 첫번째 원소와 switch 변수의 첫번째 변수와 매칭, case tuple 두번째 원소와 switch 변수의 두번째 변수와 매칭,,,,,
func ~= (pattern: String, value: Int) -> Bool {     // switch case 문 표현식
    print("[Pattern: \(pattern) value: \(value)]")
    return pattern == "\(value)"
}

point = (0, 0)

// 새로 정의된 ~= 연산자를 사용하여 비교
switch point {
case ("0", "0"):
    print("원점")
default:
    print("point (\(point.0)), (\(point.1))")
}


struct Person {
    var name: String
    var age: Int
}

let lingo: Person = Person(name: "Lingo", age: 31)
func ~= (pattern: String, value: Person) -> Bool {
    return pattern == value.name
}

func ~= (pattern: Person, value: Person) -> Bool {
    return (pattern.name == value.name) && (pattern.age == value.age)
}

switch lingo {
case Person(name: "Lingo", age: 31):
    print("Same Person!!")
case "Lingo":
    print("Hello Lingo!!")
default:
    print("I don't know who you are")
}

// Generic을 사용한 표현 패턴 활용
// Generic을 사용하기 위해 프로토콜을 정의
// 프로토콜과 제네릭을 더해 특정 프로토콜을 따르는 타입에 대해서 원하는 패턴을 만들 수 있음
protocol Personalize {
    var name: String { get }
    var age: Int { get }
}

struct Man: Personalize {
    var name: String
    var age: Int
}

let star: Man = Man(name: "star", age: 31)

// Generic을 사용하여 패턴 연산자를 정의
func ~= <T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}

func ~= <T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

// 기존 패턴 연산자가 없더라도 제네릭 패턴 연산자로 똑같이 사용이 가능
switch star {
case Man(name: "star", age: 31):
    print("Same Person!!")
case "star":
    print("Hello Star")
default:
    print("I don't know who you are")
}

/*
 제네릭을 사용하여 패턴 연산자를 정의(패턴 자체가 함수임을 유의)
 */
func ~= <T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}
// 패턴에 사용할 제네릭 함수
func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
case young:
    print("\(star.name) is young")
default:
    print("\(star.name) is old")
}

// 패턴에 사용할 제네릭 함수
func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool) {
    return { (value: T) -> Bool in value.name == pattern }
    // 패턴과 값을 비교할 클로저를 반환
}

switch star {
    // 패턴결합을 하면 isNamed("Jung")(star)와 같은 효과를 봄
case isNamed("Jung"):
    print("He is Jung")
default:
    print("Another person")
}

// 연산자가 함수라는 점을 생각하면 이러한 방식으로도 구현이 가능
prefix operator ==?

prefix func ==? <T: Personalize>(pattern: String) -> ((T) -> Bool) {
    return isNamed(pattern)
}

switch star {
case ==?"Jung":
    print("He is Jung")
default:
    print("Another person")
}
