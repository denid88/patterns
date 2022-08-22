/// Composite - Компоновщик
/// это структурный паттерн проектирования, который позволяет сгруппировать
/// множество объектов в древовидную структуру, а затем работать с ней так,
/// как будто это единичный объект.

abstract class IProduct {
  int cost();
  String name();
}

class Product implements IProduct {
  final String _name;
  final int _cost;

  Product(this._name, this._cost);

  @override
  int cost() => _cost;

  @override
  String name() => _name;
}

class CompoundProduct implements IProduct {
  final String _name;
  var productList = <IProduct>[];

  CompoundProduct(this._name);

  @override
  int cost() {
    var costProducts = 0;
    productList.forEach((it) {
      costProducts += it.cost();
    });
    return costProducts;
  }

  @override
  String name() => _name;

  void addProduct(IProduct product) {
    productList.add(product);
  }

  void removeProduct(IProduct product) {
    productList.remove(product);
  }
}

class Pizza extends CompoundProduct {
  Pizza(String name) : super(name);

  int cost() {
    var costProducts = 0;
    productList.forEach((it) {
      var currentCost = it.cost();
      print('Cost ${it.name()} = $currentCost parrots');
      costProducts += it.cost();
    });
    print('Cost ${name()} =  $costProducts parrots');
    return costProducts;
  }
}