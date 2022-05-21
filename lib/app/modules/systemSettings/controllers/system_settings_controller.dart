import 'package:get/get.dart';
import 'package:pda/app/data/hubs/global_hub.dart';

class SystemSettingsController extends GetxController {
  final hub = GlobalHub();
  @override
  void onClose() {
    hub.hub.stop();
    super.onClose();
  }
}
