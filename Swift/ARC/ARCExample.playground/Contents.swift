import Cocoa

// 강한 참조의 참조 횟수 확인
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "hankyo") // 인스턴스의 참조 횟수 : 2

reference2 = reference1     // 인스턴스의 참조 횟수 : 2
reference3 = reference1     // 인스턴스의 참조 횟수 : 3

reference3 = nil            // 인스턴스의 참조 횟수 : 2
reference2 = nil            // 인스턴스의 참조 횟수 : 1
reference1 = nil            // 인스턴스의 참조 횟수 : 0

// 강한참조 지역변수(상수)dml 참조 횟수 확인
var globalReference: Person?
func foo() {
    let hankyo: Person = Person(name: "hankyo")     // 인스턴스 참조 횟수 : 1
    
    // 함수 종료 시점
    // 인스턴스 참조 횟수 -1
//    var globalReference: Person? = hankyo
    globalReference = hankyo
}
foo()

/*
 강한 참조 순환 문제
 */
class Human {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var host: Human?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var hankyo: Human? = Human(name: "hankyo")      // Human의 인스턴스 참조 1
var room: Room? = Room(number: "505")           // Room의 인스턴스 참조 1

room?.host = hankyo                             // Human의 인스턴스 참조 2
hankyo?.room = room                             // Room의 인스턴스 참조 2

hankyo = nil                                    // Human의 인스턴스 참조 1
room = nil                                      // Room의 인스턴스 참조 1

// Person의 인스턴스를 참조할 방법 상실 - 메모리에 잔존
// Room의 인스턴스를 참조할 방법 상실 - 메모리에 잔존


// 약한 참조
class StrongHuman {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: WeakRoom?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class WeakRoom {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    weak var host: StrongHuman?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var strongHankyo: StrongHuman? = StrongHuman(name: "hankyo")    // StrongHuman의 인스턴스 참조 1
var weakRoom: WeakRoom? = WeakRoom(number: "505")   // WeakRoom의 인스턴스 참조 1

weakRoom?.host = strongHankyo                       // StrongHumaan의 인스턴스 참조 1
strongHankyo?.room = weakRoom                       // WeakRoom의 인스턴스 참조 2

strongHankyo = nil          // StrongHuman의 참조 횟수 0, WeakRoom 인스턴스의 참조 횟수 1(StrongHuman이 메모리에서 해제되면서 WeakRoom을 해제시킴)
