import 'package:signalr_netcore/iretry_policy.dart';

class RetryPolicy extends IRetryPolicy {
  final void Function(String msg) onError;
  RetryPolicy(this.onError);

  @override
  int? nextRetryDelayInMilliseconds(RetryContext retryContext) {
    onError('与服务器断开连接! 第 ${retryContext.previousRetryCount} 次尝试重新连接服务器.');
    return 5000;
  }
}
