import Cocoa

/*
항목 순회
열거형에 포함된 모든 케이스를 알고자 할 때 사용
열거형 이름 뒤에 콜론(:)을 작성 한 후 "CaseIterable" 프로토콜을 사용
열거형에 allCases라는 이름의 타입 프로퍼티를 통해 모든 케이스의 컬렉션을 생성
*/

enum School: CaseIterable
{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [School] = School.allCases
//print(allCases)

/*
 원시값을 가지는 항목일 경우 원시값의 타입 다음에 쉼표(,)를 쓰고 띄어쓰기를 한 후 "CaseIterable" 프로토콜을 채택
 */
enum Academy: String, CaseIterable
{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}
let academyAll: [Academy] = Academy.allCases
print(academyAll)

/*
 CaseIterable 프로토콜을 원활히 사용하지 못하는 경우 1
 - available 속성을 통해 특정 케이스를 플랫폼에 따라 나눌 경우 CaseIterable 프로토콜을 채택히는 것만으로 allCases 프로퍼티를 사용할 수 없음
 ==> 이럴 경우 직접 allCases 프로퍼티를 구현해주어야 함
 */
enum School2: String, CaseIterable
{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School2]
    {
        let all: [School2] = [.primary,
                              .elementary,
                              .middle,
                              .high,
                              .college,
                              .university]
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases2: [School2] = School2.allCases
print(allCases2)

/*
CaseIterable 프로토콜을 원활히 사용하지 못하는 경우 2
- 열거형 케이스가 연관 값을 가지는 경우
==> 이럴 경우 직접 allCases 프로퍼티를 구현해주어야 함
*/
enum PastaTaste: CaseIterable
{
    case cream, tomato
}
enum PizzaDough: CaseIterable
{
    case cheeseCrust, thin, original
}
enum PizzaTopping: CaseIterable
{
    case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable
{
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish]
    {
        return PastaTaste.allCases.map(MainDish.pasta)
            + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in
                result + PizzaTopping.allCases.map { (topping) -> MainDish in
                    MainDish.pizza(dough: dough, topping: topping)
                }
        }
            + [true, false].map(MainDish.chicken)
            + [MainDish.rice]
    }
}
print(MainDish.allCases.count)
print(MainDish.allCases)
