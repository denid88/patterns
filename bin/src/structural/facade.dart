/// Фасад — это структурный паттерн проектирования, который предоставляет
/// простой интерфейс к сложной системе классов, библиотеке или фреймворку.

enum MenuType {vegan, notVegan, mixed}

abstract class IMenu {
  String getMenuName();
}

class VeganMenu implements IMenu {
  @override
  String getMenuName() => 'Vegan menu';
}

class NotVeganMenu implements IMenu {
  @override
  String getMenuName() => 'Not vegan menu';
}

class MixedMenu implements IMenu {
  @override
  String getMenuName() => 'Mixed menu';
}

abstract class IClient {
  void requestMenu(IMenu menu);
  Map<int, String> formOrder();
  void eatingFood();
  String getName();
}

class Kitchen {
  void preparedFood() {
    print('The ordered food is being prepared');
  }

  void callWaiter() {
    print('Food at the waiter');
  }
}

class Waiter {
  void takeOrder(IClient client) {
    print('Waiter accepted the order from ${client.getName()}');
  }
  void serveClient(IClient client) {
    print('Dishes are ready, we bring them to the client with name ${client.getName()}');
  }
}

class Client implements IClient {
  final String name;

  Client(this.name);

  @override
  void eatingFood() {
    print('Client $name starting to eat');
  }

  @override
  Map<int, String> formOrder() {
    print('Client $name makes an order');
    return <int, String>{1: 'Something'};
  }

  @override
  String getName() => name;

  @override
  void requestMenu(IMenu menu) {
    print('Client $name familiarizes with ${menu.getMenuName()}');
  }
}

///FACADE///

class PizzeriaFacade {
  late Kitchen _kitchen;
  late Waiter _waiter;
  late Map<MenuType, IMenu> _menu;

  PizzeriaFacade() {
    _kitchen = Kitchen();
    _waiter = Waiter();
    _menu = <MenuType, IMenu> {
      MenuType.vegan: VeganMenu(),
      MenuType.notVegan: NotVeganMenu(),
      MenuType.mixed: MixedMenu()
    };
  }

  IMenu getMenu(MenuType type) {
    return _menu[type]!;
  }

  void takeOrder(IClient client) {
    _waiter.takeOrder(client);
    _kitchenWork();
    _waiter.serveClient(client);
  }

  void _kitchenWork() {
    _kitchen.preparedFood();
    _kitchen.callWaiter();
  }
}