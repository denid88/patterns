import 'builder.dart'
  show
    PizzaBase,
    PizzaDoughDepth,
    PizzaDoughType,
    PizzaSauceType,
    PizzaTopLevelType;

export 'builder.dart'
  show
    PizzaBase,
    PizzaDoughDepth,
    PizzaDoughType,
    PizzaSauceType,
    PizzaTopLevelType;

/// Прототип — это порождающий паттерн проектирования, который позволяет
/// копировать объекты, не вдаваясь в подробности их реализации.


/// Достоинства
/// - клонирование обьектов без привязки к их конкретных классам
/// - ускорение создания обьектов и уменьшение повторяющегося кода при
/// инициализации
///
/// Недостатки
/// сложно осуществить клонирование сложных обьектов
abstract class IPrototype {
  Pizza clone();
}

class Pizza implements IPrototype {
  String name;
  PizzaBase dough;
  PizzaSauceType sauce;
  int cookingTime;
  List<PizzaTopLevelType> topping;

  Pizza({
    this.name = 'Brick',
    this.dough = const PizzaBase(PizzaDoughType.wheat, PizzaDoughDepth.thin),
    this.sauce = PizzaSauceType.barbeque,
    this.cookingTime = 10,
    this.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella
    ]
  });

  factory Pizza._fromPizza(Pizza pizza) {
    return Pizza(
      name: pizza.name,
      dough: PizzaBase(pizza.dough.pizzaDoughType, pizza.dough.pizzaDoughDepth),
      cookingTime: pizza.cookingTime,
      topping: [...pizza.topping]
    );
  }

  @override
  String toString() {
    var infoStr = 'Pizza name: $name \n';
    infoStr += dough.toString();
    infoStr += 'sauce type: ${sauce.toString().split('.')[1]}';
    infoStr += 'topping: ';
    infoStr += topping.join(', ');
    infoStr += '\n';
    infoStr += 'cooking time: $cookingTime minutes';
    return infoStr;
  }

  @override
  Pizza clone() => Pizza._fromPizza(this);
}
