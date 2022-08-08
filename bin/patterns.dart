import 'src/creational/abstract_factory.dart';
import 'src/creational/factory_method.dart';

void main(List<String> arguments) {
  /// Creational
  /// Factory Method
  // final Logistic roadLogistic = RoadLogistic();
  // final Logistic seaLogistic = SeaLogistic();
  // roadLogistic.createTransport();
  // seaLogistic.createTransport();
  // final coffee = CoffeeFactory.createCoffeeProduct(CoffeeProductType.coffee);
  // final cacao = CoffeeFactory.createCoffeeProduct(CoffeeProductType.cacao);
  final webDialog = WebDialog();
  webDialog.createButton();
  final windowsDialog = WindowsDialog();
  windowsDialog.createButton();

  /// Abstract Factory
  // final victorianFurnitureFactory = VictorianFurnitureFactory();
  // print(victorianFurnitureFactory.createChair());
  // print(victorianFurnitureFactory.createTable());
}
