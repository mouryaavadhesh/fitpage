import 'package:dotted_line/dotted_line.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/filter_values_cubit.dart';
import 'package:fitpage/presentation/cubit/state/filter_values_state.dart';
import 'package:fitpage/utils/template/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class FilterStockValue extends StatefulWidget {
  final IndicatorVariable indicatorVariable;
  final String text;
  final String value;

  const FilterStockValue(
      {required this.indicatorVariable,
      required this.text,
      required this.value})
      : super();

  @override
  State<StatefulWidget> createState() => _FilterStockValueState();
}

class _FilterStockValueState extends State<FilterStockValue> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterValuesCubit(widget.indicatorVariable,
          widget.text, widget.value, FilterValuesInitial()),
      child: BlocBuilder<FilterValuesCubit, FilterValuesState>(
          builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: widget.indicatorVariable.defaultValue > 0
                ? Colors.white
                : Colors.black,
            body: state is FilterValuesLoaded ? _body(context, state) : 0.width,
          ),
        );
      }),
    );
  }

  Widget _body(BuildContext context, FilterValuesLoaded filterValuesLoaded) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (filterValuesLoaded.indicatorVariable.defaultValue > 0) ...[
            _defaultValueLayout(context, filterValuesLoaded.text),
          ] else ...[
            _valueCard(context, filterValuesLoaded.indicatorVariable.values),
          ],
          if (filterValuesLoaded.indicatorVariable.defaultValue > 0) ...[
            Container(
              color: Colors.black,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
            )
          ]
        ],
      ),
    );
  }

  _defaultValueLayout(BuildContext context, String text) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          StockText.textSemiBold(
            text: text.toUpperCase(),
            maxLines: 2,
            color: Colors.white,
            fontSize: 20,
          ),
          StockText.textSemiBold(
              text: "Set Parameters", fontSize: 14, color: Colors.white),
          10.height,
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: StockText.textSemiBold(
                    text: "Period",
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: context.read<FilterValuesCubit>().controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _valueCard(BuildContext context, List<dynamic> listData) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: StockText.textSemiBold(
            text: listData[i].toString(),
            color: Colors.white,
            fontSize: 20,
          ),
        );
      },
      separatorBuilder: (_, i) => const DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.white,
        dashGapLength: 1.0,
        dashGapColor: Colors.transparent,
      ),
      itemCount: listData.length,
    );
  }
}
