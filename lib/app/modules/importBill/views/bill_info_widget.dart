import 'package:flutter/material.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/member_item.dart';

class BillInfoWidget extends StatelessWidget {
  final ViewImportBill data;
  final Widget? child;
  const BillInfoWidget({Key? key, required this.data, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Text(data.code!,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      MemberItem(
                          val: data.quantity.toString(),
                          title: "计划数量:",
                          color: Colors.white),
                      MemberItem(
                          val: data.factQuantity.toString(),
                          title: "下发数量:",
                          color: Colors.white),
                      MemberItem(
                          val: data.completeQuantity.toString(),
                          title: "完成数量:",
                          color: Colors.white),
                      MemberItem(
                          val: data.userName ?? "",
                          title: "建单人:",
                          color: Colors.white),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      MemberItem(
                          val: data.customerName ?? "",
                          title: "客户:",
                          color: Colors.white),
                      MemberItem(
                          val: data.supplierName ?? "",
                          title: "供应商:",
                          color: Colors.white),
                      MemberItem(
                          val: data.executeFlag.toString(),
                          title: "执行状态:",
                          color: Colors.white),
                      MemberItem(
                          val: data.time!.toYMDHMS(),
                          title: "建单时间:",
                          color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            if (child != null) child!
          ],
        ),
      ),
    );
  }
}
