// import 'src/creational/abstract_factory.dart';
// import 'src/creational/builder.dart';
// import 'src/creational/factory_method.dart';
// import 'src/creational/prototype.dart';
// import 'src/creational/singleton.dart';
// import 'src/structural/adapter.dart';
// import 'src/structural/bridge.dart';
import 'dart:math';

import 'src/structural/composite.dart';

void main(List<String> arguments) {
  /// Creational
  /// Factory Method
  // final Logistic roadLogistic = RoadLogistic();
  // final Logistic seaLogistic = SeaLogistic();
  // roadLogistic.createTransport();
  // seaLogistic.createTransport();
  // for (var value in CoffeeProductType.values) {
  //   final coffeeProduct = CoffeeFactory.createCoffeeProduct(value);
  //   print(coffeeProduct);
  // }
  // for (var value in PizzaType.values) {
  //   var pizza = Pizza(value);
  //   print(pizza);
  // }
  // final webDialog = WebDialog();
  // webDialog.createButton();
  // final windowsDialog = WindowsDialog();
  // windowsDialog.createButton();

  /// Abstract Factory
  // final victorianFurnitureFactory = VictorianFurnitureFactory();
  // print(victorianFurnitureFactory.createChair());
  // print(victorianFurnitureFactory.createTable());
  // final typeOS = TypeOS.linux;
  // final app = Application(GuiAbstractFactory(typeOS));
  // app.createGui();

  /// Builder with Director
  // final Director director = Director();
  // for (var it in <Builder>[MargaritaPizzaBuilder(), SalamiPizzaBuilder()]) {
  //   director.builder = it;
  //   director.makePizza();
  //   print(it.getPizza());
  //   print('---' * 20);
  // }
  /// Builder without Director
  // var houseBuilder = HouseBuilder(100);
  // houseBuilder
  //   ..setHouseExterior(HouseExterior.minimal)
  //   ..setHouseInterior(HouseInterior.loft)
  //   ..setHouseType(HouseType.wood);
  //
  // var woodHouseWithLoftAndMinimal = House(houseBuilder);
  // print(woodHouseWithLoftAndMinimal);
  //
  // var brickHouseWithShaleAndHiTech = (houseBuilder
  //   ..setHouseType(HouseType.brick)
  //   ..setHouseInterior(HouseInterior.hiTech)
  //   ..setHouseExterior(HouseExterior.shale)
  // ).build();
  // print(brickHouseWithShaleAndHiTech);
  // /// Prototype
  // var margarita = Pizza(
  //   name: 'Margarita',
  //   topping: <PizzaTopLevelType>[
  //     PizzaTopLevelType.bacon,
  //     PizzaTopLevelType.mozzarella
  //   ],
  // );
  // print(margarita);
  // print('----------------------------');
  // final margaritaWithMushrooms = margarita.clone();
  // margaritaWithMushrooms.topping.add(PizzaTopLevelType.mushrooms);
  // print(margaritaWithMushrooms);
  /// Singleton
  // final singleton = Singleton.instance;
  // final singleton1 = Singleton.instance;
  //
  // print(singleton.hashCode);
  // print(singleton1.hashCode);
  // print(identical(singleton, singleton1));
  /// Adapter
  // var fahrenheitOven = OriginalOven(32);
  // var celsiousOven = OvenAdapter(fahrenheitOven);
  // printTemperature(celsiousOven);
  // celsiousOven.setCelsiousTemperature(180);
  // printTemperature(celsiousOven);
  //
  // final xmlHandler = XMLHandler();
  // final jsonHandler = AdapterJSONHandler(xmlHandler);
  //
  // print(jsonHandler.getJSON());
  /// Bridge
  // var firstPizza = Pizza('Margarita', 10, 220);
  // var secondPizza = Pizza('Salami', 9, 180);
  //
  // var implementor = ClassicOvenImplementor(10);
  // var oven = Oven(implementor);
  //
  // print('Implementor type: ${oven.getImplementorType()}');
  // oven.cookingPizza(firstPizza);
  // oven.cookingPizza(secondPizza);
  // // change new implementation
  //
  // var newImplementor = ElectricalOvenImplementor(oven.getTemperature());
  // firstPizza = Pizza('Margarita', 9, 225);
  // secondPizza = Pizza('Salami', 10, 175);
  // oven.changeImplementor(newImplementor);
  //
  // print('Implementor type: ${oven.getImplementorType()}');
  // oven.cookingPizza(firstPizza);
  // oven.cookingPizza(secondPizza);
  // var roaster = CoffeeRoaster();
  // for (var i=0; i < 3; i++) {
  //   roaster.turnGasValve();
  //   if (roaster.isTooHot) { roaster.loudspeaker = LoudspeakerWithAlarm(); }
  // }
  /// Composite
  var dough = CompoundProduct('Dough');
  dough.addProduct(Product('flour', 3));
  dough.addProduct(Product('egg', 23));
  dough.addProduct(Product('salt', 1));
  dough.addProduct(Product('sugar', 2));
  var sauce = Product('Barbeque', 12);
  var topping = CompoundProduct('Topping');
  topping.addProduct(Product('dorblue', 14));
  topping.addProduct(Product('parmesan', 12));
  topping.addProduct(Product('mozzarella', 94));
  topping.addProduct(Product('maasdam', 77));
  var pizza = Pizza('4 Cheese');
  pizza.addProduct(dough);
  pizza.addProduct(sauce);
  pizza.addProduct(topping);
  pizza.cost();
}
