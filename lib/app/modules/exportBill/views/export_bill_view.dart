import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_export_bill_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/global/widgets/member_item.dart';
import '../controllers/export_bill_controller.dart';

class ExportBillView extends GetView<ExportBillController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('出库单管理'),
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

  Widget _dataItem(ViewExportBill d) {
    return Card(
      child: ListTile(
        title: Text(d.code!),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Column(
                children: [
                  MemberItem(val: d.quantity.toString(), title: "计划数量:"),
                  MemberItem(val: d.factQuantity.toString(), title: "下发数量:"),
                  MemberItem(
                      val: d.completeQuantity.toString(), title: "完成数量:"),
                  MemberItem(
                      val: d.executeFlag!.toBillExecuteFlag() ?? "",
                      title: "执行状态:"),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  MemberItem(val: d.userName ?? "", title: "用户:"),
                  MemberItem(val: d.customerName ?? "", title: "客户:"),
                  MemberItem(val: d.supplierName ?? "", title: "供应商:"),
                  MemberItem(val: d.time!.toYMDHMS(), title: "时间:"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
