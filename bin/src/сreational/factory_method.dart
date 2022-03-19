///Factory method
abstract class Transport {}

class Truck implements Transport {}
class Ship implements Transport {}

abstract class Logistic {
  Transport createTransport();
}

class RoadLogistic implements Logistic {
  @override
  Transport createTransport() {
    print('Instance Truck was created');
    return Truck();
  }
}

class SeaLogistic implements Logistic {
  @override
  Transport createTransport() {
    print('Instance Ship was created');
    return Ship();
  }
}
