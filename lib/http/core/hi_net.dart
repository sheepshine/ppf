import 'package:flutter_application_1/http/request/base_request.dart';

class HiNet {
  HiNet._();
  static HiNet _instance;
  static HiNet getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequset requset) async {
    var resopnse = await send(requset);
    var result = resopnse['data'];
    print(result);
    return result;
  }

  Future<dynamic> send<T>(BaseRequset request) async {
    print('url:${request.url()}');
    print('method:${request.httpMethod()}');
    request.addHeader('token', "123");
    print('header:${request.header}');
    return Future.value({
      "statusCode": 200,
      "data": {"code": 0, "message": "success"}
    });
  }
}
