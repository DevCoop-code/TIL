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
//print(reversed_trailingclosureEasy)

/*
 클로저 표현 간소화
 */
// ==> 문맥을 이용한 타입 유추
let reversed2: [String] = names.sorted {
    (first, second) in
    return first > second
}
print(reversed2)

// ==> 단축 인자 이름
let reversed3: [String] = names.sorted {
    return $0 > $1
}
print(reversed3)
