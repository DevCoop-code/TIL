import Cocoa

/*
 전위 연산자 구현과 사용
 */
prefix operator **

prefix func ** (value: Int) -> Int
{
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)

/*
 전위 연산자 함수 중복 정의와 사용
  기존에 존재하는 전위 연산자 중 정수에 사용되는 느낌표(!)를 문자열에 사용하고자 함
 */
prefix func ! (value: String) -> Bool
{
    return value.isEmpty
}

var stringValue: String = "hankyo"
var isEmptyString: Bool = !stringValue

print(isEmptyString)

var stringValue2: String = ""
var isEmptyString2: Bool = !stringValue2

print(isEmptyString2)

/*
 사용자 정의 전위 연산자 함수 중복 정의와 사용
 */
prefix func ** (value: String) -> String
{
    return value + " " + value
}
let resultString: String = **"hankyo"

print(resultString)

/*
 사용자 정의 후위 연산자 정의와 함수 구현
 하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위연산을 먼저 수행하게 됨
 */
postfix operator **
postfix func ** (value: Int) -> Int
{
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = 5**
print(fivePlusTen)

let howToDoit: Int = **5**
print(howToDoit)

/*
 중위 연산자 정의
 */
infix operator ** : MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool
{
    return lhs.contains(rhs)
}
let isContains: Bool = "watermellon" ** "mellon"
