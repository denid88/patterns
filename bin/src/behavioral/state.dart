/// State
/// Состояние — это поведенческий паттерн проектирования, который позволяет
/// объектам менять поведение в зависимости от своего состояния. Извне создаётся
/// впечатление, что изменился класс объекта.

class OrderStatus {
  final String name;
  final OrderStatus? nextStatus;

  OrderStatus({required this.name, required this.nextStatus});

  next() {
    return nextStatus;
  }
}

class WaitingForPayment extends OrderStatus {
  WaitingForPayment() : super(name: 'waiting for payment', nextStatus: Shipping());
}

class Shipping extends OrderStatus {
  Shipping() : super(name: 'shipping', nextStatus: Delivered());
}

class Delivered extends OrderStatus {
  Delivered() : super(name: 'delivered', nextStatus: null);
}

class Order {
  OrderStatus state;

  Order({required this.state});

  nextState() {
    state = state.next();
  }
}

/// One more example
abstract class State {
  void handler(Stateful context);
  @override
  String toString();
}

class StatusOn implements State {
  @override
  handler(Stateful context) {
    print('  Handler of StatusOn is being called!');
    context.setState = StatusOff();
  }

  @override String toString() {
    return 'on';
  }
}

class StatusOff implements State {
  @override
  handler(Stateful context) {
    print('  Handler of StatusOff is being called!');
    context.setState = StatusOn();
  }

  @override String toString() {
    return 'off';
  }
}

class Stateful {
  State state;

  Stateful({required this.state});

  State get getState => state;
  set setState(State newState) => state = newState;

  void touch() {
    print('  Touching the Stateful...');
    state.handler(this);
  }
}