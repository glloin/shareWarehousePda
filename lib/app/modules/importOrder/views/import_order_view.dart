import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_import_order_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/global/widgets/member_item.dart';

import '../controllers/import_order_controller.dart';

class ImportOrderView extends GetView<ImportOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入库流水管理'),
        actions: [const LoginInfoView()],
      ),
      body: Center(
          child: Obx(() => ListView.builder(
                itemBuilder: (c, index) {
                  final d = controller.datas.value[index];
                  return _dataItem(d);
                },
                itemCount: controller.datas.value.length,
              ))),
    );
  }

  Widget _dataItem(ViewImportOrder d) {
    return Card(
        child: _getTrailing(
      d,
      ListTile(
        title: Text(d.orderNo!),
        subtitle: Column(
          children: [
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      MemberItem(val: d.goodsName ?? "", title: "物品名称"),
                      MemberItem(val: d.slotCode ?? "", title: "储位编码:"),
                      MemberItem(val: d.stockCode ?? "", title: "缸体码:"),
                      MemberItem(val: d.quantity.toString(), title: "数量:"),
                      MemberItem(val: d.userName ?? "", title: "用户:"),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      MemberItem(val: d.customerName ?? "", title: "客户:"),
                      MemberItem(val: d.supplierName ?? "", title: "供应商:"),
                      MemberItem(
                          val: d.executeFlag!.toOrderExecuteFlag(),
                          title: "执行标志:"),
                      MemberItem(val: d.time!.toYMDHMS(), title: "时间:"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _getTrailing(ViewImportOrder d, Widget child) {
    if (d.executeFlag == "WaitingExecute") {
      return Stack(
        children: [
          child,
          Positioned(
            right: 4,
            top: 12,
            child: InkWell(
                onTap: () => controller.onCancel(d),
                child: const Icon(
                  Icons.cancel_outlined,
                  size: 24,
                )),
          ),
        ],
      );
    }
    return child;
  }
}
