import 'package:get/get.dart';
import 'package:pda/app/data/models/notify_select_item_model.dart';
import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';
import 'package:pda/app/data/providers/import_notify_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:pda/app/modules/systemSettings/controllers/system_settings_controller.dart';

class AutoImportController extends GetxController {
  final bills = Rx<List<SelectItem>>([]);
  final bill = Rx<SelectItem?>(null);
  final notifies = Rx<List<NotifySelectItem>>([]);
  final notify = Rx<NotifySelectItem?>(null);

  @override
  void onInit() {
    Get.find<ImportBillProvider>().getSelectItems().then((value) {
      bills.value = value;
      final obj = Get.find<SystemSettingsController>().hub.notify.value;
      var index = value.indexWhere((element) => element.value == obj?.billId);
      if (index == -1) index = 0;
      bill.value = value[index];
      return Get.find<ImportNotifyProvider>()
          .getSelectItems(value[index].value!);
    }).then((value) {
      final v2 = value
          .where((element) => element.factQuantity! < element.quantity!)
          .toList();
      notifies.value = v2;
      final obj = Get.find<SystemSettingsController>().hub.notify.value;
      var index = v2.indexWhere((element) => element.value == obj?.notifyId);
      if (index == -1) index = 0;
      notify.value = v2[index];
    }).catchError(onError);
    super.onInit();
  }

  void billChange(SelectItem? v) {
    bill.value = v;
    if (v != null) {
      Get.find<ImportNotifyProvider>().getSelectItems(v.value!).then((value) {
        final v1 = value
            .where((element) => element.factQuantity! < element.quantity!)
            .toList();
        notifies.value = v1;
        notify.value = v1.first;
      }).catchError(onError);
    } else {
      notifies.value = [];
    }
  }

  void notifyChange(NotifySelectItem? v) {
    notify.value = v;
  }

  void onSubmit() {
    print(notify.value?.value);
    if (notify.value != null) {
      Get.find<ImportNotifyProvider>()
          .setNotify(notify.value!.value!)
          .then((r) {
        Get.back(result: r);
      }).catchError(onError);
    }
  }
}
