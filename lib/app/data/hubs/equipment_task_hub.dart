import 'dart:async';
import 'package:get/get.dart';
import 'package:pda/app/data/hubs/retry_policy.dart';
import 'package:pda/app/data/models/view_equipment_task_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';

class EquipmentTaskHub {
  late HubConnection hub;

  final datas = Rx<List<ViewEquipmentTask>>([]);
  final errorMessage = Rx<String?>(null);
  final String mode;
  EquipmentTaskHub(bool Function(String) filterTask, this.mode) {
    const url = "${BaseConnectProvider.serviceUrl}/Hubs/EquipmentTask";
    hub = HubConnectionBuilder()
        .withUrl(url, transportType: HttpTransportType.WebSockets)
        .withAutomaticReconnect(
            reconnectPolicy: RetryPolicy((msg) => errorMessage.value = msg))
        .build();
    hub.on("Add", (arguments) {
      arguments?.forEach((dynamic element) {
        final data = ViewEquipmentTask.fromJson((element));
        if (filterTask(data.taskMode!)) {
          datas.value.add(data);
        }
      });
    });
    hub.on("DataChange", (arguments) {
      arguments?.forEach((dynamic element) {
        final data = ViewEquipmentTask.fromJson((element));
        if (filterTask(data.taskMode!)) {
          final index =
              datas.value.indexWhere((element) => element.id == data.id);
          if (index != -1) {
            datas.value[index] = data;
            datas.refresh();
          }
        }
      });
    });
    hub.on("Remove", (arguments) {
      arguments?.forEach((dynamic id) {
        final index = datas.value.indexWhere((element) => element.id == id);
        if (index != -1) {
          datas.value.removeAt(index);
          datas.refresh();
        }
      });
    });
    errorMessage.value = "连接服务器中......";
    hub.start()?.then(_onStart).catchError(onError);
  }

  FutureOr _onStart(v) {
    errorMessage.value = null;
    hub
        .invoke("GetViews", args: [mode])
        .then((value) => datas.value =
            (value as List).map((e) => ViewEquipmentTask.fromJson(e)).toList())
        .catchError(onError);
  }
}
