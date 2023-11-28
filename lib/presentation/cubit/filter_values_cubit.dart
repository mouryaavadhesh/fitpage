import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/state/filter_values_state.dart';
import 'package:fitpage/utils/base/cubit.dart';
import 'package:flutter/cupertino.dart';

class FilterValuesCubit extends AppCubit<FilterValuesState> {
  final IndicatorVariable indicatorVariable;
  final String text;
  final String value;
  TextEditingController controller =
      TextEditingController(text: 'Default value');

  FilterValuesCubit(
    this.indicatorVariable,
    this.text,
    this.value,
    super.initialState,
  ) {
    controller.text = value;
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
    emit(FilterValuesLoaded(indicatorVariable: indicatorVariable, text: text));
    return Future.value(false);
  }
}
