import 'package:get/get.dart';

import '../controllers/quality_manager_controller.dart';

class QualityManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QualityManagerController>(
      () => QualityManagerController(),
    );
  }
}
