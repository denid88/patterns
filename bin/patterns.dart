import 'src/сreational/factory_method.dart';

void main(List<String> arguments) {
  final Logistic roadLogistic = RoadLogistic();
  final Logistic seaLogistic = SeaLogistic();
  roadLogistic.createTransport();
  seaLogistic.createTransport();
}
