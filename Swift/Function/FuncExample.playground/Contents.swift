import Cocoa

/*
 Mutating
 */
struct LevelStruct
{
    var level: Int = 0
    {
        didSet
        {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp()
    {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown()
    {
        print("Level Down")
        level -= 1
        if level < 0
        {
            reset()
        }
    }
    
    mutating func reset()
    {
        print("Reset!")
        level = 0
    }
    
    mutating func jumpLevel(to: Int)
    {
        print("Jump to \(to)")
        level = to
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 100)

/*
 가변 매개변수를 가지는 함수의 정의와 사용
 */
func sayHelloToFriends(me: String, friends names: String...) -> String
{
    var result: String = ""
    
    for friend in names
    {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}
print(sayHelloToFriends(me: "kyo", friends: "Johanson", "Jay", "Wizplan"))
print(sayHelloToFriends(me: "kyo"))

/*
 입출력 매개변수를 가지는 함수의 정의와 사용
 */
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int])
{
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int])
{
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])
