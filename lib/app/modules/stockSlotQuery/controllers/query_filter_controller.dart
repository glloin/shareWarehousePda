import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/data/providers/goods_provider.dart';
import 'package:pda/app/data/providers/stock_slot_provider.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/message.dart';

class QueryFilterController extends GetxController {
  late GetViewQueryData data;

  void dateChange(DateTime? st, DateTime? en) {
    data.start = st?.millisecondsSinceEpoch;
    data.end = en?.millisecondsSinceEpoch;
  }

  final goods = Rx<List<SelectItem>>([]);
  final selectedGoods = Rx<SelectItem?>(null);
  final billCtl = TextEditingController();
  final slotCodeCtl = TextEditingController();
  final billErrorMsg = Rx<String?>(null);
  final slotCodeErrorMsg = Rx<String?>(null);

  @override
  void onInit() {
    Get.find<GoodsProvider>().getSelectItems().then((value) {
      goods.value = value;
      if (data.goodsId != null) {
        selectedGoods.value =
            value.firstWhereOrNull((element) => element.value == data.goodsId);
      }
    }).catchError(onError);
    billCtl.addListener(billCtlListen);
    slotCodeCtl.addListener(slotCodeCtlListen);

    super.onInit();
  }

  void billCtlListen() {
    String? err;
    if (billCtl.text.isNotEmpty) {
      err = billCtl.text.isImportBillCode();
      if (err == null) {
        data.billCode = billCtl.text;
      } else {
        data.billCode = null;
      }
    }
    billErrorMsg.value = err;
  }

  void slotCodeCtlListen() {
    String? err;
    if (slotCodeCtl.text.isNotEmpty) {
      err = slotCodeCtl.text.isSlotCode();
      if (err == null) {
        data.slotCode = slotCodeCtl.text;
      } else {
        data.slotCode = null;
      }
    }
    slotCodeErrorMsg.value = err;
  }

  void goodsChanged(SelectItem? data) {
    selectedGoods.value = data;
    this.data.goodsId = data?.value;
  }

  void onFliter() {
    data.goodsId = selectedGoods.value?.value;
    Get.back(result: data);
  }
}
