import 'src/creational/abstract_factory.dart';
import 'src/creational/builder.dart';
import 'src/creational/factory_method.dart';

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
  var houseBuilder = HouseBuilder(100);
  houseBuilder
    ..setHouseExterior(HouseExterior.minimal)
    ..setHouseInterior(HouseInterior.loft)
    ..setHouseType(HouseType.wood);

  var woodHouseWithLoftAndMinimal = House(houseBuilder);
  print(woodHouseWithLoftAndMinimal);
  
  var brickHouseWithShaleAndHiTech = (houseBuilder
    ..setHouseType(HouseType.brick)
    ..setHouseInterior(HouseInterior.hiTech)
    ..setHouseExterior(HouseExterior.shale)  
  ).build();
  print(brickHouseWithShaleAndHiTech);
}
