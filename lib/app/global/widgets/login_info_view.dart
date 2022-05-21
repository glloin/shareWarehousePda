import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/data/providers/local_store_provider.dart';
import 'package:pda/app/routes/app_pages.dart';

import '../global_controller.dart';

class LoginInfoView extends StatelessWidget {
  const LoginInfoView({Key? key}) : super(key: key);

  void toLogin() {
    LocalStoreProvider().clearUserInfo();
    Get.find<GlobalController>().user.value = null;
    Get.offAllNamed(Routes.LOGIN);
  }

  Widget getIcon(String? url) {
    if (url == null) {
      return const Icon(
        Icons.supervised_user_circle_outlined,
      );
    } else {
      return Image.network(
        BaseConnectProvider.serviceUrl + url,
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
        errorBuilder: (context, exception, stackTrace) {
          return const Icon(
            Icons.verified_user_outlined,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (_) {
        return Obx(() {
          if (_.user.value != null) {
            return GestureDetector(
              onTap: () {
                Get.dialog(AlertDialog(
                  title: const Text("提示!"),
                  content: const Text("您确定要注销登录吗?"),
                  actions: [
                    TextButton(
                      onPressed: toLogin,
                      child: const Text("确定"),
                    ),
                    TextButton(
                      onPressed: Get.back,
                      child: const Text("取消"),
                    ),
                  ],
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: getIcon(_.user.value?.avatar),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _.user.value!.code!,
                          style: const TextStyle(fontSize: 8),
                        ),
                        Text(
                          _.user.value!.name!,
                          style: const TextStyle(fontSize: 9),
                        ),
                        Text(
                          _.user.value!.groupName!,
                          style: const TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return TextButton(onPressed: () {}, child: const Text("登录"));
          }
        });
      },
    );
  }
}
