// import 'src/creational/abstract_factory.dart';
// import 'src/creational/builder.dart';
// import 'src/creational/factory_method.dart';
// import 'src/creational/prototype.dart';
// import 'src/creational/singleton.dart';

import 'src/structural/adapter.dart';

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
  var fahrenheitOven = OriginalOven(32);
  var celsiousOven = OvenAdapter(fahrenheitOven);
  printTemperature(celsiousOven);
  celsiousOven.setCelsiousTemperature(180);
  printTemperature(celsiousOven);

  final xmlHandler = XMLHandler();
  final jsonHandler = AdapterJSONHandler(xmlHandler);

  print(jsonHandler.getJSON());
}
