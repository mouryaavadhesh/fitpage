import 'dart:async';

import 'package:fitpage/utils/base/repo_response.dart';
import 'package:fitpage/utils/enums/data.dart';

extension ExtFuture<S> on Future<RepoResponse<S>> {
  Future<R> thenListenData<R>(
      {FutureOr<R> Function(S)? onSuccess,
      FutureOr<R> Function(DataErrorState)? onFailed}) {
    return then((value) {
      if (value.s != null) {
        if (onSuccess != null) {
          return onSuccess.call(value.s!);
        } else {
          return Future.value(null);
        }
      } else {
        if (onFailed != null) {
          return onFailed.call(value.f!);
        } else {
          return Future.value(null);
        }
      }
    });
  }

  Future<R> thenSuccessData<R>(FutureOr<R> Function(S) data) {
    return then((value) {
      if (value.s != null) {
        return data.call(value.s!);
      } else {
        return Future.value(null);
      }
    });
  }

  Future<R> thenFailedData<R>(FutureOr<R> Function(DataErrorState) data) {
    return then<R>((value) {
      if (value.f != null) {
        return data.call(value.f!);
      } else {
        return Future.value(null);
      }
    });
  }
}

