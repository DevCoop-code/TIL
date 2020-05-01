import Cocoa

let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }
print(oddNumbers)

// 맵과 필터 메서드의 연계 사용
let mappedNumbers: [Int] = numbers.map{ $0 + 3 }
let evenNumbers2: [Int] = mappedNumbers.filter{ $0 % 2 == 0 }
print(evenNumbers2)

// 메서드를 체인처럼 연결하여 사용하는 것도 가능
let oddNumbers2: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbers2)
