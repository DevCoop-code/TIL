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
//print(reversed2)

// ==> 단축 인자 이름
let reversed3: [String] = names.sorted {
    return $0 > $1
}
//print(reversed3)

/*
 값 획득
 */
func makeIncrementer(forIncrement amount: Int) -> (() -> Int)
{
    var runningTotal = 0
    func incrementer() -> Int
    {
        runningTotal += amount      //runningTotal 변수와 amount 변수를 값 획득한다
        return runningTotal
    }
    
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

//print(first)
//print(second)
//print(third)

//각각의 closure는 별개의 변수들을 참조
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first2: Int = incrementByTwo2()
let second2: Int = incrementByTwo2()
let third2: Int = incrementByTwo2()

let ten: Int = incrementByTen()
let twenty: Int = incrementByTen()
let thirty: Int = incrementByTen()

/*
 탈출 클로저
 */
typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

//first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure
{
    //전달 인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저
    return shouldReturnFirstClosure ? first : second
}

//함수엣서 반환한 클로저가 함수 외부의 상수에 저장
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()   //Closure A

var closures: [VoidVoidClosure] = []

// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저
func appendClosure(closure: @escaping VoidVoidClosure)
{
    // 전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출
    closures.append(closure)
}

//타입 내부 메서드의 매개변수 클로저에 @escaping 키워드를 사용하여 탈출 클로저임을 명시한 경우, 클로저 내부에서 해당 타입의 프로퍼티나 메서드, 서크스크립트 등에 접근하려면 self 키워드를 명시적으로 사용해야함
//비탈출 클로저의 경우 self 키워드 사용은 선택사항

func functionWithNonescapeClosure(closure: VoidVoidClosure)
{
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure
{
    return completionHandler
}

class SomeClass
{
    var x = 10
    
    func runNoescapeClosure()
    {
        // 비탈출 클로저에서 self 키워드 사용은 선택 사항
        functionWithNonescapeClosure {
            x = 200
        }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        //탈출 클로저에서는 명시적으로 self를 사용해야 함
        return functionWithEscapingClosure {
            self.x = 100
        }
    }
}

let instance: SomeClass = SomeClass()

instance.runNoescapeClosure()
//print(instance.x)

let returnedEscapeClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedEscapeClosure()
//print(instance.x)


//withoutActuallyEscaping 함수의 활용
//withoutActuallyEscaping
//1st parameter: 탈출클로저인 척해야하는 클로저가 전달
//2nd parameter: do 전달인자는 이 비탈출 클로저를 또 매개변수로 전달받아 실제로 작업을 수행할 탈출 클로저를 전달
let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool
{
    return withoutActuallyEscaping(predicate, do: {
        escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false )     //array.lazy의 경우 탈출형 closure를 사용해야함
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

/*
 자동 클로저
 */
var customersInLine: [String] = ["YoangWha", "SangYong", "Sunghun", "HaMi"]
print(customersInLine.count)

//클로저를 만들어두면 클로저 내부의 코드를 미리 실행(연산)하지 않고 가지고만 있음
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
//print(customersInLine.count)

// 실제 실행
//print("Now serving \(customerProvider())!")
//print(customersInLine.count)

func serveCustomer(_ customerProvider: () -> String)
{
    print("Now serving \(customerProvider())")
}

serveCustomer({ customersInLine.removeFirst() })

// ==> 자동 클로저 사용
/*
 매개변수에 @autoclosure 속성을 주었기 때문에 자동 클로저 기능을 사용.
 자동 클로저 속성을 부여한 매개변수는 클로저 대신 클로저의 실행결과인 reutrn 값을 전달인자로 받게 됨.
 아래 예시의 경우 return 값인 String 타입의 값이 자동 클로저 매개변수에 전달되면 String 값을 매개변수가 없는 String 값을 반환하는 클로저로 변환해줌
 자동 클로저는 전달인자를 갖지 않기 때문에 반환 타입의 값이 자동 클로저의 매개변수로 전달되면 이를 클로저로 바꿔줄 수 있음
 */
func serveCustomerWithAutoClosure(_ customerProvider: @autoclosure () -> String)
{
    print("Now serving \(customerProvider())")
}
serveCustomerWithAutoClosure(customersInLine.removeFirst()/*"hello world"*/)
