// import 'src/creational/abstract_factory.dart';
// import 'src/creational/builder.dart';
// import 'src/creational/factory_method.dart';
// import 'src/creational/prototype.dart';
// import 'src/creational/singleton.dart';
// import 'src/structural/adapter.dart';
// import 'src/structural/bridge.dart';

//import 'src/structural/facade.dart';
//import 'src/structural/composite.dart';
//import 'src/structural/decorator.dart';

// import 'src/structural/flyweight.dart';
// import 'src/behavioral/command.dart';
// import 'src/behavioral/cor.dart';
// import 'src/structural/proxy.dart';

import 'src/behavioral/iterator.dart';
import 'src/behavioral/mediator.dart';

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
  // var dough = CompoundProduct('Dough');
  // dough.addProduct(Product('flour', 3));
  // dough.addProduct(Product('egg', 23));
  // dough.addProduct(Product('salt', 1));
  // dough.addProduct(Product('sugar', 2));
  // var sauce = Product('Barbeque', 12);
  // var topping = CompoundProduct('Topping');
  // topping.addProduct(Product('dorblue', 14));
  // topping.addProduct(Product('parmesan', 12));
  // topping.addProduct(Product('mozzarella', 94));
  // topping.addProduct(Product('maasdam', 77));
  // var pizza = Pizza('4 Cheese');
  // pizza.addProduct(dough);
  // pizza.addProduct(sauce);
  // pizza.addProduct(topping);
  // pizza.cost();
  /// Decorator
  // var pizzaBase = PizzaBase(3);
  // print('Cтоимость основы пиццы = ${pizzaBase.cost()}');
  // var margarita = PizzaMargarita(10, pizzaBase);
  // var salami = PizzaSalami(7, pizzaBase);
  //
  // printPizzaInfo(margarita);
  // printPizzaInfo(salami);
  /// Facade
  // var pizzeria = PizzeriaFacade();
  // var client1 = Client('Alex');
  // var client2 = Client('Ivan');
  // client1.requestMenu(pizzeria.getMenu(MenuType.mixed));
  // pizzeria.takeOrder(client1);
  // client2.requestMenu(pizzeria.getMenu(MenuType.vegan));
  // pizzeria.takeOrder(client2);
  // client1.eatingFood();
  // client2.eatingFood();
  /// FlyWeight
  // var flyweightFactory = FlyWeightFactory();
  // var pizzaMaker = PizzaOrderMaker(flyweightFactory);
  // var sharedState = <PizzaOrderFlyWeight>[
  //   PizzaOrderFlyWeight('Big Pizza', 30),
  //   PizzaOrderFlyWeight('Medium Pizza', 20),
  //   PizzaOrderFlyWeight('Small Pizza', 10),
  // ];
  //
  // var uniqueStates = <String>['Margarita', 'Salami', '4 Cheese'];
  //
  // var orders = [
  //   for (var name in uniqueStates)
  //     for (var shState in sharedState) pizzaMaker.makePizzaOrder(name, shState)
  // ];
  //
  // print('Number of pizzas: ${orders.length}');
  // print('Number of sharedState: ${flyweightFactory.total}');
  //
  // orders.asMap().forEach((key, value) {
  //   print('-' * 20);
  //   print('Pizza number is the list $key');
  //   print(value);
  // });
  /// Proxy
  // var flyweightFactory = FlyWeightFactory();
  // var pizzaMaker = PizzaOrderMaker(flyweightFactory);
  // var pizzaMakerProxy = ProxyOrderMaker(pizzaMaker);
  // var sharedState = <PizzaOrderFlyWeight>[
  //   PizzaOrderFlyWeight('Big Pizza', 30),
  //   PizzaOrderFlyWeight('Medium Pizza', 20),
  //   PizzaOrderFlyWeight('Small Pizza', 10),
  // ];
  //
  // var uniqueStates = <String>['Margarita', 'Salami', '4 Cheese'];
  //
  // var orders = [
  //   for (var name in uniqueStates)
  //     for (var shState in sharedState) pizzaMakerProxy.makePizzaOrder(name, shState)
  // ];
  //
  // print('Number of pizzas: ${orders.length}');
  // print('Number of sharedState: ${flyweightFactory.total}');
  /// Chain of Responsibility
  // var kitchen = KitchenHandler();
  // var bar = BarmanHandler(kitchen);
  // var waiter = WaiterHandler(bar);
  //
  // var requestList = <String>['Borsch', 'Naval macaroshki'];
  // var requestOrder = RequestOrder(requestList, OrderType.notVegan);
  // requestHandle(waiter, requestOrder);
  //
  // requestList = <String>['Blood Merry', 'Cognac', 'Whiskey'];
  // requestOrder = RequestOrder(requestList, OrderType.binge);
  // requestHandle(waiter, requestOrder);
  //
  // requestList = <String>['The world on a sliver platter!'];
  // requestOrder = RequestOrder(requestList, OrderType.none);
  // requestHandle(waiter, requestOrder);
  /// Command
  // final chief = Chief();
  // final assistant = ChiefAssistant();
  // final oven = Oven();
  // final pizzeria = Pizzeria();
  // pizzeria.addCommand(PrepareDoughCommand(assistant));
  // pizzeria.addCommand(MakePizzaBaseCommand(chief));
  // pizzeria.addCommand(PrepareSauceCommand(assistant));
  // pizzeria.addCommand(AppliedSauceCommand(chief));
  // pizzeria.addCommand(PrepareOvenCommand(oven));
  // pizzeria.addCommand(PrepareToppingCommand(assistant));
  // pizzeria.addCommand(AddToppingCommand(chief));
  // pizzeria.addCommand(CookingPizzaCommand(oven));
  // pizzeria.addCommand(BonAppetitCommand(chief));
  // pizzeria.cooking();

  //////////////////////////////////////////////////////////////////////////////
  // var myFavoriteLamp = Light();
  // var iotLightSwitch = LightSwitch(myFavoriteLamp);
  //
  // iotLightSwitch.perform("on");
  // iotLightSwitch.perform("off");
  // iotLightSwitch.perform("blink");
  // iotLightSwitch.perform("on");
  //
  // print("\r\n*** Fancy IoT Switch Logs ***\r\n${iotLightSwitch.history}");
  /// Iterator
  // var rainbowColors = RainbowIterator();
  // while(rainbowColors.moveNext()) {
  //   print(rainbowColors.current);
  // }
  //
  // print('-------------------------------------------------------------------');
  //
  // final pizzasMenus = PizzaIterator(pizzas: ['Margarita', 'Italy', 'Cheeses']);
  // while (pizzasMenus.hasNext()) {
  //   print(pizzasMenus.next());
  // }
  /// Mediator
  // final mediator = OfficialDealer([]);
  // final yauhen = Customer(name: 'Yauhen', dealerMediator: mediator);
  // final valera = Customer(name: 'Valera', dealerMediator: mediator);
  //
  // yauhen.makeOrder('Tesla', 'With autopilot');
  // valera.makeOrder('Audio', 'Parktronic');
  //
  // mediator.getCustomerList();

  // var curly = Attendee("Curly");
  // var larry = Attendee("Larry");
  // var my = Attendee("I prefer not to disclose my name");
  // var mixer = List<Attendee>.from([curly, larry, my]);
  // var publicAnnouncementSystem = Mediator(mixer);
  //
  // publicAnnouncementSystem.update("Do NOT eat the shrip tacos!");
  //
  // for (var person in mixer) {
  //   print("${person.name} heard \"${person.state}\".");
  // }
}
