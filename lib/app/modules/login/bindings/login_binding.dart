import 'package:get/get.dart';
import 'package:pda/app/data/providers/local_store_provider.dart';
import 'package:pda/app/data/providers/sys_user_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SysUserProvider>(
      () => SysUserProvider(),
    );
    Get.lazyPut<LocalStoreProvider>(
      () => LocalStoreProvider(),
    );
  }
}
