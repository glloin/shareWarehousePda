import 'package:get/get.dart';
import 'package:pda/app/data/models/sys_user_token_model.dart';

class GlobalController extends GetxController {
  final Rx<SysUserToken?> user = Rx<SysUserToken?>(null);
}
