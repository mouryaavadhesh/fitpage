import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/utils/base/cubit.dart';

class FilterValuesState extends CubitState {
  FilterValuesState();
}

class FilterValuesInitial extends FilterValuesState {}

class FilterValuesLoaded extends FilterValuesState {
  final IndicatorVariable indicatorVariable;
  final String text;

  FilterValuesLoaded({required this.indicatorVariable,required this.text});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is FilterValuesLoaded &&
          runtimeType == other.runtimeType &&
          indicatorVariable == other.indicatorVariable &&
          text == other.text ;

  @override
  int get hashCode => super.hashCode ^ indicatorVariable.hashCode ^ text.hashCode ;
}
