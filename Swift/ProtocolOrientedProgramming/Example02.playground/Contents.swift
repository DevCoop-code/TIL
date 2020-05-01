import Cocoa

/*
 제네릭, 프로토콜, 익스텐션을 통한 재사용 가능한 코드 작성
 */
protocol SelfPrintable
{
    func printSelf()
}
extension SelfPrintable where Self: Container
{
    func printSelf()
    {
        print(items)
    }
}

protocol Container: SelfPrintable
{
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
extension Container
{
    mutating func append(item: ItemType)
    {
        items.append(item)
    }
    
    var count: Int
    {
        return items.count
    }
    
    subscript(i: Int) -> ItemType
    {
        return items[i]
    }
}

protocol Popable: Container
{
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}
extension Popable
{
    mutating func pop() -> ItemType?
    {
        return items.removeLast()
    }
    mutating func push(_ item: ItemType)
    {
        self.append(item: item)
    }
}

protocol Insertable: Container
{
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}
extension Insertable
{
    mutating func delete() -> ItemType?
    {
        return items.removeFirst()
    }
    mutating func insert(_ item: ItemType)
    {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable
{
    var items: [Element] = [Element]()
}

struct Queue<Element>: Insertable
{
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

myIntStack.push(3)
myIntStack.printSelf()

myIntStack.push(2)
myIntStack.printSelf()

myIntStack.pop()
myIntStack.printSelf()

myStringStack.push("A")
myStringStack.printSelf()

myStringStack.push("B")
myStringStack.printSelf()

myStringStack.pop()
myStringStack.printSelf()

myIntQueue.insert(3)
myIntQueue.printSelf()

myIntQueue.insert(2)
myIntQueue.printSelf()

myIntQueue.delete()
myIntQueue.printSelf()

myStringQueue.insert("A")
myStringQueue.printSelf()

myStringQueue.insert("B")
myStringQueue.printSelf()

myStringQueue.delete()
myStringQueue.printSelf()
