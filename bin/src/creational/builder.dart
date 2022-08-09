///  Строитель — это порождающий паттерн проектирования, который позволяет
///  создавать сложные объекты пошагово. Строитель даёт возможность
///  один и тот же код строительства для получения разных представлений объектов.

/// Проблема: Представьте сложный объект, требующий кропотливой пошаговой
/// инициализации множества полей и вложенных объектов. Код инициализации таких
/// объектов обычно спрятан внутри монструозного конструктора с десятком
/// параметров. Либо ещё хуже — распылён по всему клиентскому коду.

enum PizzaDoughDepth {thin, thick}
enum PizzaDoughType {wheat, corn, rye}
enum PizzaSauceType {pesto, whiteGarlic, barbeque, tomato}
enum PizzaTopLevelType {mozzarella, salami, bacon, mushrooms, shrimps}

class PizzaBase {
  final PizzaDoughDepth pizzaDoughDepth;
  final PizzaDoughType pizzaDoughType;

  const PizzaBase(this.pizzaDoughType, this.pizzaDoughDepth);

  @override
  String toString() {
    final depthStr = pizzaDoughDepth.toString().split('.')[1];
    final doughTypeStr = pizzaDoughType.toString().split('.')[1];
    return 'dough type: $doughTypeStr & $depthStr \n';
  }
}

class Pizza {
  String name;
  PizzaBase dough;
  PizzaSauceType sauce;
  int cookingTime;
  List<PizzaTopLevelType> topping;

  Pizza({
    this.name = 'Brick',
    this.dough = const PizzaBase(PizzaDoughType.wheat, PizzaDoughDepth.thin),
    this.sauce = PizzaSauceType.barbeque,
    this.cookingTime = 10,
    this.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella
    ]
  });

  @override
  String toString() {
    var infoStr = 'Pizza name: $name \n';
    infoStr += dough.toString();
    infoStr += 'sauce type: ${sauce.toString().split('.')[1]}';
    infoStr += 'topping: ';
    infoStr += topping.join(', ');
    infoStr += '\n';
    infoStr += 'cooking time: $cookingTime minutes';
    return infoStr;
  }
}

//Builder abstract class
abstract class Builder {
  void prepareDough();
  void addSauce();
  void addTopping();
  Pizza getPizza();
}

class MargaritaPizzaBuilder implements Builder {
  late Pizza _pizza;

  MargaritaPizzaBuilder() {
    _pizza = Pizza(name: 'Margarita', cookingTime: 15);
  }

  @override
  void addSauce() {
    _pizza.sauce = PizzaSauceType.tomato;
  }

  @override
  void addTopping() {
    _pizza.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.bacon,
      PizzaTopLevelType.mozzarella
    ];
  }

  @override
  Pizza getPizza() {
    return _pizza;
  }

  @override
  void prepareDough() {
    _pizza.dough = const PizzaBase(PizzaDoughType.wheat, PizzaDoughDepth.thick);
  }
}

class SalamiPizzaBuilder implements Builder {
  late Pizza _pizza;

  SalamiPizzaBuilder() {
    _pizza = Pizza(name: 'Salami', cookingTime: 10);
  }

  @override
  void addSauce() {
    _pizza.sauce = PizzaSauceType.barbeque;
  }

  @override
  void addTopping() {
    _pizza.topping = const <PizzaTopLevelType>[
      PizzaTopLevelType.salami,
      PizzaTopLevelType.mozzarella
    ];
  }

  @override
  Pizza getPizza() {
    return _pizza;
  }

  @override
  void prepareDough() {
    _pizza.dough = const PizzaBase(PizzaDoughType.rye, PizzaDoughDepth.thin);
  }
}

/// Director
class Director {
  Builder? _builder;

  Director([this._builder]);

  set builder(Builder builder) => _builder = builder;

  void makePizza() {
    assert(_builder != null, 'oO');
    _builder?.prepareDough();
    _builder?.addSauce();
    _builder?.addTopping();
  }
}

/// Example without Director
enum HouseType {brick, foamBlock, frame, wood, unknown}
enum HouseExterior {classic, minimal, shale, unknown}
enum HouseInterior {loft, modern, minimal, hiTech, unknown}

class HouseBuilder {
  int _size = 0;
  HouseType _houseType = HouseType.unknown;
  HouseInterior _houseInterior = HouseInterior.unknown;
  HouseExterior _houseExterior = HouseExterior.unknown;

  HouseType get houseType => _houseType;

  HouseInterior get houseInterior => _houseInterior;

  HouseExterior get houseExterior => _houseExterior;

  void setHouseType(HouseType houseType) => _houseType = houseType;

  void setHouseInterior(HouseInterior houseInterior) => _houseInterior = houseInterior;

  void setHouseExterior(HouseExterior houseExterior) => _houseExterior = houseExterior;

  HouseBuilder(this._size);

  House build() => House(this);

  static HouseBuilder get builder => HouseBuilder(0);
}

class House {
  late int size;
  late HouseType houseType;
  late HouseInterior houseInterior;
  late HouseExterior houseExterior;

  House(HouseBuilder builder) {
    size = builder._size;
    houseType = builder._houseType;
    houseExterior = builder._houseExterior;
    houseInterior = builder._houseInterior;
  }

  @override
  String toString() {
    var infoStr = 'House made from: $houseType size: $size\n';
    infoStr += 'with interior: ${houseInterior.toString().split('.')[1]}\n';
    infoStr += 'with exterior: ${houseExterior.toString().split('.')[1]}\n';
    return infoStr;
  }
}