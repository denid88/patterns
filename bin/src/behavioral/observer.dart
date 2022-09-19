/// Наблюдатель — это поведенческий паттерн проектирования, который создаёт
/// механизм подписки, позволяющий одним объектам следить и реагировать на
/// события, происходящие в других объектах.

/// Давайте называть Издателями те объекты, которые содержат важное или
/// интересное для других состояние. Остальные объекты, которые хотят
/// отслеживать изменения этого состояния, назовём Подписчиками.

/// У обсервера в контракте должны быть заложены массив subscribers, методы
/// подписики и отписки register, unregister и метод notify с помощью которого
/// шлются уведомления

abstract class AutoNewsChannel {
  void inform(String message) {
    print('$runtimeType: $message');
  }
}

class AudiNewsChannel extends AutoNewsChannel {}
class BMWNewsChannel extends AutoNewsChannel {}

class AutoNews {
  String _news = '';
  final List<AutoNewsChannel> _subscribers = [];

  setNews(String text) {
    _news = text;
    _notifyAll();
  }

  void _notifyAll() {
    _subscribers.forEach((subscriber) {
      subscriber.inform(_news);
    });
  }

  void register(AutoNewsChannel subscriber) {
    _subscribers.add(subscriber);
  }

  void unregister(AutoNewsChannel subscriber) {
    _subscribers.remove(subscriber);
  }
}
