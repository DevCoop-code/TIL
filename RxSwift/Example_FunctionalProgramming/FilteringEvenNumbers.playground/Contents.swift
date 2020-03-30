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
print(evens)

/*
 Using Functional
 Below is the Functional version. and IT's comprised of two parts:
 1. Array(1...10): Simple and Convenient way to create an array containing the numbers 1 through 10
 2. filter: This method, exposed by Array, creates and returns a new array that contains only the items
 */
func isEven(number: Int) -> Bool
{
    return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
print(evens)

//isEven is as a parameter to filter, the functions are just named closures
evens = Array(1...10).filter { (number) in number % 2 == 0 }
print(evens)

evens = Array(1...10).filter{ $0 % 2 == 0 }
print(evens)

/*
 [Custom Filter Implementation]
 Swift arrays have a number of functional methods, such as [map], [join] and [reduce]
 
 source: Array
 predicate: Closure Function
 */
func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T]
{
    var result = [T]()
    for i in source
    {
        if predicate(i)
        {
            result.append(i)
        }
    }
    return result
}

evens = myFilter(source: Array(1...10), predicate: { $0 % 2 == 0 })
print(evens)
