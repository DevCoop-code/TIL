import Cocoa
/*
Old Way(Not Functional)
*/
var evens = [Int]()
for i in 1...10
{
    if i % 2 == 0
    {
        evens.append(i)
    }
}

var evenSum = 0
for i in evens
{
    evenSum += i
}
print(evenSum)

/*
 Using Functional
 
 To understand how reduce works, look at its signature
 func reduce<U>(initial: U, combine: (U, T) -> U) -> U
*/
evenSum = Array(1...10)
    .filter { (number) in number % 2 == 0 }
    .reduce(0) { (total, number) in total + number }    //reduce first parameter is the initial value
print(evenSum)

let maxNumber = Array(1...10).reduce(0) { (total, number) in max(total, number) }
print(maxNumber)

let numbers = Array(1...10).reduce("numbers: ") { (total, number) in total + "\(number) " }
print(numbers)

extension Array
{
    func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U
    {
        var current = seed
        for item in self
        {
            current = combiner(current, item as! T)
        }
        return current
    }
}

let numbers2 = Array(1...10).myReduce(seed: 0, combiner: { (total, number) in total + number })
print(numbers2)
