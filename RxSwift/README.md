# RxSwift
Reactive Swfit framework

## ReactiveCocoa vs RxSwift
Comparison of the two most popular Functional Reactive Programming frameworks

### What is Functional Reactive Programming(FRP)?
Functional Reactive Programming is a combination of two other concepts<br>
1. **Reactive Programming**, which focuses on asynchronous data streams
2. **Functional Programming**, which emphasizes calculations via mathematical-style functions

### ReactiveCocoa vs RxSwift
ReactiveCocoa and RxSwift handle several aspects of FRP differently
#### Hot vs Cold Signals
- A **cold signal** is a piece of work start when subscribe to it. Each new subscriber starts that work.
- A **hot signal** can already be sending events. New subscribers don't start it. Normally UI interactions are hot signals

#### Error Handling
RxSwift and ReactiveCocoa in both frameworks, there are three main events<br>
1. **Next<T>**: This event is sent every time a new value(of type T) is pushed into the stream of events
2. **Completed**: Indicates that the stream of events has ended. After tthis event, no Next<T> or Error<E> is sent.
3. **Error**: Indicates an error. After this event, no Next or Completed is sent
<br><br>
In ReactiveCocoa provides types for both hot and cold signals<br>
hot signals: Signal<T, E>, cold signals; SignalProducer<T, E><br>
In RxSwift both hot and cold Signals: Observable<T>
<br><br>
In ReactiveCocoa's hot and cold signal there are two parameterized types(Signal<T, E>, SignalProducer<T, E>). The second type(E) refers to a type that complies with the Error type Protocol<br>
In RxSwift the type is omitted and instead treated internally as a type that complies with ErrorType protocol

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
Making group a list of words into an index based on the first letter of each word<br>
Check the playground project: **Example_FunctionalProgramming/Indexing.playground**

### Summarize Filter, Reduce, Map
3가지 모두 Array의 함수들<br>
Filter: Return이 bool인 Closure를 사용하여 배열에서 특정 부분만 추출(Filtering)<br>
Reduce: 배열의 값들을 합치거나 제일 큰 것을 찾는 등의 역할(말 그대로 배열을 줄이는 역할)<br>
Map: 기존 배열을 새로운 배열로 바꾸는 역할

## Reference
Swift Functional Programming: https://www.raywenderlich.com/2273-swift-functional-programming-tutorial <br>
ReactiveCocoa vs RxSwift: https://www.raywenderlich.com/1190-reactivecocoa-vs-rxswift <br>
Getting Started With RxSwift and RxCocoa: https://www.raywenderlich.com/1228891-getting-started-with-rxswift-and-rxcocoa<br>
RxSwift Examples: https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md#simple-ui-bindings