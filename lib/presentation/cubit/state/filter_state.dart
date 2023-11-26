import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/utils/base/cubit.dart';

class FilterState extends CubitState {
  FilterState();
}
class FilterInitial extends FilterState {}

class FilterLoaded extends FilterState {
  StockSignal stockSignal;

  FilterLoaded({required this.stockSignal});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is FilterLoaded &&
              runtimeType == other.runtimeType &&
              stockSignal == other.stockSignal;

  @override
  int get hashCode => super.hashCode ^ stockSignal.hashCode;
}