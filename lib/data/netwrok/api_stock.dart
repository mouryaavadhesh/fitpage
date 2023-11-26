import 'package:fitpage/data/netwrok/dio_client.dart';

extension StockApi on DioClient {
  Future<List?> getStock() async {
    var response = await dio.get("");
    switch (response.statusCode) {
      case 200:
        return response.data;
      default:
        print(response);
    }
    return null;
  }
}
