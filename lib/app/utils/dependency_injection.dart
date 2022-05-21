import 'package:get/get.dart';
import 'package:pda/app/global/global_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put(GlobalController());
  }
}
