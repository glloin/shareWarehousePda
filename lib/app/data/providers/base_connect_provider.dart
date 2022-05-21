import 'dart:convert';

import 'package:get/get.dart';
import 'package:pda/app/global/global_controller.dart';

class BaseConnectProvider extends GetConnect {
  static const String serviceUrl = "http://192.168.65.154:5000";
  @override
  void onInit() {
    httpClient.baseUrl = serviceUrl;
    httpClient.timeout = const Duration(seconds: 5);
    final g = Get.find<GlobalController>();
    httpClient.addAuthenticator((request) {
      if (g.user.value != null) {
        request.headers['Authorization'] = "Bearer ${g.user.value?.token}";
      }
      return request as dynamic;
    });
    super.onInit();
  }

  dynamic getResponseData(Response<dynamic> res) {
    if (res.statusCode == 200 && res.bodyString != null) {
      return jsonDecode(res.bodyString!);
    } else {
      if (res.statusCode == 599) {
        throw "${res.bodyString}";
      } else {
        throw "接口调用异常${res.statusCode}!";
      }
    }
  }
}
