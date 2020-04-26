import Cocoa

/*
 [프로퍼티 요구]
 프로토콜에서 요구한 프로퍼티는 읽기 가능한 프로퍼티였지만 실제로 프로토콜을 채택한 클래스에서 구현할 대는 읽고 쓰기가 가능한
 프로퍼티로 구현해도 전혀 문제가 없음
 */
protocol Sendable
{
    var from: String { get }
    var to: String { get }
}

class Message: Sendable
{
    var sender: String
    
    var from: String
    {
        return self.sender
    }
    
    var to: String
    
    init(sender: String, receiver: String)
    {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable
{
    var from: String
    var to: String
    
    init(sender: String, receiver: String)
    {
        self.from = sender
        self.to = receiver
    }
}

/*
[메서드 요구]
static 키워드를 사용하여 요구한 타입 메서드를 클래스에서 실제 구현할 때는 static 키워드나 class 키워드 어느 쪽을 사용해도 무방
*/
// 무언가를 수신받을 수 있는 기능
protocol Receiveable
{
    func received(data: Any, from: Sendable2)
}

// 무언가를 발신 받을 수 있는 기능
protocol Sendable2
{
    var from: Sendable2 { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

// 수신, 발신이 가능한 Message 클래스
class Message2: Sendable2, Receiveable
{
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var from: Sendable2
    {
        return self
    }
    
    // 상대방은 수신 가능한 객체, 즉 Receiveable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var to: Receiveable?
    
    // 메시지를 발산
    func send(data: Any)
    {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        // 수신 가능한 인스턴스의 received 메서드를 호출
        receiver.received(data: data, from: self.from)
    }
    
    // 메시지를 수신
    func received(data: Any, from: Sendable2)
    {
        print("Message received \(data) from \(from)")
    }
    
    // class 메서드 이므로 상속이 가능
    class func isSendableInstance(_ instance: Any) -> Bool
    {
        if let sendableInstance: Sendable2 = instance as? Sendable2
        {
            return sendableInstance.to != nil
        }
        return false
    }
}

/*
 [가변 메서드 요구]
 */
protocol Resettable
{
    mutating func reset()
}

// 클래스이기 때문에 mutating 키워드를 붙이지 않아도 됨
class Person: Resettable
{
    var name: String?
    var age: Int?
    
    func reset()
    {
        self.name = nil
        self.age = nil
    }
}

// 구조체와 열거형은 mutating 키워드를 포함해야함
// !!!!! 만약 Resettable protocol에서 가변 메서드를 요구하지 않는다면, 값 타입의 인스턴스 내부 값을 변경하는 mutating 메서드는 구현이 불가능함 !!!!!
struct Point: Resettable
{
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset()
    {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable
{
    case east, west, south, north, unknown
    
    mutating func reset()
    {
        self = Direction.unknown
    }
}
let direct: Direction = .east
print(direct)

/*
 [이니셜라이저 요구]
 */
protocol Named
{
    var name: String { get }
    
    init(name: String)
}

struct Pet: Named
{
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
}

class Person2: Named
{
    var name: String
    
    // 클래스는 상속이 가능하기 때문에 모든 상속받는 클래스가 프로토콜의 이니셜라이져 요구를 준수해야 하므로 required 키워드를 붙여주어야 함
    required init(name: String)
    {
        self.name = name
    }
}

final class FinalPerson: Named
{
    var name: String
    
    // final은 상속 되지 않으므로 required 키워드를 붙여주지 않아도 괜찮음
    init(name: String)
    {
        self.name = name
    }
}

/*
 상속받은 클래스의 이니셜라이저 요구 구현 및 재정의
 */
class School
{
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
}

class MiddleSchool: School, Named
{
    required override init(name: String)
    {
        super.init(name: name)
    }
}

/*
 클래스 전용 프로토콜
 */
protocol Readable
{
    func read()
}

protocol ClassOnlyProtocol: class, Readable
{
    
}

class SomeClass: ClassOnlyProtocol
{
    func read()
    {
        
    }
}

// !!! Error 발생 classonlyprotocol은 클래스 타입에만 채택이 가능
//struct SomeStructure: ClassOnlyProtocol
//{
//    func read()
//    {
//
//    }
//}
