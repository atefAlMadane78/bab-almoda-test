import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

class CacheResponse {
  static Timer? stopSendingTimer;
  static CancelableOperation? _myCancelableFuture;
  static Duration _duration = const Duration(milliseconds: 800);

  static Timer? stopSendingTimerDetails;

  static cacheableResopnseMethod(Future<dynamic> Function() task) {
    _duration = const Duration(milliseconds: 800);
    if (stopSendingTimer != null) {
      _cancelFuture();
      stopSendingTimer!.cancel();
    }

    stopSendingTimer = Timer(_duration, () {
      _myCancelableFuture = CancelableOperation.fromFuture(
        task(),
        onCancel: () => 'Future has been canceld',
      );
    });
  }

  static void _cancelFuture() async {
    await _myCancelableFuture?.cancel();
  }
}
