/// Посетитель — это поведенческий паттерн проектирования, который позволяет
/// добавлять в программу новые операции, не изменяя классы объектов, над
/// которыми эти операции могут выполняться.

class Visitor {
  visit(Car car) {
    switch(car.runtimeType.toString()) {
      case 'Tesla':
        car.info();
      break;
      case 'Audi':
        car.info();
      break;
      case 'BMW':
        car.info();
      break;
    }
  }
}

abstract class Car {
  void info();

  accept(Visitor visitor) {
    visitor.visit(this);
  }
}

class Tesla implements Car {
  @override
  info() {
    print('Tesla car');
  }

  @override
  accept(Visitor visitor) {
    visitor.visit(this);
  }
}

class BMW implements Car {
  @override
  info() {
    print('BMW car');
  }

  @override
  accept(Visitor visitor) {
    visitor.visit(this);
  }
}

class Audi implements Car{
  @override
  info() {
    print('Audi car');
  }
  @override
  accept(Visitor visitor) {
    visitor.visit(this);
  }
}