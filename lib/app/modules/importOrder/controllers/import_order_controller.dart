import 'package:get/get.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';
import 'package:pda/app/data/models/view_import_order_model.dart';
import 'package:pda/app/global/message.dart';

class ImportOrderController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.find<ImportOrderProvider>()
        .getUnFinishiedList()
        .then((value) => datas.value = value)
        .catchError(onError);
  }

  final datas = Rx<List<ViewImportOrder>>([]);

  void onCancel(ViewImportOrder d) async {
    final b = await confirm("您确定要取消出库流水号为${d.orderNo}的出库流水吗?");
    if (b != null && b) {
      try {
        final r1 = await Get.find<ImportOrderProvider>().cancel(d.id!);
        final index = datas.value.indexOf(d);
        if (index != -1) {
          datas.value[index] = r1;
          datas.refresh();
          await info("入库流水取消成功!");
        } else {
          throw "取消失败!";
        }
      } catch (e) {
        alarm(e.toString());
      }
    }
  }
}
