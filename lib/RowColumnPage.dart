import 'package:flutter/material.dart';

class RowColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row & Column Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nested Rows & Columns',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(color: Colors.red, height: 100, width: 100),
                  Column(
                    children: [
                      Container(color: Colors.blue, height: 50, width: 50),
                      SizedBox(height: 8),
                      Container(color: Colors.green, height: 50, width: 50),
                    ],
                  ),
                  Container(color: Colors.orange, height: 100, width: 100),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Responsive Layout',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(color: Colors.purple, height: 100),
                  ),
                  Expanded(
                    child: Container(color: Colors.cyan, height: 100),
                  ),
                  Expanded(
                    child: Container(color: Colors.amber, height: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}