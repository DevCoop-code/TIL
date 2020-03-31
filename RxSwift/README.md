# RxSwift
Reactive Swfit framework

## ReactiveCocoa vs RxSwift
Comparison of the two most popular Functional Reactive Programming frameworks

### What is Functional Reactive Programming(FRP)?
Functional Reactive Programming is a combination of two other concepts<br>
1. **Reactive Programming**, which focuses on asynchronous data streams
2. **Functional Programming**, which emphasizes calculations via mathematical-style functions

## Reference - Swift Functional Programming
### What is Functional Programming?
Functional programming is a programming paradigm that emphasizes calculations via mathematical-style functions.<br>
Functional programming can make concurrency(동시성) and parallel processing(병렬적 처리) easier to work

### Example - Simple Array Filtering
Finds all the even numbers between 1 and 10<br>
Check the playground project: **Example_FunctionalProgramming/FilteringEvenNumbers.playground**

### Example - Reduce
Take the even numbers between 1 and 10 and compute their sum. This calls for what is known as a **reduce** function, which takes a set of inputs and generates a single output.<br>
Check the playground project: **Example_FunctionalProgramming/ReducingNumbers.playground**

### Example - Map
Making group a list of words into an index based on the first letter of each word

### Summarize Filter, Reduce, Map
3가지 모두 Array의 함수들<br>
Filter: Return이 bool인 Closure를 사용하여 배열에서 특정 부분만 추출(Filtering)<br>
Reduce: 배열의 값들을 합치거나 제일 큰 것을 찾는 등의 역할(말 그대로 배열을 줄이는 역할)<br>
Map: 기존 배열을 새로운 배열로 바꾸는 역할

## Reference
Swift Functional Programming: https://www.raywenderlich.com/2273-swift-functional-programming-tutorial <br>
ReactiveCocoa vs RxSwift: https://www.raywenderlich.com/1190-reactivecocoa-vs-rxswift <br>
Getting Started With RxSwift and RxCocoa: https://www.raywenderlich.com/1228891-getting-started-with-rxswift-and-rxcocoa