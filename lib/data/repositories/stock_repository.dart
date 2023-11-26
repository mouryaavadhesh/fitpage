import 'package:fitpage/data/netwrok/api_stock.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/utils/base/app_instance.dart';
import 'package:fitpage/utils/base/repo_response.dart';
import 'package:fitpage/utils/enums/data.dart';
import 'package:fitpage/utils/utils.dart';

class StockRepo {
  Future<RepoResponse<List<StockSignal>>> getStockInfo() async {
    try {
      return await AppInstance().getApiInstance.getStock().then((value) {
        if (value != null) {
          return SuccessResponse(
              value.map((e) => StockSignal.fromJson(e)).toList());
        } else {
          return FailedResponse(DataErrorState.noData);
        }
      });
    } catch (exception, stackTrace) {
      Utils.captureException(exception, stackTrace);
      return FailedResponse(DataErrorState.exception);
    }
  }
}
