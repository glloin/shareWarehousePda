import 'package:pda/app/data/models/sys_user_token_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';

class SysUserProvider extends BaseConnectProvider {
  Future<SysUserToken> login(String code, String pwd) async {
    final res = await get('/api/sysUser/login?code=$code&pwd=$pwd');
    final user = SysUserToken.fromJson(getResponseData(res));
    return user;
  }

  Future<SysUserToken> refresh() async {
    final res = await get('/api/sysUser/refresh');
    final user = SysUserToken.fromJson(getResponseData(res));
    return user;
  }
}
