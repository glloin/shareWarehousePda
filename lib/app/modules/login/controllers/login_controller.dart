import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/data/providers/local_store_provider.dart';
import 'package:pda/app/data/providers/sys_user_provider.dart';
import 'package:pda/app/global/global_controller.dart';
import 'package:pda/app/global/message.dart';
import 'package:pda/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  final id = "".obs;
  final pwd = "".obs;

  void idSaved(String? id) {
    this.id.value = id!;
  }

  void pwdSaved(String? pwd) {
    this.pwd.value = pwd!;
  }

  String? idValidator(String? t) {
    if (t == null || t.isEmpty) {
      return '用户 id 不能为空';
    }
    return null;
  }

  String? pwdValidator(String? t) {
    if (t == null || t.isEmpty) {
      return '用户密码不能为空';
    }
    return null;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isBusy.value = true;
      try {
        formKey.currentState!.save();
        final password =
            md5.convert(const Utf8Encoder().convert(pwd.value)).toString();
        final user =
            await Get.find<SysUserProvider>().login(id.value, password);
        Get.find<LocalStoreProvider>().setUserInfo(user);
        final g = Get.find<GlobalController>();
        g.user.value = user;
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        String message = e.toString();
        Get.dialog(AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("确定"),
            ),
          ],
        ));
      } finally {
        isBusy.value = false;
      }
    }
  }

  final formKey = GlobalKey<FormState>();
  var isBusy = false.obs;

  void onUpdate() async {
    final uri = Uri.parse("${BaseConnectProvider.serviceUrl}/pda.apk");
    await canLaunchUrl(uri) ? await launchUrl(uri) : await alarm("找不到程序安装包");
  }
}
