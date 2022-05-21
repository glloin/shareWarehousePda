import 'package:get/get.dart';
import 'package:pda/app/data/models/view_stock_slot.dart';
import 'package:pda/app/data/providers/stock_slot_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:pda/app/modules/stockSlotQuery/views/query_filter_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QualityManagerController extends GetxController {
  GetViewQueryData queryData = GetViewQueryData(current: 1, pageSize: 8);
  int totalCount = 0;
  final datas = Rx<List<ViewStockSlot>>([]);
  final ctl = RefreshController(initialRefresh: true);

  void onRefresh() async {
    try {
      queryData.current = 1;
      final data = await Get.find<StockSlotProvider>().getViews(queryData);
      totalCount = (data.total! / data.pageSize!).ceil();
      datas.value = data.datas;
      ctl.refreshCompleted();
      ctl.loadComplete();
    } catch (e) {
      ctl.refreshFailed();
    }
  }

  void onLoading() async {
    queryData.current++;
    if (queryData.current > totalCount) {
      ctl.loadNoData();
      return;
    }
    try {
      final data = await Get.find<StockSlotProvider>().getViews(queryData);
      queryData.current = data.current!;
      totalCount = (data.total! / data.pageSize!).ceil();
      datas.value.addAll(data.datas);
      datas.refresh();
      ctl.loadComplete();
    } catch (e) {
      ctl.loadFailed();
    }
  }

  void onFilter() async {
    try {
      final data = await Get.to<GetViewQueryData>(QueryFilterView(queryData));
      if (data != null) {
        queryData = data;
        onRefresh();
      }
    } catch (e) {
      onError(e);
    }
  }

  @override
  void dispose() {
    ctl.dispose();
    super.dispose();
  }
}
