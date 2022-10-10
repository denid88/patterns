/// Шаблонный метод — это поведенческий паттерн проектирования, который
/// определяет скелет алгоритма, перекладывая ответственность за некоторые его
/// шаги на подклассы. Паттерн позволяет подклассам переопределять шаги
/// алгоритма, не меняя его общей структуры.

abstract class Builder {
  void _addEngine();
  void _installChassis();
  void _addElectronic();
  void _collectAccessories();
  void build() {
    print('Build $runtimeType car');
    _addEngine();
    _installChassis();
    _addElectronic();
    _collectAccessories();
    print('_______________\n');
  }
}

class TeslaBuilder extends Builder {
  @override
  void _addEngine() {
    print('Add electronic engine');
  }

  @override
  void _addElectronic() {
    print('Add electric system with AI');
  }

  @override
  void _collectAccessories() {
    print('Install gadgets');
  }

  @override
  void _installChassis() {
    print('Add 15 inch wheels');
  }
}

class BMWBuilder extends Builder {
  @override
  void _addEngine() {
    print('Add fuel engine');
  }

  @override
  void _addElectronic() {
    print('Add electric system with cabel');
  }

  @override
  void _collectAccessories() {
    print('Install modern horn');
  }

  @override
  void _installChassis() {
    print('Add 16 inch wheels');
  }
}