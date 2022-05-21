import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pda/app/data/models/scan_info_model.dart';

typedef FunctionType = void Function(ScanInfo code);

class ScannerProvider {
  ScannerProvider._() {
    scanChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    _createProfile("wangguan.pda");
  }

  void _onEvent(event) {
    var c = ScanInfo.fromJson(jsonDecode(event));
    _handle(c);
  }

  void _onError(Object error) {
    print(error);
  }

  Future<void> _createProfile(String profileName) async {
    try {
      await methodChannel.invokeMethod('createDataWedgeProfile', profileName);
    } on PlatformException {
      //  Error invoking Android method
    }
  }

  static const MethodChannel methodChannel = MethodChannel('kedle.pda/command');
  static const EventChannel scanChannel = EventChannel('kedle.pda/scan');

  final List<FunctionType> _fns = [];
  _handle(ScanInfo qrCode) {
    for (var f in _fns) {
      f(qrCode);
    }
  }

  void addListen(FunctionType f) {
    _fns.add(f);
  }

  void removeListen(FunctionType f) {
    _fns.remove(f);
  }

  static ScannerProvider? _obj;
  static ScannerProvider get instance {
    _obj ??= ScannerProvider._();
    return _obj!;
  }
}
