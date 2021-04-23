import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorkSpaceController extends GetxController {
  usingMethod(method, endPoint, body) {
    String formatEndPoint = endPoint.toString().split(':')[0] != 'http' ||
            endPoint.toString().split(':')[0] != 'https'
        ? 'http://' + endPoint
        : endPoint;
    var formatBody = convert.jsonDecode(body);
    switch (method.toString().toLowerCase()) {
      case 'get':
        methodGet(formatEndPoint);
        break;
      case 'post':
        methodPost(formatEndPoint, formatBody);
        break;
      case 'put':
        break;
      case 'delete':
        break;
    }
  }

  methodGet(endPoint) async {
    var response = await http.get(endPoint);
    print(response.body);
  }

  methodPost(endPoint, body) async {
    var response = await http.post(endPoint, body: body);
    print(response.body);
  }
}
