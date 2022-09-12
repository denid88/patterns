/// Посредник — это поведенческий паттерн проектирования, который позволяет
/// уменьшить связанность множества классов между собой, благодаря перемещению
/// этих связей в один класс-посредник.

/// Предположим, что у вас есть диалог создания профиля пользователя.
/// Он состоит из всевозможных элементов управления — текстовых полей,
/// чекбоксов, кнопок.

class Customer {
  final String name;
  final OfficialDealer dealerMediator;

  Customer({required this.name, required this.dealerMediator});

  String getName() => name;

  makeOrder(auto, info) {
    dealerMediator.orderAuto(this, auto, info);
  }
}

class OfficialDealer {
  final List<String> _customers;

  OfficialDealer(this._customers);

  orderAuto(Customer customer, String auto, String info) {
    final name = customer.getName();
    print('-----------------------');
    print('Order name: $name');
    print('Order auto: $auto');
    print('Additional info: $info');
    print('\n');
    addToCustomerList(name);
  }

  addToCustomerList(String name) {
    _customers.add(name);
  }

  getCustomerList() => _customers;
}

/// One more example

abstract class Stateful {
  late String state;
  String getState() => state;
  void setState(newState) => state = newState;
}

class Mediator {
  List<Stateful> _parties;
  Mediator(this._parties);
  void update(String state) {
    for (var party in _parties) {
      party.state = state;
    }
  }
}

class Attendee extends Stateful {
  String name;
  Attendee(this.name);
}
