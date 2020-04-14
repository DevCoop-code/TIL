import Cocoa

/*
 타입 프로퍼티(Type Property)
 타입 프로퍼티는 타입 자체에 영향을 미치는 프로퍼티
 인스턴스의 생성 여부와 상관없이 타입 프로퍼티의 값은 하나, 그 타입의 모든 인스턴스가 공통으로 사용하는 값(C언어의 static constant와 유사)
 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수(C언어의 static 변수와 유사)등을 정의할때 유용
 
 타입 프로퍼티 종류
 1. 저장 타입 프로퍼티: 반드시 초기값을 설정해야만 함(초기값은 지연(lazy) 연산됨)
 지연저장 프로퍼티와는 다르게 다중 스레드 환경이라고 하더라도 단 한번만 초기화된다는 보장이 있음(지연저장 프로퍼티의 경우 다중스레드 환경에서 여러번 초기화 됨)
 
 2. 연산 타입 프로퍼티
*/

class AClass
{
    //저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    //저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0
    {
        didSet
        {
            //Self.typeProperty는 AClass.typeProperty와 같은 표현
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    //연산 타입 프로퍼티
    static var typeComputedProperty: Int
    {
        get
        {
            return typeProperty
        }
    
        set
        {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)
