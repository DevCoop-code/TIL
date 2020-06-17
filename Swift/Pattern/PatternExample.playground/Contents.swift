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
