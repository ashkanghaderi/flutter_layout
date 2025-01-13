import 'package:flutter/material.dart';
import 'FlowWidgetPage.dart';
import 'GridViewPage.dart';
import 'MiscellaneousPage.dart';
import 'RowColumnPage.dart';
import 'SliversPage.dart';
import 'CustomMultiChildLayoutPage.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Showcase',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> pages = [
    {'title': 'Row & Column', 'page': RowColumnPage()},
    {'title': 'GridView', 'page': GridViewPage()},
    {'title': 'Slivers', 'page': SliversPage()},
    {'title': 'Flow Widget', 'page': FlowWidgetPage()},
    {'title': 'Miscellaneous', 'page': MiscellaneousPage()},
    {'title': 'CustomMultiChildLayout', 'page': CustomMultiChildLayoutPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout Showcase')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]['page']),
              );
            },
            child: Card(
              elevation: 4,
              child: Center(
                child: Text(
                  pages[index]['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}