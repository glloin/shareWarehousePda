import 'dart:convert';
import 'package:pda/app/data/models/sys_user_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreProvider {
  static const keyUserInfo = "{b125e583-6d56-407b-829a-db663eb7a274}";

  Future<SysUserToken?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString(keyUserInfo);
    if (str == null || str.isEmpty) {
      return null;
    } else {
      return SysUserToken.fromJson(const JsonDecoder().convert(str));
    }
  }

  Future setUserInfo(SysUserToken user) async {
    final prefs = await SharedPreferences.getInstance();
    final str = const JsonEncoder().convert(user.toJson());
    await prefs.setString(keyUserInfo, str);
  }

  Future clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyUserInfo);
  }
}
