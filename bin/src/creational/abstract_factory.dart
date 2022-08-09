/// Абстрактная фабрика — это порождающий паттерн проектирования, который
/// позволяет создавать семейства связанных объектов, не привязываясь к
/// конкретным классам создаваемых объектов.
///
/// В каких случаях применяем:
/// 1. Если разрабатываемая система не должна зависеть от того как компонуются
/// создаются и представляются входящие в нее обьекты
/// 2. Когда обьекты должны использоваться вместе
/// 3. Когда конфигурация системы должна производиться одним из состовляющих
/// ее обьектов
/// 4. Когда необходимо скрыть от пользователя реализацию а предоставить интерфейсы
/// для использования модуля или библиотеки

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
///Интерфейсы абстрактных продуктов
abstract class Chair {}
abstract class Table {}

class VictorianChair implements Chair {}
class ModernChair implements Chair {}

class VictorianTable implements Table {}
class ModernTable implements Table {}

///_______________________________________________________________///

///One more example realisation
abstract class StatusBar {
  String system;
  StatusBar(this.system);
}
abstract class AlertDialog {
  String system;
  AlertDialog(this.system);
}

class WindowsStatusBar extends StatusBar {
  WindowsStatusBar() : super('Windows');
}
class OSXStatusBar extends StatusBar {
  OSXStatusBar() : super('OSX');
}
class LinuxStatusBar extends StatusBar {
  LinuxStatusBar() : super('Linux');
}

class WindowsAlertDialog extends AlertDialog {
  WindowsAlertDialog() : super('Windows');
}

class OSXAlertDialog extends AlertDialog {
  OSXAlertDialog() : super('OSX');
}

class LinuxAlertDialog extends AlertDialog {
  LinuxAlertDialog() : super('Linux');
}

class WindowsGuiFactory implements GuiAbstractFactory {
  @override
  AlertDialog getAlertDialog() => WindowsAlertDialog();

  @override
  StatusBar getStatusBar() => WindowsStatusBar();
}

class OSXGuiFactory implements GuiAbstractFactory {
  @override
  AlertDialog getAlertDialog() => OSXAlertDialog();

  @override
  StatusBar getStatusBar() => OSXStatusBar();
}

class LinuxGuiFactory implements GuiAbstractFactory {
  @override
  AlertDialog getAlertDialog() => LinuxAlertDialog();

  @override
  StatusBar getStatusBar() => LinuxStatusBar();
}

enum TypeOS {windows, osx, linux}

abstract class GuiAbstractFactory {
  factory GuiAbstractFactory (TypeOS typeOS) {
    switch(typeOS) {
      case TypeOS.windows:
        return WindowsGuiFactory();
      case TypeOS.osx:
        return OSXGuiFactory();
      case TypeOS.linux:
        return LinuxGuiFactory();
      default:
        throw ArgumentError();
    }
  }

  StatusBar getStatusBar();
  AlertDialog getAlertDialog();
}

class Application {
  final GuiAbstractFactory guiAbstractFactory;

  Application(this.guiAbstractFactory);

  void createGui() {
    final statusBar = guiAbstractFactory.getStatusBar();
    final alertDialog = guiAbstractFactory.getAlertDialog();
    print(statusBar);
    print(alertDialog);
  }
}