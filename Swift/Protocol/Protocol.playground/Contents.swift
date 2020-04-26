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
