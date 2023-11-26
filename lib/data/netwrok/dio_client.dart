import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitpage/utils/utils.dart';
import 'package:fitpage/utils/widget/reusable_widget.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  late Dio dio;

  DioClient.init() {
    initDio();
  }

  initDio() {
    try {
      dio = Dio(BaseOptions(
        baseUrl: "http://coding-assignment.bombayrunning.com/data.json",
        connectTimeout: 180000,
        receiveTimeout: 600000,
      ));

      if (dio.interceptors.isEmpty) {
        dio.interceptors.addAll([
          if (kDebugMode)

          InterceptorsWrapper(
            onRequest: (options, handler) async {
              return handler.next(options);
            },
            onResponse: (response, handler) {
              return handler.next(response);
            },
            onError: (e, handler) async {
              Utils.normalPrint("response ${e.response} stackTrace ${e.stackTrace} type ${e.type}");
              switch (e.type) {
                case DioErrorType.connectTimeout:
                case DioErrorType.other:
                case DioErrorType.sendTimeout:
                  ReusableWidget.toastMsg(
                      'Request is taking more time to respond, please try again after sometime');
                  break;
                case DioErrorType.response:
                  if (e.response != null) return handler.resolve(e.response!);
                  break;
                case DioErrorType.receiveTimeout:
                  break;
                case DioErrorType.cancel:
                  break;
              }
              if (e.error != null) {
                if (!(e.error is SocketException ||
                    e.error is HandshakeException)) {
                  Utils.captureException(
                      e.error, e.stackTrace ?? StackTrace.empty);
                }
              }
            },
          ),
        ]);
      }
    } catch (exception, stackTrace) {
      Utils.captureException(exception, stackTrace);
    }
  }
}
