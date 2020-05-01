import Cocoa

let numbers: [Int] = [1, 2, 3]

// 첫번째 형태은 reduce(_:_:) 메서드의 사용

// 초깃값이 0이고 정수 배열의 모든 값을 더함
var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    return result + next
})

// 초기값이 3이고 정수 배열의 모든 값을 더함
let sumFromThree: Int = numbers.reduce(3){
    print("\($0) + \($1)")
    return $0 + $1
}

// 문자열 배열을 reduce(_:_:) 메서드를 이용하여 연결시킴
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reducedNames: String = names.reduce("my friends : ", {
    return $0 + ", " + $1
})
print(reducedNames)

// 초기값이 3이고 정수 배열의 모든 값을 뺌
// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서 직접 이전 값을 변경하다는 점이 다름
var subtractFromThree = numbers.reduce(into: 3, { $0 -= $1 })
print(subtractFromThree)

// 첫번째 리듀스 형태와 다르기 때문에 다른 컨테이너에 값을 변경하여 넣어줄 수도 있음
// 이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수 있음

// 홀수는 걸러내고 짝수만 두 배로 변경하여 초깃값이 [1, 2, 3] 배열에 직접 연산
var doubledNumbers: [Int] = numbers.reduce(into: [1, 2], { (result: inout [Int], next: Int) in
    print("result: \(result) next: \(next)")
    
    if next % 2 == 1
    {
        return
    }
    
    print("\(result) append \(next)")
    
    result.append(next * 2)
})

// 필터와 맵을 사용
doubledNumbers = [1, 2] + numbers.filter{ $0.isMultiple(of: 2) }.map { $0 * 2 }
print(doubledNumbers)

// 이름을 모두 대문자로 변환하여 초깃값인 빈 배열에 직접 연산
var upperCasedNames: [String] = names.reduce(into: [], { $0.append($1.uppercased()) })
print(upperCasedNames)

// 맵, 필터, 리듀스 메서드의 연계 사용
let numbers2: [Int] = [1, 2, 3, 4, 5, 6, 7]

// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더합니다
var result: Int = numbers2.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
print(result)
