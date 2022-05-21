import 'package:get/get.dart';
import 'package:pda/app/data/providers/local_store_provider.dart';
import 'package:pda/app/data/providers/sys_user_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LocalStoreProvider>(
      () => LocalStoreProvider(),
    );
    Get.lazyPut<SysUserProvider>(
      () => SysUserProvider(),
    );
  }
}
