enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequset {
  var pathParams;
  var useHttps = true;
  String authority() {
    return "api.devio.orig";
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = Map();
  BaseRequset add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = Map();
  BaseRequset addHeader(String k, Object v) {
    params[k] = v.toString();
    return this;
  }
}
