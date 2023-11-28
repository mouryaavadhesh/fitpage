import 'package:fitpage/domain/entites/display_filter_model.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/state/filter_state.dart';
import 'package:fitpage/presentation/screen/filter_stock_values.dart';
import 'package:fitpage/utils/base/cubit.dart';
import 'package:fitpage/utils/enums/stock_filter_emum.dart';
import 'package:fitpage/utils/navigation_utils.dart';
import 'package:fitpage/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterCubit extends AppCubit<FilterState> {

  final BuildContext _context;
  final StockSignal stockSignal;

  FilterCubit( this._context,
      this.stockSignal,FilterState initialState) : super(initialState) {
    if (initialState is FilterInitial) {
      init();
    }
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

  DisplayFilterModel filterTextValue(SignalCriteria signalCriteria) {
    List<String> extractedStrings =
        Utils.extractStringsAssociatedWithDollarSign(signalCriteria.text);

    // dynamic decodedData = jsonDecode(signalCriteria.variable.toString());
    // dynamic data = json.decode(signalCriteria.variable.toString());
    // String key = data.keys.first;
    // List<int> value = data[key]['values'];
    //
    // Map<dynamic, List<int>> flutterMap = {key: value};
   // print(extractedStrings);

    List<String> dividedStrings = [];
    List<IndicatorVariable> list = [];

    extractedStrings.forEach((element) {
      // print(element);
      // print(signalCriteria.variable[element]);
      // print(json.decode(json.encode(signalCriteria.variable[element].toString())));

      IndicatorVariable indicatorVariable =
          IndicatorVariable.fromJson(signalCriteria.variable[element]);
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
      print(indicatorVariable.values);
      list.add(IndicatorVariable.fromJson({}));
      list.add(indicatorVariable);
    });
    return DisplayFilterModel(
        listString:
            dividedStrings.map((e) => e.trimLeft().trimRight().trim()).toList(),
        listIndicator: list);
  }

  String getTheNumber(IndicatorVariable indicatorVariable) {
    num number = 0;
    if (StockFilterTypeEnum.stockFilterTypeEnum[indicatorVariable.type] ==
        StockFilterType.indicator) {
      number = indicatorVariable.defaultValue;
    } else {
      number = indicatorVariable.values.first;
    }

    return number.toString();
  }

  navigateToValues(
      IndicatorVariable indicatorVariable, String text, String value) {
    print(indicatorVariable.values);
    Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => FilterStockValue(
            indicatorVariable: indicatorVariable,
            text: text,
            value: value,
          ),
        ));
  }
}
