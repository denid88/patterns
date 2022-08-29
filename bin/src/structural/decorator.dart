/// Декоратор — это структурный паттерн проектирования, который позволяет
/// динамически добавлять объектам новую функциональность, оборачивая их в
/// полезные «обёртки».

/// Механизм наследования имеет несколько досадных проблем.
/// - Он статичен. Вы не можете изменить поведение существующего объекта.
///   Для этого вам надо создать новый объект, выбрав другой подкласс.
/// - Он не разрешает наследовать поведение нескольких классов одновременно.
///   Из-за этого вам приходится создавать множество подклассов-комбинаций
///   для получения совмещённого поведения.

/// Одним из способов обойти эти проблемы является замена наследования
/// агрегацией либо композицией

abstract class IPizzaBase {
  int cost();
}

class PizzaBase implements IPizzaBase {
  final int _cost;

  PizzaBase(this._cost);

  @override
  int cost() => _cost;
}

abstract class IDecorator implements IPizzaBase {
  String name();
}

abstract class ILabelDecorator implements IDecorator {
  bool hasLabel();
}

class PizzaMargarita implements ILabelDecorator {
  final IPizzaBase _wrapper;
  final int _cost;

  PizzaMargarita(this._cost, this._wrapper);

  @override
  int cost() => _cost + _wrapper.cost();

  @override
  String name() => 'Margarita';

  @override
  bool hasLabel() => false;
}

class PizzaSalami implements ILabelDecorator {
  final IPizzaBase _wrapper;
  final int _cost;

  PizzaSalami(this._cost, this._wrapper);

  @override
  int cost() => (_cost + _wrapper.cost()) * 2;

  @override
  String name() => 'Salami';

  @override
  bool hasLabel() => true;
}

void printPizzaInfo(ILabelDecorator pizza) {
  print('Стоимость пиццы ${pizza.name()} = ${pizza.cost()}. Зарегистрирован бренд: ${pizza.hasLabel() ? 'Да': 'Нет'}');
}