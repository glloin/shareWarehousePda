import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future info(String message) {
  return Get.dialog(AlertDialog(
    title: const Text("提示!"),
    content: Text(message),
  ));
}

Future alarm(String message) {
  return Get.dialog(AlertDialog(
    title: const Text("警告!"),
    content: Text(message),
  ));
}

Future<bool?> confirm1(String title, Widget content) {
  return Get.dialog(AlertDialog(
    title: Text(title),
    content: content,
    actions: [
      TextButton(
          onPressed: () => Get.back(result: false), child: const Text("取消")),
      TextButton(
          onPressed: () => Get.back(result: true), child: const Text("确定")),
    ],
  ));
}

Future<bool?> confirm(String message) {
  return Get.dialog(AlertDialog(
    title: const Text("提示!"),
    content: Text(message),
    actions: [
      TextButton(
          onPressed: () => Get.back(result: false), child: const Text("取消")),
      TextButton(
          onPressed: () => Get.back(result: true), child: const Text("确定")),
    ],
  ));
}

onError(err) {
  String msg = "";
  if (err != null) {
    msg = err.toString();
  } else {
    msg = "发生未知异常!";
  }
  return Get.dialog(AlertDialog(
    title: const Text(
      "出错了!",
      style: TextStyle(color: Colors.red),
    ),
    content: Text(
      msg,
      style: const TextStyle(color: Colors.red),
    ),
  ));
}
