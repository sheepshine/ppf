import 'package:flutter_application_1/http/request/base_request.dart';

class TestRequest extends BaseRequset {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "uapi/test/test";
  }
}
