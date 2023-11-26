import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/utils/base/cubit.dart';

class StockState extends CubitState {
  StockState();
}
class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  List<StockSignal> stockList;

  StockLoaded({required this.stockList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is StockLoaded &&
              runtimeType == other.runtimeType &&
              stockList == other.stockList;

  @override
  int get hashCode => super.hashCode ^ stockList.hashCode;
}