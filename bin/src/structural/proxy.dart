import 'package:equatable/equatable.dart';

/// Proxy (Заместитель)
/// Заместитель — это структурный паттерн проектирования, который позволяет
/// подставлять вместо реальных объектов специальные объекты-заменители.
/// Эти объекты перехватывают вызовы к оригинальному объекту, позволяя сделать
/// что-то до или после передачи вызова оригиналу.


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

/// Proxy ///
abstract class IOrder {
  PizzaOrderContext makePizzaOrder(
    String uniqueState, PizzaOrderFlyWeight sharedState
  );
}

class ProxyOrderMaker implements IOrder {
  final PizzaOrderMaker _subject;

  ProxyOrderMaker(this._subject);

  @override
  PizzaOrderContext makePizzaOrder(String uniqueState, PizzaOrderFlyWeight sharedState) {
    _logging(uniqueState, sharedState);
    return _subject.makePizzaOrder(uniqueState, sharedState);
  }
}

void _logging(String uS, PizzaOrderFlyWeight sS) {
  print('unique State: $uS || sharedState: $sS');
}