import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import '../controllers/import_bill_controller.dart';

class ImportBillView extends GetView<ImportBillController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入库单管理'),
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

  Widget _dataItem(ViewImportBill d) {
    return Card(
      child: ListTile(
        title: Text(d.code!),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  _memberItem(d.quantity.toString(), "计划数量:"),
                  _memberItem(d.factQuantity.toString(), "下发数量:"),
                  _memberItem(d.completeQuantity.toString(), "完成数量:"),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  _memberItem(d.userName ?? "", "用户:"),
                  _memberItem(
                      d.executeFlag!.toBillExecuteFlag() ?? "", "执行标志:"),
                  _memberItem(d.time!.toYMDHMS(), "时间:"),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  _memberItem(d.customerName ?? "", "客户:"),
                  _memberItem(d.supplierName ?? "", "供应商:"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _memberItem(String val, String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 8),
        ),
        Expanded(
          child: Text(
            val,
            style: const TextStyle(color: Colors.blue, fontSize: 8),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
