import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import '../controllers/import_bill_controller.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';

class ImportBillView extends GetView<ImportBillController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入库单管理'),
        actions: [const LoginInfoView()],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Center(
            child: Obx(() => ListView.builder(
                  itemBuilder: (c, index) {
                    final d = controller.datas.value[index];
                    return _dataItem(d);
                  },
                  itemCount: controller.datas.value.length,
                ))),
      ),
    );
  }

  Widget _dataItem(ViewImportBill d) {
    return Card(
      child: ListTile(
        onTap: () => controller.showNotifyDetail(d),
        title: Text(d.code!),
        subtitle: Column(
          children: [
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      _memberItem(d.quantity.toString(), "计划数量:"),
                      _memberItem(d.factQuantity.toString(), "下发数量:"),
                      _memberItem(d.completeQuantity.toString(), "完成数量:"),
                      _memberItem(d.userName ?? '', "建单人:"),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      _memberItem(d.customerName ?? "", "客户:"),
                      _memberItem(d.supplierName ?? "", "供应商:"),
                      _memberItem(d.executeFlag.toString(), "执行状态:"),
                      _memberItem(d.time!.toYMDHMS(), "建单时间:"),
                    ],
                  ),
                ),
              ],
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
          style: const TextStyle(fontSize: 10),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            val,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
