import 'package:get/get.dart';

import '../controllers/laneway_manager_controller.dart';

class LanewayManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanewayManagerController>(
      () => LanewayManagerController(),
    );
  }
}
