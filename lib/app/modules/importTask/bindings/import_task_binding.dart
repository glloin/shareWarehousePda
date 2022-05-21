import 'package:get/get.dart';

import '../controllers/import_task_controller.dart';

class ImportTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportTaskController>(() => ImportTaskController(),
        fenix: true);
  }
}
