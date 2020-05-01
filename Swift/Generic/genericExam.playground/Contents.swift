import Cocoa

/*
 프로토콜과 제네릭을 이용한 전위 연산자 구현과 사용
 */
prefix operator **

prefix func ** <T: BinaryInteger>(value: T) -> T
{
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
print(sqrtFive)

/*
 제네릭을 사용한 swap 함수
 
 제네릭 함수는 실제 타입 이름(Int, String 등)을 써주는 대신에 플레이스홀더(placeholder)를 사용
 플레이스 홀더는 타입의 종류를 알려주지 않지만 어떤 타입인지는 알려줌. 즉, 매개변수로 같은 플레이스홀더 타입인 두 매개변수가 있는 경우 두 매개변수가 같은 타입이라는것 정도는 알수 있음
 플레이스 홀더 타입은 함수가 호출되는 그 순간 결정됨
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T)
{
    let temporaryA: T = a
    a = b
    b = temporaryA
}

var numberOne: Int = 5
var numberTwo: Int = 10

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

var stringOne = "A"
var stringTwo = "B"

swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

/*
 제네릭 타입
 */
struct Stack<Element>
{
    var items = [Element]()
    mutating func push(_ item: Element)
    {
        items.append(item)
    }
    mutating func pop() -> Element
    {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()
doubleStack.push(1.0)
doubleStack.push(2.0)
print(doubleStack.items)

//var doubleStack2: Stack = Stack()         //Error: Generic Parameter 넣어 주어야 함

extension Stack
{
    var topElement: Element?
    {
        return self.items.last
    }
}

print(doubleStack.topElement);      //Optional(2.0)

/*
 프로토콜 연관 타입
 */
protocol Container
{
    associatedtype ItemType     // 프로토콜에서 사용하는 placeholder의 이름, 제네릭에서 어떤 타입이 들어올지 모를 때, 타입 매개변수를 통해 종류는 모르지만 어떤 타입이 여기에 쓰일것이다 정도로의 표현을 위함
    var count: Int{ get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType{ get }
}
//연관된 ItemType 대신 실제 타입인 Int타입으로 구현
class MyContainer: Container
{
    var items: Array<Int> = Array<Int>()
    
    var count: Int
    {
        return items.count
    }
    
    func append(_ item: Int)
    {
        items.append(item)
    }
    
    subscript(i: Int) -> Int
    {
        return items[i]
    }
}

//만약 ItemType을 어떤 타입으로 사용할지 조금 더 명확하게 해주고 싶다면 typealias를 사용해 타입 별칭을 지정해 줄수 있음
struct IntStack: Container
{
    typealias ItemType = Int
    
    var items = [ItemType]()
    mutating func push(_ item: ItemType)
    {
        items.append(item)
    }
    mutating func pop() -> ItemType
    {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int)
    {
        self.push(item)
    }
    var count: ItemType
    {
        return items.count
    }
    subscript(i: ItemType) -> ItemType
    {
        return items[i]
    }
}
