// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final stockScreenerData = [
      {
        'id': 1,
        'name': 'Top gainers',
        'tag': 'Intraday Bullish',
        'color': 'green',
        'criteria': [
          {
            'type': 'plain_text',
            'text': 'Sort - %price change in descending order'
          }
        ]
      },
      {
        'id': 2,
        'name': 'Intraday buying seen in last 15 minutes',
        'tag': 'Bullish',
        'color': 'green',
        'criteria': [
          {
            'type': 'plain_text',
            'text': 'Current candle open = current candle high'
          },
          {
            'type': 'plain_text',
            'text': 'Previous candle open = previous candle high'
          },
          {
            'type': 'plain_text',
            'text': '2 previous candle’s open = 2 previous candle’s high'
          }
        ]
      },
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            itemCount: stockScreenerData.length,
            itemBuilder: (context, index) {
              final item = stockScreenerData[index];
              print("${item['name']}");
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item['name']}"),
                      const SizedBox(height: 8.0),
                      Text("${item['tag']}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    for (final item in stockScreenerData) {
      print("${item['name']}");
      expect(find.text("${item['name']}"), findsOneWidget);
      expect(find.text("${item['tag']}"), findsOneWidget);
    }
  });
}
