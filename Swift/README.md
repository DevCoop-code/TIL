# Swift

## Projects

### Enumeration
1. DataType/EnumPractice01.playground
   - 열거형의 응용으로 열거형 변수들끼리 연관을 지은 프로젝트. 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있습니다.
2. DataType/EnumPractice02.playground
   - 열거형의 CaseIterable을 사용해 allCases를 사용하지 못하는 경우가 존재, 이럴경우 직접 allCases를 정의해주어야 함

### Property
1. 저장 프로퍼티(Stored Properties)
   - 인스턴스의 변수 또는 상수 의미
2. 연산 프로퍼티(Computed Properties)
   - 값을 저장하는 것이 아닌 특정 연산을 실행한 결과값을 의미(ex]get,set 변수)
3. 타입 프로퍼티(Type Properties)

- 지연저장 프로퍼티(lazy stored properties)
  - 호출이 있어야 값을 초기화, lazy 키워드를 사용
- 프로퍼티 감시자(Property Observers)
  - 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있게 해주는 기능
  - Property/PropertyObservers.playground