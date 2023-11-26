import 'dart:convert';

import 'package:fitpage/data/repositories/stock_repository.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/state/filter_state.dart';
import 'package:fitpage/utils/base/cubit.dart';
import 'package:fitpage/utils/enums/stock_filter_emum.dart';
import 'package:fitpage/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterCubit extends AppCubit<FilterState> {
  // The key to be used when accessing SliverAnimatedListState
  final GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();
  final StockSignal stockSignal;

  FilterCubit(
    this.stockSignal,
    super.initialState,
  ) {
    init();
  }

  @override
  void init() {
    onRefresh();
  }

  @override
  Future<bool> onBackPress() {
    return Future.value(false);
  }

  @override
  Future<void> onRefresh() async {
    emit(FilterLoaded(stockSignal: stockSignal));

    return Future.value(false);
  }

  List<String> filterTextValue(SignalCriteria signalCriteria) {
    List<String> extractedStrings =
        Utils.extractStringsAssociatedWithDollarSign(signalCriteria.text);

    // dynamic decodedData = jsonDecode(signalCriteria.variable.toString());
    // dynamic data = json.decode(signalCriteria.variable.toString());
    // String key = data.keys.first;
    // List<int> value = data[key]['values'];
    //
    // Map<dynamic, List<int>> flutterMap = {key: value};
    // print(flutterMap);


     List<String> dividedStrings = [];
    // // result.forEach((key, value) {
    // //      print("$key: ${value.type}, ${value.studyType}, ${value.parameterName}, ${value.minValue}, ${value.maxValue}, ${value.defaultValue}");
    // // });
    //
    extractedStrings.forEach((element) {
      // print(element);
      // print(signalCriteria.variable[element]);
      // print(json.decode(json.encode(signalCriteria.variable[element].toString())));

      IndicatorVariable indicatorVariable = IndicatorVariable.fromJson(signalCriteria.variable[element]);
      if (dividedStrings.isEmpty) {
        dividedStrings = signalCriteria.text.split(element);
        dividedStrings.insert(
            dividedStrings.length - 1, getTheNumber(indicatorVariable));
      } else {
        var temp = dividedStrings.last.split(element);
        dividedStrings.removeLast();
        dividedStrings.addAll(temp);
        dividedStrings.insert(
            dividedStrings.length - 1, getTheNumber(indicatorVariable));
      }
    });

    //return [];
    return dividedStrings.map((e) => e.trimLeft().trimRight().trim()).toList();

  }

  String getTheNumber(IndicatorVariable indicatorVariable) {
    num number = 0;
    if (StockFilterTypeEnum
        .stockFilterTypeEnum[indicatorVariable.type] ==
        StockFilterType.indicator) {
      number = indicatorVariable.defaultValue;
    } else {
      number = indicatorVariable.values.first;
    }

    return number.toString();
  }
}
