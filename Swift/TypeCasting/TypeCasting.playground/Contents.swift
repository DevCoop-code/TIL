import Cocoa

class Coffee
{
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shots \(name)"  //Removing the "Get" Keyword
    }
    
    init(shot: Int)
    {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee
{
    var flavor: String
    
    override var description: String
    {
        return "\(shot) shots \(flavor) latte"
    }
    
    init(flavor: String, shot: Int)
    {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee
{
    let iced: Bool
    
    override var description: String
    {
        return "\(shot) shots \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool)
    {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let americanoCoffee: Americano = Americano(shot: 2, iced: false)
print(americanoCoffee.description)

let latteeCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(latteeCoffee.description)

//print(coffee is Coffee)
//print(coffee is Americano)
//print(coffee is Latte)
//
//print(americanoCoffee is Coffee)
//print(latteeCoffee is Coffee)
//
//print(americanoCoffee is Latte)
//print(latteeCoffee is Latte)

/*
 [메타 타입]
 */
protocol SomeProtocol { }
class SomeClass: SomeProtocol { }

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
someType = stringType
someType = classType
someType = protocolProtocol
//print(someType)

//type(of:) 함수를 사용하여 타입이 맞는지를 확인
//print(type(of: coffee) == Coffee.self)
//print(type(of: coffee) == Americano.self)
//print(type(of: coffee) == Latte.self)

if let actionOne: Americano = coffee as? Americano
{
    print("This is Americano")
}
else
{
    print(coffee.description)
}

if let ActionTwo: Coffee = americanoCoffee as? Coffee
{
    print("This is Just Coffee")
}
else
{
    (americanoCoffee.description)
}
