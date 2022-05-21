import 'package:get/get.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';
import 'package:pda/app/data/providers/import_notify_provider.dart';

import 'package:pda/app/modules/systemSettings/controllers/auto_import_controller.dart';

import '../controllers/system_settings_controller.dart';

class SystemSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoImportController>(() => AutoImportController(),
        fenix: true);
    Get.lazyPut<SystemSettingsController>(() => SystemSettingsController(),
        fenix: true);
    Get.lazyPut<ImportBillProvider>(() => ImportBillProvider(), fenix: true);
    Get.lazyPut<ImportNotifyProvider>(() => ImportNotifyProvider(),
        fenix: true);
  }
}
