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
 Type
 */
