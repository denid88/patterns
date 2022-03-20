/// Abstract Factory
abstract class Chair {
  bool isHasLegs();
}

class VictorianChair implements Chair {
  @override
  bool isHasLegs() => true;
}

class ModernChair implements Chair {
  @override
  bool isHasLegs() => false;
}

abstract class FurnitureFactory {
  Chair createChair();
}

class VictorianFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return VictorianChair();
  }
}

class ModernFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return ModernChair();
  }
}