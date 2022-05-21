import 'package:flutter/material.dart';
import 'package:pda/app/data/models/view_import_notify_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/member_item.dart';

class NotifyWidget extends StatelessWidget {
  final ViewImportNotify data;
  final Color? color;
  const NotifyWidget({Key? key, required this.data, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  MemberItem(
                    val: data.quantity.toString(),
                    title: "计划数量:",
                    color: color,
                  ),
                  MemberItem(
                      val: data.factQuantity.toString(),
                      title: "下发数量:",
                      color: color),
                  MemberItem(
                      val: data.factQuantity.toString(),
                      title: "下发数量:",
                      color: color),
                  MemberItem(
                      val: data.completeQuantity.toString(),
                      title: "完成数量:",
                      color: color),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  MemberItem(
                      val: data.productionDate!.toYMD(),
                      title: "生产日期:",
                      color: color),
                  MemberItem(
                    val: data.goodsStatusName ?? "",
                    title: "状态:",
                    color: color,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
