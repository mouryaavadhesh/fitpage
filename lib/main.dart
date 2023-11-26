import 'dart:async';

import 'package:fitpage/presentation/screen/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  bool isMainCalled = false;

  if (!isMainCalled) {
    isMainCalled = true;

    await initialize().then((value) async {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      ).then((_) {
        runApp(const StockApp());
      });
    });
  }
}

class StockApp extends StatefulWidget {
  const StockApp({Key? key}) : super(key: key);

  @override
  StockAppState createState() => StockAppState();
}

class StockAppState extends State<StockApp> {

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitpage Avadhesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StockList(),
    );
  }
}
