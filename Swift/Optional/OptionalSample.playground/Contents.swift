import Cocoa

class Room
{
    var number: Int
    
    init(number: Int)
    {
        self.number = number
    }
}

class Building
{
    var name: String
    var room: Room?
    
    init(name: String)
    {
        self.name = name
    }
}

struct Address
{
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person
{
    var name: String
    var address: Address?
    
    init(name: String)
    {
        self.name = name
    }
}

let person01: Person = Person(name: "Steve")
let steveRoomViaOptionalChaining: Int? = person01.address?.building?.room?.number
//let steveRoomViaOptionalChaining: Int? = person01.address!.building!.room!.number //Runtime Error 발생

var roomNumber: Int? = nil

// ==> Optional Binding
if let steveAddress: Address = person01.address
{
    if let steveBuilding: Building = steveAddress.building
    {
        if let steveRoom: Room = steveBuilding.room
        {
            roomNumber = steveRoom.number
        }
    }
}

if let number: Int = roomNumber
{
    print(number)
}
else
{
    print("Cannot find room number")
}

// ==> Optional Chaining        <-- Much More Easy
if let roomNumber: Int = person01.address?.building?.room?.number
{
    print(roomNumber)
}
else
{
    print("Cannot find room number")
}

person01.address?.building?.room?.number = 505
print(person01.address?.building?.room?.number)
