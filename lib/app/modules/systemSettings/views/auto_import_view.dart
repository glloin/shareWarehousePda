import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pda/app/data/models/notify_select_item_model.dart';
import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/modules/systemSettings/controllers/auto_import_controller.dart';

class AutoImportView extends GetView<AutoImportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自动入库设置'),
        actions: [const LoginInfoView()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => DropdownButton<SelectItem>(
                onChanged: controller.billChange,
                hint: Text(controller.bill.value == null
                    ? "请选择入库单"
                    : controller.bill.value!.label!),
                items: controller.bills.value
                    .map((e) => DropdownMenuItem(
                          child: Text(e.label!),
                          value: e,
                        ))
                    .toList())),
            const SizedBox(
              height: 10,
            ),
            Obx(() => DropdownButton<NotifySelectItem>(
                  items: controller.notifies.value
                      .map((e) => DropdownMenuItem(
                            child: Text(e.label!),
                            value: e,
                          ))
                      .toList(),
                  onChanged: controller.notifyChange,
                  hint: Text(controller.notify.value == null
                      ? "请选择入库明细"
                      : controller.notify.value!.label!),
                )),
            const SizedBox(height: 20),
            Obx(() => OutlinedButton(
                onPressed: controller.notify.value == null
                    ? null
                    : controller.onSubmit,
                child: const Text("确定")))
          ],
        ),
      ),
    );
  }
}
