import 'package:get/get.dart';
import 'package:pda/app/data/models/scan_info_model.dart';
import 'package:pda/app/data/providers/local_store_provider.dart';
import 'package:pda/app/data/providers/scan_provider.dart';
import 'package:pda/app/data/providers/sys_user_provider.dart';
import 'package:pda/app/global/global_controller.dart';
import 'package:pda/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final loading = false.obs;
  final count = 0.obs;
  final code = Rx<String?>(null);
  @override
  void onInit() {
    super.onInit();
    ScannerProvider.instance.addListen(_scan);
    refreshUser();
  }

  Future refreshUser() async {
    try {
      var localStorageProvider = Get.find<LocalStoreProvider>();
      final u1 = await localStorageProvider.getUserInfo();
      if (u1 == null) {
        throw '没有登录信息';
      } else {
        Get.find<GlobalController>().user.value = u1;
        var sysUserProvider = Get.find<SysUserProvider>();
        final u2 = await sysUserProvider.refresh();
        Get.find<GlobalController>().user.value = u2;
        localStorageProvider.setUserInfo(u2);
      }
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void onClose() {
    ScannerProvider.instance.removeListen(_scan);
    super.onClose();
  }

  void _scan(ScanInfo data) {
    code.value = data.scanData;
  }

  Future toImportBill() async {
    await Get.toNamed(Routes.IMPORT_BILL);
  }

  Future toImportOrder() async {
    await Get.toNamed(Routes.IMPORT_ORDER);
  }

  Future toStockSlotQuery() async {
    await Get.toNamed(Routes.STOCK_SLOT_QUERY);
  }

  Future toFaultImport() async {
    await Get.toNamed(Routes.FAULT_IMPORT);
  }
}
