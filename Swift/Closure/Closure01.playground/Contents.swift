import Cocoa

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool
{
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
//print(reversed)

// ==> Closure로 표현 변경

let reversed_closure: [String] = names.sorted(by:{ (first: String, second: String) -> Bool in
    print("\(first) \(second) 비교중")
    return first > second
})
//print(reversed_closure)

// ==> 후행 Closure 사용
let reversed_trailingclosure: [String] = names.sorted(){
(first: String, second: String) -> Bool in
    print("\(first) \(second) 비교중")
    return first > second
}
//print(reversed_trailingclosure)

// ==> 후행 Closure 더욱 간소화 - 메서드의 소괄호까지 생략 가능
let reversed_trailingclosureEasy: [String] = names.sorted {
    (first: String, second: String) -> Bool in
    print("\(first) \(second) 비교중")
    return first > second
}
print(reversed_trailingclosureEasy)
