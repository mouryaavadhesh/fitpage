import 'package:dotted_line/dotted_line.dart';
import 'package:fitpage/domain/entites/stock_model.dart';
import 'package:fitpage/presentation/cubit/state/sotck_state.dart';
import 'package:fitpage/presentation/cubit/stock_cubit.dart';
import 'package:fitpage/utils/template/text.dart';
import 'package:fitpage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class StockList extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockCubit(context, StockInitial()),
      child: BlocBuilder<StockCubit, StockState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: state is StockLoading
                ? _loadingState()
                : state is StockLoaded
                    ? _body(context, state)
                    : 0.width,
          ),
        );
      }),
    );
  }

  _loadingState() {
    return const Center(
      child: SizedBox(
        width: 36,
        height: 36,
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _body(BuildContext context, StockLoaded stockLoaded) {
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
        SliverAnimatedList(
            key:context.read<StockCubit>().listKey,
            initialItemCount: stockLoaded.stockList.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))),
                child:  _stockCard(context, stockLoaded.stockList[index]),
              );
            },
        )
      ],
    );
  }



  _stockCard(BuildContext context, StockSignal stockSignal) {
    return Container(
        color: Colors.black,
        margin:const EdgeInsets.symmetric(horizontal: 5) ,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.white,
              dashGapLength: 1.0,
              dashGapColor: Colors.transparent,
            )
          ],
        )).onTap((){context.read<StockCubit>().navigateToFilter(stockSignal);});
  }
}
