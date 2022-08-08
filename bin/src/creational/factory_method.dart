/// Фабричный метод — это порождающий паттерн проектирования, который определяет
/// общий интерфейс для создания объектов в суперклассе, позволяя подклассам
/// изменять тип создаваемых объектов.

///Factory method
abstract class Transport {}

class Truck implements Transport {}
class Ship implements Transport {}

abstract class Logistic {
  Transport createTransport();
}

class RoadLogistic implements Logistic {
  @override
  Transport createTransport() {
    print('Instance Truck was created');
    return Truck();
  }
}

class SeaLogistic implements Logistic {
  @override
  Transport createTransport() {
    print('Instance Ship was created');
    return Ship();
  }
}

/// Example Coffee factory with switch construction
abstract class CoffeeProduct {}

class Coffee implements CoffeeProduct {}
class Cacao implements CoffeeProduct {}

enum CoffeeProductType {coffee, cacao}

class CoffeeFactory {
  static CoffeeProduct? createCoffeeProduct(CoffeeProductType type) {
    switch(type) {
      case CoffeeProductType.coffee:
        return Coffee();
      case CoffeeProductType.cacao:
        return Cacao();
      default:
        break;
    }
    return null;
  }
}

///One more example-practise with buttons and interfaces
abstract class Dialog {
  Button createButton();
}

abstract class Button {}

class WindowsButton implements Button {
  WindowsButton() { print('$runtimeType is initialized'); }
}

class HTMLButton implements Button {
  HTMLButton() { print('$runtimeType is initialized'); }
}

class WindowsDialog implements Dialog {
  @override
  Button createButton() => WindowsButton();
}

class WebDialog implements Dialog {
  @override
  Button createButton() => HTMLButton();
}

/*
* * https://refactoring.guru/ru/design-patterns/factory-method
*/
// Приведите все создаваемые продукты к общему интерфейсу.
//
// В классе, который производит продукты, создайте пустой фабричный метод.
// В качестве возвращаемого типа укажите общий интерфейс продукта.
//
// Затем пройдитесь по коду класса и найдите все участки, создающие продукты.
// Поочерёдно замените эти участки вызовами фабричного метода, перенося в него
// код создания различных продуктов.
//
// В фабричный метод, возможно, придётся добавить несколько параметров,
// контролирующих, какой из продуктов нужно создать.
//
// На этом этапе фабричный метод, скорее всего, будет выглядеть удручающе.
// В нём будет жить большой условный оператор, выбирающий класс создаваемого
// продукта. Но не волнуйтесь, мы вот-вот исправим это.
//
// Для каждого типа продуктов заведите подкласс и переопределите в нём
// фабричный метод. Переместите туда код создания соответствующего продукта
// из суперкласса.
//
// Если создаваемых продуктов слишком много для существующих подклассов
// создателя, вы можете подумать о введении параметров в фабричный метод,
// которые позволят возвращать различные продукты в пределах одного подкласса.
//
//
