import 'package:flutter_postman_application/src/events/method_event.dart';

class MethodFactory {
  static getMethod(MethodEvent method) {
    switch (method) {
      case MethodEvent.methodGet:
        break;
      case MethodEvent.methodPost:
        break;
      case MethodEvent.methodPut:
        break;
      case MethodEvent.methodDelete:
        break;
      default:
    }
  }
}
