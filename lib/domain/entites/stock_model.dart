class StockSignal {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<SignalCriteria> criteria;

  const StockSignal({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory StockSignal.fromJson(Map<String, dynamic> json) {
    var criteriaList = json['criteria'] as List<dynamic>;
    List<SignalCriteria> criteria = criteriaList.map((c) => SignalCriteria.fromJson(c)).toList();

    return StockSignal(
      id: json['id']??0,
      name: json['name']??'',
      tag: json['tag']??'',
      color: json['color']??'',
      criteria: criteria,
    );
  }
}

class SignalCriteria {
  final String type;
  final String text;
  final Map<dynamic, dynamic> variable ;

  const SignalCriteria({
    required this.type,
    required this.text,
    required this.variable,
  });

  factory SignalCriteria.fromJson(Map<String, dynamic> json) {
    return SignalCriteria(
      type: json['type']??'',
      text: json['text']??'',
      variable:json['variable']??{},
    );
  }
}

class IndicatorVariable {
  final String type;
  final String studyType;
  final String parameterName;
  final int minValue;
  final int maxValue;
  final int defaultValue;
  final List<dynamic> values;

  const IndicatorVariable({
    required this.type,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
    required this.values,
  });

  factory IndicatorVariable.fromJson(Map<String, dynamic> json) {
    return IndicatorVariable(
      type: json['type']??'',
      studyType: json['study_type']??'',
      parameterName: json['parameter_name']??'',
      minValue: json['min_value']??0,
      maxValue: json['max_value']??0,
      defaultValue: json['default_value']??0,
      values: json['values']??[],
    );
  }
}
