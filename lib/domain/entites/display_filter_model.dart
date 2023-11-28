import 'package:fitpage/domain/entites/stock_model.dart';

class DisplayFilterModel {
  final List<String> listString;
  final List<IndicatorVariable> listIndicator;

  const DisplayFilterModel({
    required this.listString,
    required this.listIndicator,
  });

}