import 'package:fitpage/data/repositories/stock_repository.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/state/sotck_state.dart';
import 'package:fitpage/presentation/screen/filter_stock.dart';
import 'package:fitpage/utils/base/cubit.dart';
import 'package:fitpage/utils/extensions.dart';
import 'package:flutter/material.dart';

class StockCubit extends AppCubit<StockState> {
  final BuildContext _context;
  final StockRepo _stockRepo = StockRepo();
  final GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();

  StockCubit(
    this._context,
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
    emit(StockLoading());
    _stockRepo.getStockInfo().thenSuccessData((response) {
      emit(StockLoaded(stockList: response));
    });
    return Future.value(false);
  }

  void navigateToFilter(StockSignal stockSignal) {
    Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => FilterStock(
            stockSignal: stockSignal,
          ),
        ));
  }
}
