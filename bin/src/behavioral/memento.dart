/// Снимок — это поведенческий паттерн проектирования, который позволяет
/// сохранять и восстанавливать прошлые состояния объектов, не раскрывая
/// подробностей их реализации.

class Creator {
  Memento save(String value) => Memento(value: value);
  String restore(Memento memento) => memento.value;
}

class Caretaker {
  final List<Memento> mementos;

  Caretaker(this.mementos);

  addMemento(Memento memento) {
    mementos.add(memento);
  }

  getMemento(index) => mementos[index];
}

class Memento {
  final String value;
  Memento({required this.value});
}