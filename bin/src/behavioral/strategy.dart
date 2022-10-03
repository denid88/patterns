/// Стратегія — це поведінковий патерн проектування, який визначає сімейство
/// схожих алгоритмів і розміщує кожен з них у власному класі. Після цього
/// алгоритми можна заміняти один на інший прямо під час виконання програми.

abstract class CoffeeStrategy {
  String announce(String roast);
}

class AmericanoStrategy implements CoffeeStrategy {
  @override
  String announce(String roast) => "an Americano with $roast beans";
}

class DripStrategy implements CoffeeStrategy {
  @override
  String announce(String roast) => "a drip coffee with $roast beans";
}

class MochaFrappuccinoStrategy implements CoffeeStrategy {
  @override
  String announce(String roast) => "a delicious mocha frappuccion with $roast beans";
}

class CoffeeDrinker {
  CoffeeStrategy preferredDrink;
  String name;
  CoffeeDrinker(this.name, this.preferredDrink);
}

///// One more example

class Filter {
  late FilterStrategy? filterStrategy;

  void applyFilter() {
    filterStrategy?.process();
  }
}

abstract class FilterStrategy {
  void process();
}

class SepiaFilter implements FilterStrategy {
  @override
  void process() {
    print('Apply Sepia filter to image');
  }
}

class BlackWhiteFilter implements FilterStrategy {
  @override
  void process() {
    print('Apply Black-white filter to image');
  }
}

class ExpositionFilter implements FilterStrategy {
  @override
  void process() {
    print('Apply exposition filter to image');
  }
}