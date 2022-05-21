import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/data/providers/stock_slot_provider.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/date_range_picker.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/modules/stockSlotQuery/controllers/query_filter_controller.dart';

class QueryFilterView extends GetView<QueryFilterController> {
  QueryFilterView(GetViewQueryData data) {
    final c = Get.find<QueryFilterController>();
    c.data = data;
    if (data.billCode != null) c.billCtl.text = data.billCode!;
    if (data.slotCode != null) c.slotCodeCtl.text = data.slotCode!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('库存过滤'),
        actions: [const LoginInfoView()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              DateRangePicker(
                  onChange: controller.dateChange,
                  start: controller.data.start?.toDateTime(),
                  end: controller.data.end?.toDateTime()),
              const SizedBox(height: 12),
              _item(
                  "入库单号:",
                  _itemInput(Obx(() => TextField(
                        controller: controller.billCtl,
                        decoration: InputDecoration(
                            hintText: "请输入或扫描入库单号!",
                            errorText: controller.billErrorMsg.value),
                      )))),
              const SizedBox(height: 12),
              _item(
                  "储位编码:",
                  _itemInput(Obx(() => TextField(
                        controller: controller.slotCodeCtl,
                        decoration: InputDecoration(
                            hintText: "请输入或扫描储位编码!",
                            errorText: controller.slotCodeErrorMsg.value),
                      )))),
              const SizedBox(height: 12),
              _item(
                  "物品名称:",
                  Row(
                    children: [
                      Obx(() => Row(
                            children: [
                              DropdownButton<SelectItem>(
                                hint: Text(
                                  controller.selectedGoods.value?.label ??
                                      "请选择一个物品信息!",
                                ),
                                onChanged: controller.goodsChanged,
                                items: controller.goods.value
                                    .map((e) => DropdownMenuItem(
                                          child: Center(child: Text(e.label!)),
                                          value: e,
                                        ))
                                    .toList(),
                              ),
                              if (controller.selectedGoods.value != null)
                                IconButton(
                                    onPressed: () =>
                                        controller.selectedGoods.value = null,
                                    icon: const Icon(Icons.clear))
                            ],
                          )),
                    ],
                  )),
              const SizedBox(height: 24),
              Center(
                  child: OutlinedButton(
                      onPressed: controller.onFliter, child: const Text("确定")))
            ],
          ),
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
