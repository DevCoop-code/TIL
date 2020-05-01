import Cocoa

// 무언가를 수신할 수 있는 기능
protocol Receiveable
{
    func received(data: Any, from: Sendable)
}
extension Receiveable
{
    // 메시지를 수신합니다
    func received(data: Any, from: Sendable)
    {
        print("\(self) received \(data) from \(from)")
    }
}

// 무언가를 발신할 수 있는 기능
protocol Sendable
{
    var from: Sendable{ get }
    var to: Receiveable?{ get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}
extension Sendable
{
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스 여야 함
    var from: Sendable
    {
        return self
    }
    
    // 메세지 발신
    func send(data: Any)
    {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        // 수신 가능한 인스턴스의 received 메서드를 호출
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool
    {
        if let sendableInstance: Sendable = instance as? Sendable
        {
            return sendableInstance.to != nil
        }
        return false
    }
}

// 수신, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable
{
    var to: Receiveable?
}

// 수신, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable
{
    var to: Receiveable?
}

// 두 Message 인스턴스를 생성
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

// 아직 수신받을 인스턴스가 존재하지 않음
myPhoneMessage.send(data: "Hello")      // Message has no receiver

// Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있음
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")      // Message received Hello from Message

// Mail 인스턴스를 2개 생성
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")     // Message has no receiver

// Message와 Mail 모두 Sendable와 Receiveable 프로토콜을 준수하므로 서로 주고 받는 것이 가능
myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

// String은 Sendable 프로토콜을 준수하지 않음
Message.isSendableInstance("Hello")

// Message와 Mail은 Sendable 프로토콜을 준수함
Message.isSendableInstance(myPhoneMessage)

// yourPhoneMessage는 to프로퍼티가 설정되지 않아 보낼 수 없는 상태
Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)
