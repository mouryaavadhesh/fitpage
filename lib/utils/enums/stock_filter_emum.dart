enum StockFilterType { plainText, variable,value,indicator }


class StockFilterTypeEnum {
  static const Map<String, StockFilterType> stockFilterTypeEnum = {
    "plain_text": StockFilterType.plainText,
    "variable": StockFilterType.variable,
    "value": StockFilterType.value,
    "indicator": StockFilterType.indicator,
  };
}