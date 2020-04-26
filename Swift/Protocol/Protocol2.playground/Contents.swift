import Cocoa
import Foundation

protocol Named
{
    var name: String { get }
}

protocol Aged
{
    var age: Int { get }
}

struct Person: Named, Aged
{
    var name: String
    var age: Int
}

class Car: Named
{
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
}

class Truct: Car, Aged
{
    var age: Int
    
    init(name: String, age: Int)
    {
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named & Aged)
{
    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
}

let person: Person = Person(name: "hankyo", age: 30)
celebrateBirthday(to: person)

let myCar: Car = Car(name: "Boong Boong Ie")
//celebrateBirthday(to: myCar)  // Error! Aged protocol이 없음

// (클래스 & 프로토콜) 조합에서 클래스 타입은 한 타입만 조합할 수 있음
//var someVariable: Car & Truct & Aged

// Car 클래스의 인스턴스 역할고 Aged 프로토콜을 준수하는 인스턴스 할당
var someVariable: Car & Aged

// Truct 인스턴스는 Car 클래스와 Aged 프로토콜도 준수하므로 할당이 가능
someVariable = Truct(name: "TTrust", age: 10)

// Error: Car 인스턴스인 myCar는 Aged 프로토콜을 준수하지 않으므로 할당이 불가능
//someVariable = myCar

@objc protocol Moveable
{
    func walk()
    @objc optional func fly()
}

// 걷기만 할 수 있는 호랑이
class Tiger: NSObject, Moveable
{
    func walk()
    {
        print("Tiger walks")
    }
}

// 걷고 날 수 있는 새
class Bird: NSObject, Moveable
{
    func walk()
    {
        print("Bird walks")
    }
    
    func fly()
    {
        print("Bird flys")
    }
}


let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()
bird.walk()
bird.fly()

if let moveableInstance: Moveable = tiger as? Moveable
{
    moveableInstance.fly?()
}

if let moveableInstance: Moveable = bird
{
    moveableInstance.fly?()
}

