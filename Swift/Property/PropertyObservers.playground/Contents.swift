import Cocoa

/*
 프로퍼티 감시자(Property Observers)
 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있음.
 프로퍼티 감시자는 프로퍼티의 값이 새로 할당될 때마다 호출
 지연저장프로퍼티(lazy stored properties)에서는 사용할 수 없음 오로지 일반 저장 프로퍼티에만 적용 or 프로퍼티 재정의해 상속받은 저장 프로퍼티 or 프로퍼티 재정의해 상속받은 연산 프로퍼티에 적용 가능
 상속받지 않은 연산프로퍼티는 사용 불가능(get, set으로 프로퍼티 감시자의 역할을 대신할 수 있기 때문)
 
 1. willSet Method
 -> 프로퍼티의 값이 변경되기 직전 호출
 2. didSet Method
 -> 프로퍼티 변경된 직후 호출
 
 willSet 호출 -> 프로퍼티 값 변경 -> didSet 호출
 
 willSet과 didSet 메서드에는 매개변수가 하나씩 존재.
 willSet의 매개변수(default: newValue): 프로퍼티가 변경될 값
 didSet의 매개변수(default: oldValue): 프로퍼티가 변경되기 전의 값
*/


class Account
{
    var credit: Int = 0     //저장 프로퍼티
    {
        willSet
        {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet
        {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경될 예정입니다.")
        }
    }
    
    var dollarValue: Double     // 연산 프로퍼티
    {
        get
        {
            return Double(credit) / 1000
        }
        set
        {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

//let myAccount: Account = Account()
//
//myAccount.credit = 1000

class ForeignAccount: Account
{
    override var dollarValue: Double        //연산 프로퍼티도 상속되었다면 프로퍼티 감시자를 사용할 수 있음
    {
        willSet
        {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        didSet
        {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()

myAccount.credit = 1000

myAccount.dollarValue = 2
