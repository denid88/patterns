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
  }
}



