import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/filter_cubit.dart';
import 'package:fitpage/presentation/cubit/state/filter_state.dart';
import 'package:fitpage/utils/enums/stock_filter_emum.dart';
import 'package:fitpage/utils/template/text.dart';
import 'package:fitpage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class FilterStock extends StatefulWidget {
  final StockSignal stockSignal;

  const FilterStock({Key? key, required this.stockSignal}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FilterState();
}

class _FilterState extends State<FilterStock> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(widget.stockSignal, FilterInitial()),
      child: BlocBuilder<FilterCubit, FilterState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: state is FilterLoaded ? _body(context, state) : 0.width,
          ),
        );
      }),
    );
  }

  Widget _body(BuildContext context, FilterLoaded stockLoaded) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return 20.height;
            },
            childCount: 1, // 1000 list items
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            _headingCard(context, stockLoaded.stockSignal),
          ]),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            SignalCriteria signalCriteria =
                stockLoaded.stockSignal.criteria[index];
            return StockFilterTypeEnum
                        .stockFilterTypeEnum[signalCriteria.type] ==
                    StockFilterType.plainText
                ? _filterCardNormal(
                    context, stockLoaded.stockSignal.criteria[index], index)
                : _filterCard(
                    context, stockLoaded.stockSignal.criteria[index], index);
          },
          childCount: stockLoaded.stockSignal.criteria.length,
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: Colors.black,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 5),
              );
            },

            childCount: 1, // 1000 list items
          ),
        ),
      ],
    );
  }

  _headingCard(BuildContext context, StockSignal stockSignal) {
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            StockText.textSemiBold(
              text: stockSignal.name.capitalizeFirstLetter(),
              maxLines: 2,
              color: Colors.white,
              fontSize: 20,
            ),
            StockText.textSemiBold(
                text: stockSignal.tag.capitalizeFirstLetter(),
                color: Utils.convertColorTextToColor(stockSignal.color),
                fontSize: 14),
            10.height,
          ],
        ),
      ),
    );
  }

  _filterCardNormal(
      BuildContext context, SignalCriteria signalCriteria, int index) {
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (index > 0) ...[
            StockText.textSemiBold(
                text: "\nand\n",
                color: Colors.white,
                fontSize: 14,
                maxLines: 3),
          ],
          StockText.textSemiBold(
              text: signalCriteria.text,
              color: Colors.white,
              fontSize: 14,
              maxLines: 3),
        ],
      ),
    );
  }

  _filterCard(BuildContext context, SignalCriteria signalCriteria, int index) {
    List<String> list =
        context.read<FilterCubit>().filterTextValue(signalCriteria);
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (index > 0) ...[
            StockText.textSemiBold(
                text: "\nand\n",
                color: Colors.white,
                fontSize: 14,
                maxLines: 3),
          ],
          RichText(
            text: TextSpan(
              children: generateTextSpans(list, index),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> generateTextSpans(List<String> texts, int index) {
    List<TextSpan> textSpans = [];

    for (String text in texts) {
      if (isNumeric(text)) {
        textSpans.add(
          TextSpan(
            text: "($text)",
            style: const TextStyle(
              color: Colors.blue, // Customize the style as needed
              fontSize: 14.0,
            ),
          ),
        );
      } else {
        textSpans.add(
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.white, // Customize the style as needed
              fontSize: 14.0,
            ),
          ),
        );
      }

      // Add a space between text elements
      textSpans.add(const TextSpan(text: ' '));
    }

    return textSpans;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null || int.tryParse(s) != null;
  }
}
