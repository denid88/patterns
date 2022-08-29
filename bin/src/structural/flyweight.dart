import 'package:equatable/equatable.dart';

/// Легковес — это структурный паттерн проектирования, который позволяет
/// вместить бóльшее количество объектов в отведённую оперативную память.
/// Легковес экономит память, разделяя общее состояние объектов между собой,
/// вместо хранения одинаковых данных в каждом объекте.

class PizzaOrderFlyWeight extends Equatable {
  final String pizzaSize;
  final int diameter;

  PizzaOrderFlyWeight(this.pizzaSize, this.diameter);

  PizzaOrderFlyWeight.fromOrder(PizzaOrderFlyWeight sharedState) :
      this(sharedState.pizzaSize, sharedState.diameter);

  @override
  String toString() {
    return '($pizzaSize, $diameter)';
  }

  @override
  List<Object?> get props => [pizzaSize, diameter];
}

class PizzaOrderContext {
  final String name;
  final PizzaOrderFlyWeight sharedState;

  PizzaOrderContext(this.name, this.sharedState);

  @override
  String toString() {
    return 'unique state: $name || shared state: $sharedState';
  }
}

class FlyWeightFactory {
  var flyweight = <PizzaOrderFlyWeight?>[];

  PizzaOrderFlyWeight getFlyWeight(PizzaOrderFlyWeight sharedState) {
    var state = flyweight.firstWhere((element) =>
      sharedState == element, orElse: () {return null;});

    if (state == null) {
      state = sharedState;
      flyweight.add(sharedState);
    }
    return state;
  }

  int get total => flyweight.length;
}

class PizzaOrderMaker {
  final FlyWeightFactory _flyWeightFactory;

  PizzaOrderMaker(this._flyWeightFactory);

  PizzaOrderContext makePizzaOrder(String uniqueState, PizzaOrderFlyWeight sharedState) {
    var flyWeight = _flyWeightFactory.getFlyWeight(sharedState);
    return PizzaOrderContext(uniqueState, flyWeight);
  }
}