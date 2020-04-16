# Swift

## Enumeration
1. 기본 열거형
   - DataType/EnumPractice01.playground
2. 열거형 응용
   - DataType/EnumPractice02.playground

## Property
1. 저장 프로퍼티(Stored Properties)
   - 인스턴스의 변수 또는 상수 의미
2. 연산 프로퍼티(Computed Properties)
   - 값을 저장하는 것이 아닌 특정 연산을 실행한 결과값을 의미(ex]get,set 변수)
3. 타입 프로퍼티(Type Properties)
   - Property/TypeProperty.playground
- 지연저장 프로퍼티(lazy stored properties)
  - 호출이 있어야 값을 초기화, lazy 키워드를 사용
- 프로퍼티 감시자(Property Observers)
  - 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있게 해주는 기능
  - Property/PropertyObservers.playground

## Closure
함수는 클로저의 한 형태
- 클로저의 3가지 형태
  - 이름이 있으면서 어떤 값도 획득하지 않는 전역함수의 형태
  - 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
  - 이름이 없고, 주변 문맥에 따라 값을 획득할 수 있는 축약 문법으로 작성한 형태

클로저 표현 방법은 클로저의 위치를 기준으로 크게 **기본 클로저 표현**과 **후행 클로저 표현**이 있음.

### 기본 클로저
클로저 통상적 표현 방식<br>
{
   (매개변수들) -> 반환 타입 in 실행코드
}
### 후행 클로저
 함수나 멧서드의 마지막 전달인자로 위치하는 클로저는 함수나 멧서드의 소괄호를 닫은 후 작성해도 가능 이것을 후행 클로저(Trailing Closure)라고 함<br>
클로저가 길어져 가독성이 떨어진다면 후행 클로저 사용을 추천<br>
후행 클로저는 맨 마지막 전달인자로 전달되는 클로저에만 해당됨. 전달인자로 클로저 여러 개를 전달할 때는 맨 마지막 클로저만 후행 클로저로 사용가능 그리고 단 하나의 클로저만 전달인자로 전달하는 경우에는 소괄호를 생략
- Closure/Closure01.playground