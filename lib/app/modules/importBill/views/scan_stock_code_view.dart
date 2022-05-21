import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/data/models/view_import_notify_model.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/modules/importBill/controllers/scan_stock_code_controller.dart';
import 'package:pda/app/modules/importBill/views/notify_widget.dart';
import 'bill_info_widget.dart';

class ScanStockCodeView extends GetView<ScanStockCodeController> {
  final ViewImportBill bill;
  final ViewImportNotify notify;
  ScanStockCodeView(this.bill, this.notify) {
    controller.notifyId = notify.id!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组盘入库"),
        actions: [const LoginInfoView()],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BillInfoWidget(
                data: bill,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        notify.goodsName ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      NotifyWidget(data: notify, color: Colors.white),
                    ],
                  ),
                )),
            const SizedBox(height: 30),
            _item(
                "托盘条码:",
                _itemInput(Obx(() => TextField(
                      controller: controller.ctl,
                      decoration: InputDecoration(
                          hintText: "请输入或扫描托盘条码!",
                          errorText: controller.errorMsg.value),
                      keyboardType: TextInputType.number,
                      onEditingComplete: controller.addImportOrder,
                    )))),
            const SizedBox(height: 24),
            OutlinedButton(
                onPressed: controller.addImportOrder,
                child: const Text("添加入库流水"))
          ],
        ),
      ),
    );
  }

  Expanded _itemInput(Widget child) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: child,
    ));
  }

  Row _item(String title, Widget child) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          child: Text(title),
          width: 80,
        ),
        child
      ],
    );
  }
}
