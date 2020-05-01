import Cocoa

/*
 for-in 구문과 맵 매서드의 사용비교
 */
let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 사용
for number in numbers
{
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)

//map 메서드 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in return number * 2})
strings = numbers.map({ (number: Int) -> String in return"\(number)" })

print(doubledNumbers)
print(strings)

// ==> 클로저 사용하여 더욱 간략화
// 매개변수 및 반환 타입 생략
doubledNumbers = numbers.map({ return $0 * 2})
// 반환 키워드 생략
doubledNumbers = numbers.map({ $0 * 2})
// 후행 클로저 사용
doubledNumbers = numbers.map{ $0 * 2 }

// 클로저의 반복 사용
let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [0, 1, 3, 5, 7]

let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubledEvenNumbers)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubledOddNumbers)

// 다양한 컨테이너 타입에서의 맵의 활용
// Dictionary
let alphabetDictionary : [String : String] = ["a":"A", "b":"B"]

var keys: [String] = alphabetDictionary.map({ (tuple: (String, String)) -> String in
    return tuple.0
})
keys = alphabetDictionary.map{ $0.0 }

let values: [String] = alphabetDictionary.map{ $0.1 }

print(keys)
print(values)

// Set
var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)

//Error
//let: optionalInt: Int? = 3
//let resultInt: Int? = optionalInt.map{ $0 * 2 }
//print(resultInt)  //Error

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)
