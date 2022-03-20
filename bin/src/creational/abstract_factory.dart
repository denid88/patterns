/// Абстрактная фабрика — это порождающий паттерн проектирования, который
/// позволяет создавать семейства связанных объектов, не привязываясь к
/// конкретным классам создаваемых объектов.

abstract class Chair {}

class VictorianChair implements Chair {}
class ModernChair implements Chair {}

abstract class Table {}

class VictorianTable implements Table {}
class ModernTable implements Table {}

abstract class FurnitureFactory {
  Chair createChair();
  Table createTable();
}

class VictorianFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return VictorianChair();
  }

  @override
  Table createTable() {
    return VictorianTable();
  }
}

class ModernFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return ModernChair();
  }

  @override
  Table createTable() {
    return ModernTable();
  }
}