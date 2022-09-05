/// Chain of Responsibility
/// Цепочка обязанностей — это поведенческий паттерн проектирования, который
/// позволяет передавать запросы последовательно по цепочке обработчиков.
/// Каждый последующий обработчик решает, может ли он обработать запрос сам и
/// стоит ли передавать запрос дальше по цепи.

enum OrderType { vegan, notVegan, binge, none }

class RequestOrder {
  final List<String> _description;
  final OrderType _orderType;

  RequestOrder(this._description, this._orderType);

  List<String> get description => _description;
  OrderType get orderType => _orderType;
}

abstract class Handler {
  final Handler? _successor;

  Handler([Handler? successor]) : _successor = successor;

  void handle(RequestOrder request) {
    var result = _checkRequest(request._orderType);
    if (!result && (_successor is Handler)) {
      _successor?.handle(request);
    }
  }

  bool _checkRequest(OrderType orderType);
}

class WaiterHandler extends Handler {
  WaiterHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(OrderType orderType) {
    var check = orderType != OrderType.none;
    if (check) {
      print('Waiter passes the order on');
    } else {
      print('Waiter rejects the customer\'s request');
    }
    return !check;
  }
}

class KitchenHandler extends Handler {
  KitchenHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(OrderType orderType) {
    var check = <OrderType>[OrderType.notVegan, OrderType.vegan].contains(orderType);
    if (check) {
      print('Chef has started to fulfill the order');
    } else {
      print('Chef rejects the customer\'s request');
    }
    return check;
  }
}

class BarmanHandler extends Handler {
  BarmanHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(OrderType orderType) {
    var check = orderType == OrderType.binge;
    if (check) {
      print('Barman pours the ordered drink');
    } else {
      print('Barman rejects the customer\'s request');
    }
    return check;
  }
}

void requestHandle(WaiterHandler waiter, RequestOrder requestOrder) {
  print('*' * 10 + 'Order processing' + '*' * 10);
  print('Client request: ${requestOrder.description}');
  waiter.handle(requestOrder);
}

