import 'package:get/get.dart';
import 'package:pda/app/data/hubs/laneway_hub.dart';

class LanewayManagerController extends GetxController {
  late final LanewayHub hub;
  @override
  void onInit() {
    hub = LanewayHub();
    super.onInit();
  }

  @override
  void onClose() {
    hub.hub.stop();
    super.onClose();
  }
}
