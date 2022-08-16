/// Adapter, Wrapper, Обертка
/// это структурный паттерн проектирования, который позволяет объектам с
/// несовместимыми интерфейсами работать вместе.

/// Это объект-переводчик, который трансформирует интерфейс или данные одного
/// объекта в такой вид, чтобы он стал понятен другому объекту.

const double fahrenheitZero = 32;
const double celsiousToFahreinheit = 9.0 / 5;
const double fahrenheitToCelsious = 5.0 / 9;

abstract class IOven {
  double getTemperature();
  void setTemperature(double t);
}

abstract class ICelsiousOven {
  double getCelsiousTemperature();
  void setCelsiousTemperature(double t);
  double getOriginalTemperature();
}

class OriginalOven implements IOven {
  late double temperature;

  OriginalOven(this.temperature) {
    assert(temperature >= fahrenheitZero, "This isn't a refrigerator");
  }

  @override
  double getTemperature() {
    return temperature;
  }

  @override
  void setTemperature(double t) {
    assert(temperature >= fahrenheitZero, 'Does the oven freeze?..');
    temperature = t;
  }
}

class OvenAdapter implements ICelsiousOven {
  late IOven originalOven;
  double temperature = 0;

  OvenAdapter(this.originalOven) {
    temperature = _initTemperature();
  }

  double _initTemperature() =>
    (fahrenheitToCelsious * (originalOven.getTemperature() - fahrenheitZero));

  @override
  double getCelsiousTemperature() => temperature;

  @override
  double getOriginalTemperature() => originalOven.getTemperature();

  @override
  void setCelsiousTemperature(double t) {
    assert(t >= 0, 'Oo');
    originalOven.setTemperature(celsiousToFahreinheit * t + fahrenheitZero);
    temperature = t;
  }
}

void printTemperature(ICelsiousOven oven) {
  print('Original temperature ${oven.getOriginalTemperature()} F');
  print('Celsious temperature ${oven.getCelsiousTemperature()} C');
}

/// one more simple example
abstract class IXMLHandler {
  String getXML();
}

abstract class IJSONHandler {
  String getJSON();
}

class XMLHandler implements IXMLHandler {
  @override
  String getXML() => 'xml string';
}

class AdapterJSONHandler implements IJSONHandler {
  late IXMLHandler iXMLHandler;

  AdapterJSONHandler(this.iXMLHandler);

  @override
  String getJSON() {
    return '{"json": ${iXMLHandler.getXML()}}';
  }
}