/// Итератор — это поведенческий паттерн проектирования, который даёт
/// возможность последовательно обходить элементы составных объектов,
/// не раскрывая их внутреннего представления.

class RainbowIterator implements Iterator {
  final _colors = ['Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Indigo', 'Violet'];
  var _index = 0;

  @override
  String get current => _colors[_index++];

  @override
  bool moveNext() => _index < _colors.length;
}

class PizzaIterator {
  var _index = 0;
  final List<String> pizzas;

  PizzaIterator({required this.pizzas});

  String next() => pizzas[_index++];

  bool hasNext() => _index < pizzas.length;
}