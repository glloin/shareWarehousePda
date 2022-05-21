import 'dart:async';

import 'package:get/get.dart';
import 'package:pda/app/data/hubs/retry_policy.dart';
import 'package:pda/app/data/models/view_laneway_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';

class LanewayHub {
  late final HubConnection hub;
  LanewayHub() {
    hub = HubConnectionBuilder()
        .withUrl("${BaseConnectProvider.serviceUrl}/Hubs/Laneway",
            transportType: HttpTransportType.WebSockets)
        .withAutomaticReconnect(
            reconnectPolicy: RetryPolicy((msg) => errorMsg.value = msg))
        .build();
    hub.start()?.then(_onStart).catchError(onError);
  }

  final errorMsg = Rx<String?>(null);
  final datas = Rx<List<ViewLaneway>>([]);
  FutureOr _onStart(void value) {
    hub.invoke("GetViews").then((value) {
      datas.value =
          (value as List).map((e) => ViewLaneway.fromJson(e)).toList();
    }).catchError(onError);
  }
}
