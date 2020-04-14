import Cocoa

/*
 연관 값
 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있음
 연관값은 각 항목 옆에 소괄호로 묶어 표현
 */
enum MainDish
{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner:MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice


enum PastaTaste
{
    case cream
    case tomato
}
enum PizzaDough
{
    case cheeseCrust
    case thin
    case original
}
enum pizzaTopping
{
    case pepperoni, cheese, bacon
}

enum ItaliaDish
{
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: pizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var italy_dinner: ItaliaDish = ItaliaDish.pasta(taste: PastaTaste.tomato)
italy_dinner = ItaliaDish.pizza(dough: PizzaDough.cheeseCrust, topping: pizzaTopping.bacon)
